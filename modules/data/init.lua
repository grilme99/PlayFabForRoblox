--!strict
--[=[
	# DataApi

	Store arbitrary data associated with an entity. Objects are small (~1KB) JSON-compatible 
	objects which are stored directly on the entity profile. Objects are made available 
	for use in other PlayFab contexts, such as PlayStream events and CloudScript 
	functions. Files can efficiently store data of any size or format. Both objects 
	and files support a flexible permissions system to control read and write access 
	by other entities. 

	API Version: 1.220926.5
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local DataApi = {}

function DataApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

--- Aborts the pending upload of the requested files. 
export type AbortFileUploadsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- Names of the files to have their pending uploads aborted. 
	FileNames: {any},
	--- The expected version of the profile, if set and doesn't match the current version 
	--- of the profile the operation will not be performed. 
	ProfileVersion: number?,
}

export type AbortFileUploadsResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
}

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

--- Deletes the requested files from the entity's profile. 
export type DeleteFilesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- Names of the files to be deleted. 
	FileNames: {any},
	--- The expected version of the profile, if set and doesn't match the current version 
	--- of the profile the operation will not be performed. 
	ProfileVersion: number?,
}

export type DeleteFilesResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

--- Finalizes the upload of the requested files. Verifies that the files have been 
--- successfully uploaded and moves the file pointers from pending to live. 
export type FinalizeFileUploadsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- Names of the files to be finalized. Restricted to a-Z, 0-9, '(', ')', '_', '-' 
	--- and '.' 
	FileNames: {any},
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
}

export type FinalizeFileUploadsResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- Collection of metadata for the entity's files 
	Metadata: GetFileMetadata?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
}

export type GetFileMetadata = {
	--- Checksum value for the file, can be used to check if the file on the server 
	--- has changed. 
	Checksum: string?,
	--- Download URL where the file can be retrieved 
	DownloadUrl: string?,
	--- Name of the file 
	FileName: string?,
	--- Last UTC time the file was modified 
	LastModified: string,
	--- Storage service's reported byte count 
	Size: number,
}

--- Returns URLs that may be used to download the files for a profile for a limited 
--- length of time. Only returns files that have been successfully uploaded, files 
--- that are still pending will either return the old value, if it exists, or nothing. 
export type GetFilesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
}

export type GetFilesResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- Collection of metadata for the entity's files 
	Metadata: GetFileMetadata?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
}

--- Gets JSON objects from an entity profile and returns it.  
export type GetObjectsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- Determines whether the object will be returned as an escaped JSON string or 
	--- as a un-escaped JSON object. Default is JSON object. 
	EscapeObject: boolean?,
}

export type GetObjectsResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- Requested objects that the calling entity has access to 
	Objects: ObjectResult?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
}

export type InitiateFileUploadMetadata = {
	--- Name of the file. 
	FileName: string?,
	--- Location the data should be sent to via an HTTP PUT operation. 
	UploadUrl: string?,
}

--- Returns URLs that may be used to upload the files for a profile 5 minutes. After 
--- using the upload calls FinalizeFileUploads must be called to move the file status 
--- from pending to live. 
export type InitiateFileUploadsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- Names of the files to be set. Restricted to a-Z, 0-9, '(', ')', '_', '-' and 
	--- '.' 
	FileNames: {any},
	--- The expected version of the profile, if set and doesn't match the current version 
	--- of the profile the operation will not be performed. 
	ProfileVersion: number?,
}

export type InitiateFileUploadsResponse = {
	--- The entity id and type. 
	Entity: EntityKey?,
	--- The current version of the profile, can be used for concurrency control during 
	--- updates. 
	ProfileVersion: number,
	--- Collection of file names and upload urls 
	UploadDetails: {InitiateFileUploadMetadata}?,
}

export type ObjectResult = {
	--- Un-escaped JSON object, if EscapeObject false or default. 
	DataObject: {[any]: any}?,
	--- Escaped string JSON body of the object, if EscapeObject is true. 
	EscapedDataObject: string?,
	--- Name of the object. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.' 
	ObjectName: string?,
}

export type OperationTypes = 
	"Created"
	| "Updated"
	| "Deleted"
	| "None"

export type SetObject = {
	--- Body of the object to be saved. If empty and DeleteObject is true object will 
	--- be deleted if it exists, or no operation will occur if it does not exist. Only 
	--- one of Object or EscapedDataObject fields may be used. 
	DataObject: {[any]: any}?,
	--- Flag to indicate that this object should be deleted. Both DataObject and EscapedDataObject 
	--- must not be set as well. 
	DeleteObject: boolean?,
	--- Body of the object to be saved as an escaped JSON string. If empty and DeleteObject 
	--- is true object will be deleted if it exists, or no operation will occur if it 
	--- does not exist. Only one of DataObject or EscapedDataObject fields may be used. 
	EscapedDataObject: string?,
	--- Name of object. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'. 
	ObjectName: string,
}

export type SetObjectInfo = {
	--- Name of the object 
	ObjectName: string?,
	--- Optional reason to explain why the operation was the result that it was. 
	OperationReason: string?,
	--- Indicates which operation was completed, either Created, Updated, Deleted or 
	--- None. 
	SetResult: string?,
}

--- Sets JSON objects on the requested entity profile. May include a version number 
--- to be used to perform optimistic concurrency operations during update. If the 
--- current version differs from the version in the request the request will be 
--- ignored. If no version is set on the request then the value will always be updated 
--- if the values differ. Using the version value does not guarantee a write though, 
--- ConcurrentEditError may still occur if multiple clients are attempting to update 
--- the same profile.  
export type SetObjectsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity to perform this action on. 
	Entity: EntityKey,
	--- Optional field used for concurrency control. By specifying the previously returned 
	--- value of ProfileVersion from GetProfile API, you can ensure that the object 
	--- set will only be performed if the profile has not been updated by any other 
	--- clients since the version you last loaded. 
	ExpectedProfileVersion: number?,
	--- Collection of objects to set on the profile. 
	Objects: {SetObject},
}

export type SetObjectsResponse = {
	--- New version of the entity profile. 
	ProfileVersion: number,
	--- New version of the entity profile. 
	SetResults: {SetObjectInfo}?,
}


--- Aborts the pending upload of the requested files. 
---
--- https://docs.microsoft.com/rest/api/playfab/data/file/abortfileuploads
function DataApi.AbortFileUploadsAsync(
	entityToken: string, 
	request: AbortFileUploadsRequest
): AbortFileUploadsResponse
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
): DeleteFilesResponse
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
): FinalizeFileUploadsResponse
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
): GetFilesResponse
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
): InitiateFileUploadsResponse
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
): GetObjectsResponse
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
): SetObjectsResponse
	return PlayFabInternal.MakeApiCall(
		"/Data/SetObjects",
		request,
		"X-EntityToken",
		entityToken
	)
end

return DataApi

