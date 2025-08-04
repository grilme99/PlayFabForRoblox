local fs = require("@lune/fs")
local process = require("@lune/process")

local buildUploadPlaceAsync = require("@test/utility/buildUploadPlaceAsync")
local executeLuauTaskAsync = require("@test/utility/executeLuauTaskAsync")

local function loadEnvFile()
    local envFile = require("@root/.env")
    return envFile
end

local function getApiKey(): string
    local keyInEnv = process.env.ROBLOX_OC_API_KEY
    if keyInEnv then
        return keyInEnv
    end

    local success, envFile = pcall(loadEnvFile)
    if not success then
        error(
            "No environment variable set for ROBLOX_OC_API_KEY. Please set it in the environment or in the .env.luau file."
        )
    end

    return envFile.ROBLOX_OC_API_KEY
end

local function loadTestConfig()
    local testConfig = require("@root/test-config")
    return testConfig
end

local function hasArg(requiredArg: string)
    for _, arg in process.args do
        if arg == requiredArg then
            return true
        end
    end
    return false
end

local function main()
    local apiKey = getApiKey()
    local testConfig = loadTestConfig()

    local verbose = hasArg("--verbose")
    local ci = hasArg("--ci")

    local jestScript = fs.readFile(".lune/test/bin/run-tests.luau")
    jestScript = jestScript:gsub("_G.__VERBOSE__", if verbose then "true" else "false")
    jestScript = jestScript:gsub("_G.__CI__", if ci then "true" else "false")

    local uploadResult = buildUploadPlaceAsync({
        universeId = testConfig.universeId,
        placeId = testConfig.placeId,
        apiKey = apiKey,
        filePath = testConfig.testPlaceFile,
        rojoProjectFile = testConfig.rojoProjectFile,
    })

    if uploadResult then
        local passed = executeLuauTaskAsync({
            universeId = testConfig.universeId,
            placeId = testConfig.placeId,
            placeVersion = uploadResult.versionNumber,
            apiKey = apiKey,
            script = jestScript,
        })

        if not passed then
            process.exit(1)
            return
        end
    end

    -- Explicitly exit because Lune sucks at async tasks
    process.exit(0)
end

main()
