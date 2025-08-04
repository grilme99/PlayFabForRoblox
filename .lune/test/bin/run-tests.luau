local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local Jest = require(Packages.Jest)

local PACKAGE_ROOTS = {
    Packages.PlayFabCommon,
}

local status, result = Jest.runCLI(ReplicatedStorage, {
    verbose = _G.__VERBOSE__,
    ci = _G.__CI__,
    passWithNoTests = true,
}, PACKAGE_ROOTS):awaitStatus()

if status == "Rejected" or result.results.numFailedTests > 0 then
    error(result)
end

return nil
