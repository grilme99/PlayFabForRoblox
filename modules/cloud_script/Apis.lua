--!strict

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- Executes CloudScript with the entity profile that is defined in the request. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executeentitycloudscript
function Apis.ExecuteEntityCloudScriptAsync(
	entityToken: string, 
	request: Types.ExecuteEntityCloudScriptRequest
): Types.ExecuteCloudScriptResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ExecuteEntityCloudScript",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Executes an Azure Function with the profile of the entity that is defined in 
--- the request. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/executefunction
function Apis.ExecuteFunctionAsync(
	entityToken: string, 
	request: Types.ExecuteFunctionRequest
): Types.ExecuteFunctionResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ExecuteFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/getfunction
function Apis.GetFunctionAsync(
	entityToken: string, 
	request: Types.GetFunctionRequest
): Types.GetFunctionResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/GetFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listfunctions
function Apis.ListFunctionsAsync(
	entityToken: string, 
	request: Types.ListFunctionsRequest
): Types.ListFunctionsResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ListFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- A title can have many functions, ListHttpFunctions will return a list of all 
--- the currently registered HTTP triggered functions for a given title. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listhttpfunctions
function Apis.ListHttpFunctionsAsync(
	entityToken: string, 
	request: Types.ListFunctionsRequest
): Types.ListHttpFunctionsResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ListHttpFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/listqueuedfunctions
function Apis.ListQueuedFunctionsAsync(
	entityToken: string, 
	request: Types.ListFunctionsRequest
): Types.ListQueuedFunctionsResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/ListQueuedFunctions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforentitytriggeredaction
function Apis.PostFunctionResultForEntityTriggeredActionAsync(
	entityToken: string, 
	request: Types.PostFunctionResultForEntityTriggeredActionRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/PostFunctionResultForEntityTriggeredAction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforfunctionexecution
function Apis.PostFunctionResultForFunctionExecutionAsync(
	entityToken: string, 
	request: Types.PostFunctionResultForFunctionExecutionRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/PostFunctionResultForFunctionExecution",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforplayertriggeredaction
function Apis.PostFunctionResultForPlayerTriggeredActionAsync(
	entityToken: string, 
	request: Types.PostFunctionResultForPlayerTriggeredActionRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/PostFunctionResultForPlayerTriggeredAction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/postfunctionresultforscheduledtask
function Apis.PostFunctionResultForScheduledTaskAsync(
	entityToken: string, 
	request: Types.PostFunctionResultForScheduledTaskRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/PostFunctionResultForScheduledTask",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registerhttpfunction
function Apis.RegisterHttpFunctionAsync(
	entityToken: string, 
	request: Types.RegisterHttpFunctionRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/RegisterHttpFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- A title can have many functions, RegisterQueuedFunction associates a function 
--- name with a queue name and connection string. 
---
--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/registerqueuedfunction
function Apis.RegisterQueuedFunctionAsync(
	entityToken: string, 
	request: Types.RegisterQueuedFunctionRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/RegisterQueuedFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/cloudscript/server-side-cloud-script/unregisterfunction
function Apis.UnregisterFunctionAsync(
	entityToken: string, 
	request: Types.UnregisterFunctionRequest
): Types.EmptyResult
	return PlayFabInternal.MakeApiCall(
		"/CloudScript/UnregisterFunction",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

