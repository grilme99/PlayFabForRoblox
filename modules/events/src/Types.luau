--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

export type GetDataConnectionRequest = {
	--[[
		The name of the data connection to retrieve.

	]]
	Name: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type EventContents = {
	--[[
		The optional custom tags associated with the event (e.g. build number,
		external trace identifiers, etc.). Before an event is written, this collection
		and the base request custom tags will be merged, but not overriden. This
		enables the caller to specify static tags and per event tags.

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The original unique identifier associated with this event before it was posted
		to PlayFab. The value might differ from the EventId value, which is assigned
		when the event is received by the server.

	]]
	OriginalId: string?,
	--[[
		The name of this event.

	]]
	Name: string,
	--[[
		Arbitrary data associated with the event, represented as a JSON serialized
		string. Only one of Payload or PayloadJSON is allowed.

	]]
	PayloadJSON: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Arbitrary data associated with the event. Only one of Payload or PayloadJSON
		is allowed.

	]]
	Payload: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The time (in UTC) associated with this event when it occurred. If specified,
		this value is stored in the OriginalTimestamp property of the PlayStream
		event.

	]]
	OriginalTimestamp: string?,
	--[[
		The namespace in which the event is defined. Allowed namespaces can vary by
		API.

	]]
	EventNamespace: string,
}

export type SetTelemetryKeyActiveRequest = {
	--[[
		The name of the key to update.

	]]
	KeyName: string,
	--[[
		Whether to set the key to active (true) or deactivated (false).

	]]
	Active: boolean,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SetDataConnectionResponse = {
	DataConnection: DataConnectionDetails?,
}

export type DeleteTelemetryKeyResponse = {
	--[[
		Indicates whether or not the key was deleted. If false, no key with that name
		existed.

	]]
	WasKeyDeleted: boolean,
}

export type WriteEventsResponse = {
	--[[
		The unique identifiers assigned by the server to the events, in the same order
		as the events in the request. Only returned if FlushToPlayStream option is
		true.

	]]
	AssignedEventIds: { string }?,
}

export type WriteEventsRequest = {
	--[[
		The collection of events to write. Up to 200 events can be written per
		request.

	]]
	Events: { EventContents },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetTelemetryKeyResponse = {
	KeyDetails: TelemetryKeyDetails?,
}

export type DataConnectionAzureDataExplorerSettings = {
	--[[
		The database to write to.

	]]
	Database: string?,
	--[[
		The URI of the ADX cluster.

	]]
	ClusterUri: string?,
	--[[
		The table to write to.

	]]
	Table: string?,
}

export type CreateTelemetryKeyRequest = {
	--[[
		The name of the new key. Telemetry key names must be unique within the scope
		of the title.

	]]
	KeyName: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DataConnectionStatusDetails = {
	State: DataConnectionErrorState?,
	--[[
		A description of the error affecting the data connection, if any. This may be
		empty for some errors.

	]]
	ErrorMessage: string?,
	--[[
		The name of the error affecting the data connection, if any.

	]]
	Error: string?,
	--[[
		The most recent time of the error affecting the data connection, if any.

	]]
	MostRecentErrorTime: string?,
}

export type CreateTelemetryKeyResponse = {
	NewKeyDetails: TelemetryKeyDetails?,
}

export type DeleteDataConnectionResponse = {
	--[[
		Indicates whether or not the connection was deleted as part of the request.

	]]
	WasDeleted: boolean,
}

export type DataConnectionFabricKQLSettings = {
	--[[
		The database to write to.

	]]
	Database: string?,
	--[[
		The URI of the Fabric cluster.

	]]
	ClusterUri: string?,
	--[[
		The table to write to.

	]]
	Table: string?,
}

export type TelemetryKeyDetails = {
	--[[
		The name of the key. Telemetry key names are unique within the scope of the
		title.

	]]
	Name: string?,
	--[[
		When the key was created.

	]]
	CreateTime: string,
	--[[
		Whether or not the key is currently active. Deactivated keys cannot be used
		for telemetry ingestion.

	]]
	IsActive: boolean,
	--[[
		When the key was last updated.

	]]
	LastUpdateTime: string,
	--[[
		The key that can be distributed to clients for use during telemetry ingestion.

	]]
	KeyValue: string?,
}

export type SetTelemetryKeyActiveResponse = {
	KeyDetails: TelemetryKeyDetails?,
	--[[
		Indicates whether or not the key was updated. If false, the key was already in
		the desired state.

	]]
	WasKeyUpdated: boolean,
}

export type DeleteDataConnectionRequest = {
	--[[
		The name of the data connection to delete.

	]]
	Name: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SetDataConnectionActiveRequest = {
	--[[
		Whether to set the data connection to active (true) or deactivated (false).

	]]
	Active: boolean,
	--[[
		The name of the data connection to update.

	]]
	Name: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ListDataConnectionsResponse = {
	--[[
		The list of existing Data Connections.

	]]
	DataConnections: { DataConnectionDetails }?,
}

--[[
	Combined entity type and ID structure which uniquely identifies a single
	entity.

]]
export type EntityKey = {
	--[[
		Unique ID of the entity.

	]]
	Id: string,
	--[[
		Entity type. See
		https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types

	]]
	Type: string?,
}

export type DataConnectionAzureBlobSettings = {
	--[[
		Name of the storage account.

	]]
	AccountName: string?,
	--[[
		Name of the container.

	]]
	ContainerName: string?,
	--[[
		Azure Entra Tenant Id.

	]]
	TenantId: string?,
}

export type ListDataConnectionsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SetDataConnectionRequest = {
	Type: DataConnectionType,
	--[[
		The name of the data connection to update or create.

	]]
	Name: string,
	ConnectionSettings: DataConnectionSettings,
	--[[
		Whether or not the connection is currently active.

	]]
	IsActive: boolean,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SetDataConnectionActiveResponse = {
	DataConnection: DataConnectionDetails?,
	--[[
		Indicates whether or not the data connection was updated. If false, the data
		connection was already in the desired state.

	]]
	WasUpdated: boolean,
}

export type ListTelemetryKeysRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DataConnectionSettings = {
	AzureDataExplorerSettings: DataConnectionAzureDataExplorerSettings?,
	AzureBlobSettings: DataConnectionAzureBlobSettings?,
	AzureFabricKQLSettings: DataConnectionFabricKQLSettings?,
}

export type GetDataConnectionResponse = {
	DataConnection: DataConnectionDetails?,
}

--[[
	The basic wrapper around every failed API response

]]
export type ApiErrorWrapper = {
	--[[
		Detailed description of individual issues with the request object

	]]
	errorDetails: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Numerical HTTP code

	]]
	code: number,
	--[[
		String HTTP code

	]]
	status: string?,
	--[[
		Numerical PlayFab error code

	]]
	errorCode: number,
	--[[
		Playfab error code

	]]
	error: string?,
	--[[
		Description for the PlayFab errorCode

	]]
	errorMessage: string?,
}

export type DataConnectionDetails = {
	Type: DataConnectionType,
	--[[
		The name of the data connection.

	]]
	Name: string,
	Status: DataConnectionStatusDetails?,
	--[[
		Whether or not the connection is currently active.

	]]
	IsActive: boolean,
	ConnectionSettings: DataConnectionSettings,
}

export type ListTelemetryKeysResponse = {
	--[[
		The telemetry keys configured for the title.

	]]
	KeyDetails: { TelemetryKeyDetails }?,
}

export type GetTelemetryKeyRequest = {
	--[[
		The name of the key to retrieve.

	]]
	KeyName: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DataConnectionErrorState = 
	| "OK"
	| "Error"

export type DataConnectionType = 
	| "AzureBlobStorage"
	| "AzureDataExplorer"
	| "FabricKQL"

export type DeleteTelemetryKeyRequest = {
	--[[
		The name of the key to delete.

	]]
	KeyName: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}



return nil
