local PackageRoot = script.Parent.Parent.Parent

local Packages = PackageRoot.Parent
local JestGlobals = require(Packages.JestGlobals)

local Secret = require(PackageRoot.__mocks__.Secret)

local describe = JestGlobals.describe
local beforeEach = JestGlobals.beforeEach
local afterEach = JestGlobals.afterEach
local jest = JestGlobals.jest
local expect = JestGlobals.expect
local it = JestGlobals.it

describe("getFullUrl", function()
    beforeEach(function()
        jest.resetModules()
    end)
    afterEach(function()
        jest.resetModules()
    end)

    it("should return the correct full URL with vertical name", function()
        local Settings = require(PackageRoot.Settings)
        local getFullUrl = require(PackageRoot.Utility.getFullUrl)

        Settings.verticalName = "verticalName"
        Settings.requestGetParams = nil

        local urlPath = "/foo/bar"
        local fullUrl = getFullUrl(urlPath)
        expect(fullUrl).toBe("https://verticalName.playfabapi.com/foo/bar")
    end)

    it("should return the correct full URL with string title ID", function()
        local Settings = require(PackageRoot.Settings)
        local getFullUrl = require(PackageRoot.Utility.getFullUrl)

        Settings.titleId = "titleId"
        Settings.requestGetParams = nil

        local urlPath = "/foo/bar"
        local fullUrl = getFullUrl(urlPath)
        expect(fullUrl).toBe("https://titleId.playfabapi.com/foo/bar")
    end)

    it("should return the correct full URL with Secret title ID", function()
        local Settings = require(PackageRoot.Settings)
        local getFullUrl = require(PackageRoot.Utility.getFullUrl)

        local secret = Secret.new("titleId")

        Settings.titleId = secret :: any
        Settings.requestGetParams = nil

        local urlPath = "/foo/bar"
        local fullUrl: Secret.MockSecret = getFullUrl(urlPath) :: any
        expect(fullUrl:_GetValue()).toBe("https://titleId.playfabapi.com/foo/bar")
    end)

    it("should return the correct full URL with get params", function()
        local Settings = require(PackageRoot.Settings)
        local getFullUrl = require(PackageRoot.Utility.getFullUrl)

        Settings.titleId = "titleId"
        Settings.requestGetParams = {
            foo = "bar",
        }

        local urlPath = "/foo/bar"
        local fullUrl = getFullUrl(urlPath)
        expect(fullUrl).toBe("https://titleId.playfabapi.com/foo/bar?foo=bar")
    end)
end)
