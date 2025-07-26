local process = require("@lune/process")
local stdio = require("@lune/stdio")

local getApiSpecsAsync = require("./net/get-api-specs")
local buildPackage = require("./codegen/build-package")

local utility = require("./utility")
local tableHasValue = utility.tableHasValue

local Result = require("./vendor/result")
type Result<T, E> = Result.Result<T, E>

local function main(): Result<nil, string>
	local args = process.args

	-- Parse arguments
	local _publishPackages = tableHasValue(args, "--publish-packages")
	local help = tableHasValue(args, "--help")

	if help then
		print("Usage: lune run generator -- [--publish-packages] [--help]")
		print("Options:")
		print("  --publish-packages: Publish packages to Wally and Pesde for Lua and NPM for TypeScript")
		print("  --help: Display this help message")
		return Result.Ok(nil)
	end

	print("Fetching API specs")
	local apiSpecs, err = getApiSpecsAsync():unpack()
	if err then
		return Result.Err(err)
	end
	print(`Fetched {apiSpecs.apiCount} API specs. Now generating code.`)

	stdio.write(stdio.style("dim"))
	stdio.write(stdio.style("bold"))
	for apiName, api in apiSpecs.apis do
		local success, result = buildPackage({
			name = apiName,
			title = api.info.title,
			version = api.info.version,
			description = api.info.description,
		}):unpack()

		if not success then
			return Result.Err(result)
		end

		break
	end
	stdio.write(stdio.style("reset"))

	return Result.Ok(nil)
end

local _, err = main():unpack()
if err then
	stdio.write(stdio.color("red"))
	stdio.write(stdio.style("bold"))

	print("An error occurred:")
	print(err)

	stdio.write(stdio.style("reset"))
	return true
end
