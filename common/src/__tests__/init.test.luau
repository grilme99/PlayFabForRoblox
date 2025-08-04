local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages
local JestGlobals = require(Packages.JestGlobals)

local describe = JestGlobals.describe
local expect = JestGlobals.expect
local it = JestGlobals.it

local TestUtils = script.Parent.TestUtils
local MockSecret = require(TestUtils.MockSecret)

local Common = require(script.Parent.Parent)
local Settings = Common.settings

describe("getFullUrl", function()
	it("should return the correct full URL with string title ID", function()
		Settings.titleId = "titleId"
		Settings.requestGetParams = nil

		local urlPath = "/foo/bar"
		local fullUrl = Common.getFullUrl(urlPath)
		expect(fullUrl).toBe("https://titleId.playfabapi.com/foo/bar")
	end)

	it("should return the correct full URL with Secret title ID", function()
		local secret = MockSecret.new("titleId")

		Settings.titleId = secret :: any
		Settings.requestGetParams = nil

		local urlPath = "/foo/bar"
		local fullUrl: MockSecret.MockSecret = Common.getFullUrl(urlPath) :: any
		expect(fullUrl:_GetValue()).toBe("https://titleId.playfabapi.com/foo/bar")
	end)

	it("should return the correct full URL with get params", function()
		Settings.titleId = "titleId"
		Settings.requestGetParams = {
			foo = "bar",
		}

		local urlPath = "/foo/bar"
		local fullUrl = Common.getFullUrl(urlPath)
		expect(fullUrl).toBe("https://titleId.playfabapi.com/foo/bar?foo=bar")
	end)
end)
