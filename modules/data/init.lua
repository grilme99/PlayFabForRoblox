--!strict
--[=[
	# DataApi

	Store arbitrary data associated with an entity. Objects are small (~1KB) JSON-compatible 
	objects which are stored directly on the entity profile. Objects are made available 
	for use in other PlayFab contexts, such as PlayStream events and CloudScript 
	functions. Files can efficiently store data of any size or format. Both objects 
	and files support a flexible permissions system to control read and write access 
	by other entities. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local DataApi = {}

--- Aborts the pending upload of the requested files. 
export type AbortFileUploadsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	FileNames: {any}, --- Names of the files to have their pending uploads aborted.
	ProfileVersion: number?, --- The expected version of the profile, if set and doesn't match the current version of the profile the operation will not be performed.
}

export type AbortFileUploadsResponse = {
	Entity: EntityKey?, --- The entity id and type.
	ProfileVersion: number, --- The current version of the profile, can be used for concurrency control during updates.
}

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

--- Deletes the requested files from the entity's profile. 
export type DeleteFilesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	FileNames: {any}, --- Names of the files to be deleted.
	ProfileVersion: number?, --- The expected version of the profile, if set and doesn't match the current version of the profile the operation will not be performed.
}

export type DeleteFilesResponse = {
	Entity: EntityKey?, --- The entity id and type.
	ProfileVersion: number, --- The current version of the profile, can be used for concurrency control during updates.
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

--- Finalizes the upload of the requested files. Verifies that the files have been 
--- successfully uploaded and moves the file pointers from pending to live. 
export type FinalizeFileUploadsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	FileNames: {any}, --- Names of the files to be finalized. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'
	ProfileVersion: number, --- The current version of the profile, can be used for concurrency control during updates.
}

export type FinalizeFileUploadsResponse = {
	Entity: EntityKey?, --- The entity id and type.
	Metadata: GetFileMetadata?, --- Collection of metadata for the entity's files
	ProfileVersion: number, --- The current version of the profile, can be used for concurrency control during updates.
}

export type GetFileMetadata = {
	Checksum: string?, --- Checksum value for the file, can be used to check if the file on the server has changed.
	DownloadUrl: string?, --- Download URL where the file can be retrieved
	FileName: string?, --- Name of the file
	LastModified: string, --- Last UTC time the file was modified
	Size: number, --- Storage service's reported byte count
}

--- Returns URLs that may be used to download the files for a profile for a limited 
--- length of time. Only returns files that have been successfully uploaded, files 
--- that are still pending will either return the old value, if it exists, or nothing. 
export type GetFilesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
}

export type GetFilesResponse = {
	Entity: EntityKey?, --- The entity id and type.
	Metadata: GetFileMetadata?, --- Collection of metadata for the entity's files
	ProfileVersion: number, --- The current version of the profile, can be used for concurrency control during updates.
}

--- Gets JSON objects from an entity profile and returns it.  
export type GetObjectsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	EscapeObject: boolean?, --- Determines whether the object will be returned as an escaped JSON string or as a un-escaped JSON object. Default is JSON object.
}

export type GetObjectsResponse = {
	Entity: EntityKey?, --- The entity id and type.
	Objects: ObjectResult?, --- Requested objects that the calling entity has access to
	ProfileVersion: number, --- The current version of the profile, can be used for concurrency control during updates.
}

export type InitiateFileUploadMetadata = {
	FileName: string?, --- Name of the file.
	UploadUrl: string?, --- Location the data should be sent to via an HTTP PUT operation.
}

--- Returns URLs that may be used to upload the files for a profile 5 minutes. After 
--- using the upload calls FinalizeFileUploads must be called to move the file status 
--- from pending to live. 
export type InitiateFileUploadsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	FileNames: {any}, --- Names of the files to be set. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'
	ProfileVersion: number?, --- The expected version of the profile, if set and doesn't match the current version of the profile the operation will not be performed.
}

export type InitiateFileUploadsResponse = {
	Entity: EntityKey?, --- The entity id and type.
	ProfileVersion: number, --- The current version of the profile, can be used for concurrency control during updates.
	UploadDetails: {InitiateFileUploadMetadata}?, --- Collection of file names and upload urls
}

export type ObjectResult = {
	DataObject: {[any]: any}?, --- Un-escaped JSON object, if EscapeObject false or default.
	EscapedDataObject: string?, --- Escaped string JSON body of the object, if EscapeObject is true.
	ObjectName: string?, --- Name of the object. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'
}

export type OperationTypes = 
	"Created"
	| "Updated"
	| "Deleted"
	| "None"

export type SetObject = {
	DataObject: {[any]: any}?, --- Body of the object to be saved. If empty and DeleteObject is true object will be deleted if it exists, or no operation will occur if it does not exist. Only one of Object or EscapedDataObject fields may be used.
	DeleteObject: boolean?, --- Flag to indicate that this object should be deleted. Both DataObject and EscapedDataObject must not be set as well.
	EscapedDataObject: string?, --- Body of the object to be saved as an escaped JSON string. If empty and DeleteObject is true object will be deleted if it exists, or no operation will occur if it does not exist. Only one of DataObject or EscapedDataObject fields may be used.
	ObjectName: string, --- Name of object. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'.
}

export type SetObjectInfo = {
	ObjectName: string?, --- Name of the object
	OperationReason: string?, --- Optional reason to explain why the operation was the result that it was.
	SetResult: string?, --- Indicates which operation was completed, either Created, Updated, Deleted or None.
}

--- Sets JSON objects on the requested entity profile. May include a version number 
--- to be used to perform optimistic concurrency operations during update. If the 
--- current version differs from the version in the request the request will be 
--- ignored. If no version is set on the request then the value will always be updated 
--- if the values differ. Using the version value does not guarantee a write though, 
--- ConcurrentEditError may still occur if multiple clients are attempting to update 
--- the same profile.  
export type SetObjectsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity to perform this action on.
	ExpectedProfileVersion: number?, --- Optional field used for concurrency control. By specifying the previously returned value of ProfileVersion from GetProfile API, you can ensure that the object set will only be performed if the profile has not been updated by any other clients since the version you last loaded.
	Objects: {SetObject}, --- Collection of objects to set on the profile.
}

export type SetObjectsResponse = {
	ProfileVersion: number, --- New version of the entity profile.
	SetResults: {SetObjectInfo}?, --- New version of the entity profile.
}


--- Aborts the pending upload of the requested files. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/abortfileuploads
function DataApi.AbortFileUploadsAsync(
	entityToken: string, 
	request: AbortFileUploadsRequest
): AbortFileUploadsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Data/AbortFileUploads",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes the requested files from the entity's profile. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/deletefiles
function DataApi.DeleteFilesAsync(
	entityToken: string, 
	request: DeleteFilesRequest
): DeleteFilesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Data/DeleteFiles",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Finalizes the upload of the requested files. Verifies that the files have been 
--- successfully uploaded and moves the file pointers from pending to live. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/finalizefileuploads
function DataApi.FinalizeFileUploadsAsync(
	entityToken: string, 
	request: FinalizeFileUploadsRequest
): FinalizeFileUploadsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Data/FinalizeFileUploads",
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
function DataApi.GetFilesAsync(
	entityToken: string, 
	request: GetFilesRequest
): GetFilesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Data/GetFiles",
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
function DataApi.InitiateFileUploadsAsync(
	entityToken: string, 
	request: InitiateFileUploadsRequest
): InitiateFileUploadsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Data/InitiateFileUploads",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets JSON objects from an entity profile and returns it.  
---
--- https://docs.microsoft.com/rest/api/playfab/data/object/getobjects
function DataApi.GetObjectsAsync(
	entityToken: string, 
	request: GetObjectsRequest
): GetObjectsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Data/GetObjects",
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
function DataApi.SetObjectsAsync(
	entityToken: string, 
	request: SetObjectsRequest
): SetObjectsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Data/SetObjects",
		request,
		"X-EntityToken",
		entityToken
	)
end

return DataApi

