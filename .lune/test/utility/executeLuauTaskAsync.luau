local net = require("@lune/net")
local serde = require("@lune/serde")
local stdio = require("@lune/stdio")
local task = require("@lune/task")

local createSpinner = require("./createSpinner")
local richPrint = require("./richPrint")

local types = require("../types")
type LuauExecutionSessionTask = types.LuauExecutionSessionTask
type LuauExecutionSessionTaskLog = types.LuauExecutionSessionTaskLog

type Array<T> = { T }

local BASE_URL = "https://apis.roblox.com"

export type ExecuteTaskOptions = {
    universeId: number,
    placeId: number,
    placeVersion: number,

    apiKey: string,

    script: string,
}

local function executeLuauTaskAsync(options: ExecuteTaskOptions)
    local universeId = options.universeId
    local placeId = options.placeId
    local placeVersion = options.placeVersion
    local apiKey = options.apiKey
    local script = options.script

    local executionTask: LuauExecutionSessionTask? = nil

    local function createTaskAsync(): boolean
        local spinner = createSpinner()
        spinner.setText("Creating execution task...")
        spinner.start()

        local res = net.request({
            url = `{BASE_URL}/cloud/v2/universes/{universeId}/places/{placeId}/versions/{placeVersion}/luau-execution-session-tasks`,
            method = "POST",
            body = serde.encode("json", {
                script = script,
            }),
            headers = {
                ["x-api-key"] = apiKey,
                ["Content-Type"] = "application/json",
                ["Accept"] = "application/json",
            },
        })

        spinner.stop()

        local decodedBody = serde.decode("json", res.body)
        if res.ok then
            executionTask = decodedBody
            return true
        else
            richPrint("red", "bold", `Failed to create execution task ({res.statusMessage})`)
            print(decodedBody)
            return false
        end
    end

    local function pollForTaskCompletionAsync(): boolean
        if executionTask == nil then
            error("Execution task is nil")
        end

        local spinner = createSpinner()
        spinner.setText("Waiting for task to complete...")
        spinner.start()

        while true do
            local res = net.request({
                url = `{BASE_URL}/cloud/v2/{executionTask.path}`,
                method = "GET",
                headers = {
                    ["x-api-key"] = apiKey,
                    ["Accept"] = "application/json",
                },
            })

            local decodedBody = serde.decode("json", res.body)
            if not res.ok then
                spinner.stop()
                richPrint("red", "bold", `Execution task failed`)
                print(decodedBody)
                return false
            end

            executionTask = decodedBody
            if executionTask.state ~= "PROCESSING" and executionTask.state ~= "QUEUED" then
                spinner.stop()
                return executionTask.state == "COMPLETE"
            end

            task.wait(1)
        end

        spinner.stop()
    end

    local function getTaskLogsAsync(): Array<string>
        if executionTask == nil then
            error("Execution task is nil")
        end

        local spinner = createSpinner()
        spinner.setText("Fetching task logs...")
        spinner.start()

        local res = net.request({
            url = `{BASE_URL}/cloud/v2/{executionTask.path}/logs`,
            method = "GET",
            headers = {
                ["x-api-key"] = apiKey,
                ["Accept"] = "application/json",
            },
        })

        spinner.stop()

        local decodedBody: LuauExecutionSessionTaskLog = serde.decode("json", res.body)
        if not res.ok then
            richPrint("red", "bold", `Failed to fetch task logs ({res.statusMessage})`)
            print(decodedBody)
            return {}
        end

        local logs: Array<string> = {}
        for _, log in decodedBody.luauExecutionSessionTaskLogs do
            for _, message in ipairs(log.messages) do
                table.insert(logs, message)
            end
        end

        return logs
    end

    local createTaskSuccess = createTaskAsync()
    if not createTaskSuccess then
        return false
    end

    local pollTaskSuccess = pollForTaskCompletionAsync()

    local logs = getTaskLogsAsync()
    for _, message in logs do
        stdio.write(message .. `\n`)
    end

    return pollTaskSuccess
end

return executeLuauTaskAsync
