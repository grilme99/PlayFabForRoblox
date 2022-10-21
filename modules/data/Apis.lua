--!strict

local PlayFabInternal = require(script.Parent.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)

local Apis = {}

--- Aborts the pending upload of the requested files. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/abortfileuploads
function Apis.AbortFileUploadsAsync(
	entityToken: string, 
	request: Types.AbortFileUploadsRequest
): Types.AbortFileUploadsResponse
	return PlayFabInternal.MakeApiCall(
		"/File/AbortFileUploads",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes the requested files from the entity's profile. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/deletefiles
function Apis.DeleteFilesAsync(
	entityToken: string, 
	request: Types.DeleteFilesRequest
): Types.DeleteFilesResponse
	return PlayFabInternal.MakeApiCall(
		"/File/DeleteFiles",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Finalizes the upload of the requested files. Verifies that the files have been 
--- successfully uploaded and moves the file pointers from pending to live. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/finalizefileuploads
function Apis.FinalizeFileUploadsAsync(
	entityToken: string, 
	request: Types.FinalizeFileUploadsRequest
): Types.FinalizeFileUploadsResponse
	return PlayFabInternal.MakeApiCall(
		"/File/FinalizeFileUploads",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns URLs that may be used to download the files for a profile for a limited 
--- length of time. Only returns files that have been successfully uploaded, files 
--- that are still pending will either return the old value, if it exists, or nothing. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/getfiles
function Apis.GetFilesAsync(
	entityToken: string, 
	request: Types.GetFilesRequest
): Types.GetFilesResponse
	return PlayFabInternal.MakeApiCall(
		"/File/GetFiles",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns URLs that may be used to upload the files for a profile 5 minutes. After 
--- using the upload calls FinalizeFileUploads must be called to move the file status 
--- from pending to live. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/initiatefileuploads
function Apis.InitiateFileUploadsAsync(
	entityToken: string, 
	request: Types.InitiateFileUploadsRequest
): Types.InitiateFileUploadsResponse
	return PlayFabInternal.MakeApiCall(
		"/File/InitiateFileUploads",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets JSON objects from an entity profile and returns it.  
---
--- https://docs.microsoft.com/rest/api/playfab/data/object/getobjects
function Apis.GetObjectsAsync(
	entityToken: string, 
	request: Types.GetObjectsRequest
): Types.GetObjectsResponse
	return PlayFabInternal.MakeApiCall(
		"/Object/GetObjects",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Sets JSON objects on the requested entity profile. May include a version number 
--- to be used to perform optimistic concurrency operations during update. If the 
--- current version differs from the version in the request the request will be 
--- ignored. If no version is set on the request then the value will always be updated 
--- if the values differ. Using the version value does not guarantee a write though, 
--- ConcurrentEditError may still occur if multiple clients are attempting to update 
--- the same profile.  
---
--- https://docs.microsoft.com/rest/api/playfab/data/object/setobjects
function Apis.SetObjectsAsync(
	entityToken: string, 
	request: Types.SetObjectsRequest
): Types.SetObjectsResponse
	return PlayFabInternal.MakeApiCall(
		"/Object/SetObjects",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis

