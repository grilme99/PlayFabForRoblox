local PackageRoot = script.Parent.Parent
local Settings = require(PackageRoot.Settings)

--[[
    Given a URL path, returns the full URL with the title ID and production URL.
    This could return a string or `Secret` object, depending on how the title ID
    is set.
]]
local function getFullUrl(urlPath: string): string | Secret
    local fullUrl: string | Secret
    local titleId = Settings.titleId
    if Settings.verticalName then
        fullUrl = `https://{Settings.verticalName}{Settings.productionUrl}{urlPath}`
    else
        if type(titleId) == "string" then
            fullUrl = `https://{titleId}{Settings.productionUrl}{urlPath}`
        else
            -- This is a Secret object
            local first = titleId:AddPrefix("https://")
            fullUrl = first:AddSuffix(`{Settings.productionUrl}{urlPath}`)
        end
    end

    local getParams = Settings.requestGetParams
    local queryString = ""

    if getParams then
        local firstParam = true
        for key, value in getParams do
            if firstParam then
                queryString ..= "?"
                firstParam = false
            else
                queryString ..= "&"
            end

            queryString ..= key .. "=" .. value
        end
    end

    if type(fullUrl) == "string" then
        fullUrl ..= queryString
    else
        fullUrl = fullUrl:AddSuffix(queryString)
    end

    return fullUrl
end

return getFullUrl
