--!strict

local Types = {}

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	--- Numerical HTTP code 
	code: number,
	--- Playfab error code 
	error: string?,
	--- Numerical PlayFab error code 
	errorCode: number,
	--- Detailed description of individual issues with the request object 
	errorDetails: {[any]: any}?,
	--- Description for the PlayFab errorCode 
	errorMessage: string?,
	--- String HTTP code 
	status: string?,
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

export type EventContents = {
	--- The optional custom tags associated with the event (e.g. build number, external 
	--- trace identifiers, etc.). Before an event is written, this collection and the 
	--- base request custom tags will be merged, but not overriden. This enables the 
	--- caller to specify static tags and per event tags. 
	CustomTags: {[any]: any}?,
	--- Entity associated with the event. If null, the event will apply to the calling 
	--- entity. 
	Entity: EntityKey?,
	--- The namespace in which the event is defined. Allowed namespaces can vary by 
	--- API. 
	EventNamespace: string,
	--- The name of this event. 
	Name: string,
	--- The original unique identifier associated with this event before it was posted 
	--- to PlayFab. The value might differ from the EventId value, which is assigned 
	--- when the event is received by the server. 
	OriginalId: string?,
	--- The time (in UTC) associated with this event when it occurred. If specified, 
	--- this value is stored in the OriginalTimestamp property of the PlayStream event. 
	OriginalTimestamp: string?,
	--- Arbitrary data associated with the event. Only one of Payload or PayloadJSON 
	--- is allowed. 
	Payload: {[any]: any}?,
	--- Arbitrary data associated with the event, represented as a JSON serialized string. 
	--- Only one of Payload or PayloadJSON is allowed. 
	PayloadJSON: string?,
}

export type WriteEventsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Collection of events to write to PlayStream. 
	Events: {EventContents},
}

export type WriteEventsResponse = {
	--- The unique identifiers assigned by the server to the events, in the same order 
	--- as the events in the request. Only returned if FlushToPlayStream option is true. 
	AssignedEventIds: {any}?,
}


return Types

