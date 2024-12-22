local exports = {}

local function tableHasValue<T>(tbl: { T }, value: T): boolean
	for _, v in tbl do
		if v == value then
			return true
		end
	end
	return false
end
exports.tableHasValue = tableHasValue

return exports
