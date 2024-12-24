local MockSecret = {}
MockSecret.__index = MockSecret

function MockSecret.new(value: string)
	local self = setmetatable({}, MockSecret)
	self.value = value
	return self
end

export type MockSecret = typeof(MockSecret.new(...))

function MockSecret._GetValue(self: MockSecret): string
	return self.value
end

function MockSecret.AddPrefix(self: MockSecret, prefix: string): MockSecret
	local newSecret = MockSecret.new(prefix .. self.value)
	return newSecret
end

function MockSecret.AddSuffix(self: MockSecret, suffix: string): MockSecret
	local newSecret = MockSecret.new(self.value .. suffix)
	return newSecret
end

return {
	new = MockSecret.new,
}
