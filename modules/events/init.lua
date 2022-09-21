--!strict
--[=[
	# EventsApi

	Write custom PlayStream and Telemetry events for any PlayFab entity. Telemetry 
	events can be used for analytic, reporting, or debugging. PlayStream events 
	can do all of that and also trigger custom actions in near real-time. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local EventsApi = {}

function EventsApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

export type EventContents = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the event (e.g. build number, external trace identifiers, etc.). Before an event is written, this collection and the base request custom tags will be merged, but not overriden. This enables the caller to specify static tags and per event tags.
	Entity: EntityKey?, --- Entity associated with the event. If null, the event will apply to the calling entity.
	EventNamespace: string, --- The namespace in which the event is defined. Allowed namespaces can vary by API.
	Name: string, --- The name of this event.
	OriginalId: string?, --- The original unique identifier associated with this event before it was posted to PlayFab. The value might differ from the EventId value, which is assigned when the event is received by the server.
	OriginalTimestamp: string?, --- The time (in UTC) associated with this event when it occurred. If specified, this value is stored in the OriginalTimestamp property of the PlayStream event.
	Payload: {[any]: any}?, --- Arbitrary data associated with the event. Only one of Payload or PayloadJSON is allowed.
	PayloadJSON: string?, --- Arbitrary data associated with the event, represented as a JSON serialized string. Only one of Payload or PayloadJSON is allowed.
}

export type WriteEventsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Events: {EventContents}, --- Collection of events to write to PlayStream.
}

export type WriteEventsResponse = {
	AssignedEventIds: {any}?, --- The unique identifiers assigned by the server to the events, in the same order as the events in the request. Only returned if FlushToPlayStream option is true.
}


--- https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writeevents
function EventsApi.WriteEventsAsync(
	entityToken: string, 
	request: WriteEventsRequest
): WriteEventsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Events/WriteEvents",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writetelemetryevents
function EventsApi.WriteTelemetryEventsAsync(
	entityToken: string, 
	request: WriteEventsRequest
): WriteEventsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Events/WriteTelemetryEvents",
		request,
		"X-EntityToken",
		entityToken
	)
end

return EventsApi

