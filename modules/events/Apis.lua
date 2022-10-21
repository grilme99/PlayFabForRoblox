--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writeevents
function Apis.WriteEventsAsync(
	entityToken: string, 
	request: Types.WriteEventsRequest
): Types.WriteEventsResponse
	return PlayFabInternal.MakeApiCall(
		"/Event/WriteEvents",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writetelemetryevents
function Apis.WriteTelemetryEventsAsync(
	entityToken: string, 
	request: Types.WriteEventsRequest
): Types.WriteEventsResponse
	return PlayFabInternal.MakeApiCall(
		"/Event/WriteTelemetryEvents",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

