--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Generate an entity PlayStream event for the provided function result.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforfunctionexecution).

]]
function Apis.PostFunctionResultForFunctionExecution(request: Types.PostFunctionResultForFunctionExecutionRequest, entityToken: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/CloudScript/PostFunctionResultForFunctionExecution",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Generate an entity PlayStream event for the provided function result.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforentitytriggeredaction).

]]
function Apis.PostFunctionResultForEntityTriggeredAction(request: Types.PostFunctionResultForEntityTriggeredActionRequest, entityToken: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/CloudScript/PostFunctionResultForEntityTriggeredAction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Cloud Script is one of PlayFab's most versatile features. It allows client
	code to request execution of any kind of custom server-side functionality
	you can implement, and it can be used in conjunction with virtually
	anything.

	Executes an Azure Function with the profile of the entity that is defined in
	the request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executefunction).

	### Errors
	- CloudScriptAzureFunctionsArgumentSizeExceeded
	- CloudScriptAzureFunctionsEventHubRequestError
	- CloudScriptAzureFunctionsExecutionTimeLimitExceeded
	- CloudScriptAzureFunctionsHTTPRequestError
	- CloudScriptAzureFunctionsQueueRequestError
	- CloudScriptAzureFunctionsReturnSizeExceeded
	- InvalidEntityType

]]
function Apis.ExecuteFunction(request: Types.ExecuteFunctionRequest, entityToken: string): Result<Types.ExecuteFunctionResult, string>
	return makeApiCall(
		"/CloudScript/ExecuteFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Registers a queue triggered Azure Function with a title.

	A title can have many functions, RegisterQueuedFunction associates a
	function name with a queue name and connection string.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registerqueuedfunction).

]]
function Apis.RegisterQueuedFunction(request: Types.RegisterQueuedFunctionRequest, entityToken: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/CloudScript/RegisterQueuedFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all currently registered Event Hub triggered Azure Functions for a
	given title.

	A title can have many functions, ListHttpFunctions will return a list of all
	the currently registered HTTP triggered functions for a given title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listeventhubfunctions).

]]
function Apis.ListEventHubFunctions(request: Types.ListFunctionsRequest, entityToken: string): Result<Types.ListEventHubFunctionsResult, string>
	return makeApiCall(
		"/CloudScript/ListEventHubFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all currently registered Queue triggered Azure Functions for a given
	title.

	A title can have many functions, ListHttpFunctions will return a list of all
	the currently registered HTTP triggered functions for a given title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listqueuedfunctions).

]]
function Apis.ListQueuedFunctions(request: Types.ListFunctionsRequest, entityToken: string): Result<Types.ListQueuedFunctionsResult, string>
	return makeApiCall(
		"/CloudScript/ListQueuedFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Generate a PlayStream event for the provided function result.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforscheduledtask).

]]
function Apis.PostFunctionResultForScheduledTask(request: Types.PostFunctionResultForScheduledTaskRequest, entityToken: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/CloudScript/PostFunctionResultForScheduledTask",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all currently registered Azure Functions for a given title.

	A title can have many functions, ListHttpFunctions will return a list of all
	the currently registered HTTP triggered functions for a given title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listfunctions).

]]
function Apis.ListFunctions(request: Types.ListFunctionsRequest, entityToken: string): Result<Types.ListFunctionsResult, string>
	return makeApiCall(
		"/CloudScript/ListFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Cloud Script is one of PlayFab's most versatile features. It allows client
	code to request execution of any kind of custom server-side functionality
	you can implement, and it can be used in conjunction with virtually
	anything.

	Executes CloudScript with the entity profile that is defined in the request.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executeentitycloudscript).

	### Errors
	- CloudScriptAPIRequestCountExceeded
	- CloudScriptAPIRequestError
	- CloudScriptFunctionArgumentSizeExceeded
	- CloudScriptHTTPRequestError
	- CloudScriptNotFound
	- InvalidEntityType
	- JavascriptException
	- TitleDeleted

]]
function Apis.ExecuteEntityCloudScript(request: Types.ExecuteEntityCloudScriptRequest, entityToken: string): Result<Types.ExecuteCloudScriptResult, string>
	return makeApiCall(
		"/CloudScript/ExecuteEntityCloudScript",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Registers an HTTP triggered Azure function with a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registerhttpfunction).

]]
function Apis.RegisterHttpFunction(request: Types.RegisterHttpFunctionRequest, entityToken: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/CloudScript/RegisterHttpFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets registered Azure Functions for a given title id and function name.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/getfunction).

	### Errors
	- CloudScriptNotFound

]]
function Apis.GetFunction(request: Types.GetFunctionRequest, entityToken: string): Result<Types.GetFunctionResult, string>
	return makeApiCall(
		"/CloudScript/GetFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Generate a player PlayStream event for the provided function result.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforplayertriggeredaction).

]]
function Apis.PostFunctionResultForPlayerTriggeredAction(request: Types.PostFunctionResultForPlayerTriggeredActionRequest, entityToken: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/CloudScript/PostFunctionResultForPlayerTriggeredAction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Registers an event hub triggered Azure Function with a title.

	A title can have many functions, RegisterEventHubFunction associates a
	function name with an event hub name and connection string.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registereventhubfunction).

]]
function Apis.RegisterEventHubFunction(request: Types.RegisterEventHubFunctionRequest, entityToken: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/CloudScript/RegisterEventHubFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists all currently registered HTTP triggered Azure Functions for a given
	title.

	A title can have many functions, ListHttpFunctions will return a list of all
	the currently registered HTTP triggered functions for a given title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listhttpfunctions).

]]
function Apis.ListHttpFunctions(request: Types.ListFunctionsRequest, entityToken: string): Result<Types.ListHttpFunctionsResult, string>
	return makeApiCall(
		"/CloudScript/ListHttpFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Unregisters an Azure Function with a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/unregisterfunction).

	### Errors
	- CloudScriptNotFound

]]
function Apis.UnregisterFunction(request: Types.UnregisterFunctionRequest, entityToken: string): Result<Types.EmptyResult, string>
	return makeApiCall(
		"/CloudScript/UnregisterFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
