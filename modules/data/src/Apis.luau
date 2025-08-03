--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Initiates file uploads to an entity's profile.

	Returns URLs that may be used to upload the files for a profile 5 minutes.
	After using the upload calls FinalizeFileUploads must be called to move the
	file status from pending to live.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/data/file/initiatefileuploads).

	### Errors
	- EntityFileOperationPending

]]
function Apis.InitiateFileUploads(request: Types.InitiateFileUploadsRequest, entityToken: string): Result<Types.InitiateFileUploadsResponse, string>
	return makeApiCall(
		"/File/InitiateFileUploads",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves objects from an entity's profile.

	Gets JSON objects from an entity profile and returns it.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/data/object/getobjects).

]]
function Apis.GetObjects(request: Types.GetObjectsRequest, entityToken: string): Result<Types.GetObjectsResponse, string>
	return makeApiCall(
		"/Object/GetObjects",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Finalize file uploads to an entity's profile.

	Finalizes the upload of the requested files. Verifies that the files have
	been successfully uploaded and moves the file pointers from pending to live.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/data/file/finalizefileuploads).

	### Errors
	- FileNotFound
	- NoEntityFileOperationPending

]]
function Apis.FinalizeFileUploads(request: Types.FinalizeFileUploadsRequest, entityToken: string): Result<Types.FinalizeFileUploadsResponse, string>
	return makeApiCall(
		"/File/FinalizeFileUploads",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Abort pending file uploads to an entity's profile.

	Aborts the pending upload of the requested files.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/data/file/abortfileuploads).

	### Errors
	- FileNotFound
	- NoEntityFileOperationPending

]]
function Apis.AbortFileUploads(request: Types.AbortFileUploadsRequest, entityToken: string): Result<Types.AbortFileUploadsResponse, string>
	return makeApiCall(
		"/File/AbortFileUploads",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Delete files on an entity's profile.

	Deletes the requested files from the entity's profile.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/data/file/deletefiles).

	### Errors
	- EntityFileOperationPending
	- FileNotFound

]]
function Apis.DeleteFiles(request: Types.DeleteFilesRequest, entityToken: string): Result<Types.DeleteFilesResponse, string>
	return makeApiCall(
		"/File/DeleteFiles",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Retrieves file metadata from an entity's profile.

	Returns URLs that may be used to download the files for a profile for a
	limited length of time. Only returns files that have been successfully
	uploaded, files that are still pending will either return the old value, if
	it exists, or nothing.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/data/file/getfiles).

]]
function Apis.GetFiles(request: Types.GetFilesRequest, entityToken: string): Result<Types.GetFilesResponse, string>
	return makeApiCall(
		"/File/GetFiles",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Sets objects on an entity's profile.

	Sets JSON objects on the requested entity profile. May include a version
	number to be used to perform optimistic concurrency operations during
	update. If the current version differs from the version in the request the
	request will be ignored. If no version is set on the request then the value
	will always be updated if the values differ. Using the version value does
	not guarantee a write though, ConcurrentEditError may still occur if
	multiple clients are attempting to update the same profile.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/data/object/setobjects).

	### Errors
	- InvalidJSONContent

]]
function Apis.SetObjects(request: Types.SetObjectsRequest, entityToken: string): Result<Types.SetObjectsResponse, string>
	return makeApiCall(
		"/Object/SetObjects",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
