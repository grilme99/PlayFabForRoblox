--!strict
--[=[
	# EventsApi

	Write custom PlayStream and Telemetry events for any PlayFab entity. Telemetry 
	events can be used for analytic, reporting, or debugging. PlayStream events 
	can do all of that and also trigger custom actions in near real-time. 

	API Version: 1.221007.3
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Types)

local EventsApi = require(script.Apis)

function EventsApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type ApiErrorWrapper = Types.ApiErrorWrapper
export type EntityKey = Types.EntityKey
export type EventContents = Types.EventContents
export type WriteEventsRequest = Types.WriteEventsRequest
export type WriteEventsResponse = Types.WriteEventsResponse

return EventsApi

