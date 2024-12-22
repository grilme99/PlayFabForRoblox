local process = require("@lune/process")

local getApiSpecsAsync = require("./net/get-api-specs")

local utility = require("./utility")
local tableHasValue = utility.tableHasValue

local function main()
	local args = process.args

	-- Parse arguments
	local _publishPackages = tableHasValue(args, "--publish-packages")
	local help = tableHasValue(args, "--help")

	if help then
		print("Usage: lune run generator -- [--publish-packages] [--help]")
		print("Options:")
		print("  --publish-packages: Publish packages to Wally and Pesde for Lua and NPM for TypeScript")
		print("  --help: Display this help message")
		return
	end

	print("Fetching API specs")
	local apiSpecs, err = getApiSpecsAsync():unpack()
	if err then
		print("Failed to fetch API specs: " .. err)
		return process.exit(1)
	end
	print(`Fetched {#apiSpecs.apis} API specs. Now generating code.`)
end

main()
