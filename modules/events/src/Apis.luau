--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Lists all telemetry keys configured for the title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/listtelemetrykeys).

]]
function Apis.ListTelemetryKeys(request: Types.ListTelemetryKeysRequest, entityToken: string): Result<Types.ListTelemetryKeysResponse, string>
	return makeApiCall(
		"/Event/ListTelemetryKeys",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information about a telemetry key configured for the title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/gettelemetrykey).

	### Errors
	- TelemetryKeyNotFound

]]
function Apis.GetTelemetryKey(request: Types.GetTelemetryKeyRequest, entityToken: string): Result<Types.GetTelemetryKeyResponse, string>
	return makeApiCall(
		"/Event/GetTelemetryKey",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a telemetry key configured for the title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/deletetelemetrykey).

]]
function Apis.DeleteTelemetryKey(request: Types.DeleteTelemetryKeyRequest, entityToken: string): Result<Types.DeleteTelemetryKeyResponse, string>
	return makeApiCall(
		"/Event/DeleteTelemetryKey",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Write batches of entity based events to as Telemetry events (bypass
	PlayStream). The namespace must be 'custom' or start with 'custom.'



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writetelemetryevents).

	### Errors
	- EncryptionKeyBroken
	- EventEntityNotAllowed
	- EventNamespaceNotAllowed
	- InvalidEventContents
	- InvalidJSONContent
	- PerEntityEventRateLimitExceeded
	- TelemetryKeyDeactivated
	- TelemetryKeyInvalid

]]
function Apis.WriteTelemetryEvents(request: Types.WriteEventsRequest, entityToken: string): Result<Types.WriteEventsResponse, string>
	return makeApiCall(
		"/Event/WriteTelemetryEvents",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves a single Data Connection associated with a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/getdataconnection).

	### Errors
	- EventSinkNotFound
	- ServiceUnavailable

]]
function Apis.GetDataConnection(request: Types.GetDataConnectionRequest, entityToken: string): Result<Types.GetDataConnectionResponse, string>
	return makeApiCall(
		"/Event/GetDataConnection",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Sets a telemetry key to the active or deactivated state.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/settelemetrykeyactive).

	### Errors
	- TelemetryKeyNotFound

]]
function Apis.SetTelemetryKeyActive(request: Types.SetTelemetryKeyActiveRequest, entityToken: string): Result<Types.SetTelemetryKeyActiveResponse, string>
	return makeApiCall(
		"/Event/SetTelemetryKeyActive",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves the list of Data Connections associated with a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/listdataconnections).

]]
function Apis.ListDataConnections(request: Types.ListDataConnectionsRequest, entityToken: string): Result<Types.ListDataConnectionsResponse, string>
	return makeApiCall(
		"/Event/ListDataConnections",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates or updates a Data Connection on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/setdataconnection).

	### Errors
	- BillingInformationRequired
	- EventSinkConnectionInvalid
	- EventSinkConnectionUnauthorized
	- EventSinkDatabaseNotFound
	- EventSinkInsufficientRoleAssignment
	- EventSinkLimitExceeded
	- EventSinkRegionInvalid
	- EventSinkSasTokenInvalid
	- EventSinkSasTokenPermissionInvalid
	- EventSinkSecretInvalid
	- EventSinkTenantIdInvalid
	- EventSinkTitleUnauthorized
	- ServiceUnavailable

]]
function Apis.SetDataConnection(request: Types.SetDataConnectionRequest, entityToken: string): Result<Types.SetDataConnectionResponse, string>
	return makeApiCall(
		"/Event/SetDataConnection",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a new telemetry key for the title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/createtelemetrykey).

	### Errors
	- TelemetryKeyAlreadyExists
	- TelemetryKeyCountOverLimit
	- TelemetryKeyInvalidName
	- TelemetryKeyLongInsightsRetentionNotAllowed

]]
function Apis.CreateTelemetryKey(request: Types.CreateTelemetryKeyRequest, entityToken: string): Result<Types.CreateTelemetryKeyResponse, string>
	return makeApiCall(
		"/Event/CreateTelemetryKey",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a Data Connection from a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/deletedataconnection).

	### Errors
	- EventSinkNotFound
	- ServiceUnavailable

]]
function Apis.DeleteDataConnection(request: Types.DeleteDataConnectionRequest, entityToken: string): Result<Types.DeleteDataConnectionResponse, string>
	return makeApiCall(
		"/Event/DeleteDataConnection",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Sets a Data Connection for the title to either the active or deactivated
	state.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/setdataconnectionactive).

	### Errors
	- BillingInformationRequired
	- EventSinkConnectionInvalid
	- EventSinkConnectionUnauthorized
	- EventSinkDatabaseNotFound
	- EventSinkInsufficientRoleAssignment
	- EventSinkLimitExceeded
	- EventSinkNotFound
	- EventSinkRegionInvalid
	- EventSinkSasTokenInvalid
	- EventSinkSasTokenPermissionInvalid
	- EventSinkSecretInvalid
	- EventSinkTenantIdInvalid
	- EventSinkTitleUnauthorized
	- ServiceUnavailable

]]
function Apis.SetDataConnectionActive(request: Types.SetDataConnectionActiveRequest, entityToken: string): Result<Types.SetDataConnectionActiveResponse, string>
	return makeApiCall(
		"/Event/SetDataConnectionActive",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Write batches of entity based events to PlayStream. The namespace of the
	Event must be 'custom' or start with 'custom.'.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writeevents).

	### Errors
	- EncryptionKeyBroken
	- EventEntityNotAllowed
	- EventNamespaceNotAllowed
	- InvalidEventContents
	- InvalidJSONContent
	- PerEntityEventRateLimitExceeded

]]
function Apis.WriteEvents(request: Types.WriteEventsRequest, entityToken: string): Result<Types.WriteEventsResponse, string>
	return makeApiCall(
		"/Event/WriteEvents",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
