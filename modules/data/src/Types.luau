--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

export type SetObjectInfo = {
	--[[
		Optional reason to explain why the operation was the result that it was.

	]]
	OperationReason: string?,
	--[[
		Name of the object

	]]
	ObjectName: string?,
	SetResult: OperationTypes?,
}

export type GetFileMetadata = {
	--[[
		Checksum value for the file, can be used to check if the file on the server
		has changed.

	]]
	Checksum: string?,
	--[[
		Last UTC time the file was modified

	]]
	LastModified: string,
	--[[
		Download URL where the file can be retrieved

	]]
	DownloadUrl: string?,
	--[[
		Name of the file

	]]
	FileName: string?,
	--[[
		Storage service's reported byte count

	]]
	Size: number,
}

--[[
	Gets JSON objects from an entity profile and returns it.

]]
export type GetObjectsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		Determines whether the object will be returned as an escaped JSON string or as
		a un-escaped JSON object. Default is JSON object.

	]]
	EscapeObject: boolean?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SetObject = {
	--[[
		Name of object. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'.

	]]
	ObjectName: string,
	--[[
		Body of the object to be saved as an escaped JSON string. If empty and
		DeleteObject is true object will be deleted if it exists, or no operation will
		occur if it does not exist. Only one of DataObject or EscapedDataObject fields
		may be used.

	]]
	EscapedDataObject: string?,
	--[[
		Body of the object to be saved. If empty and DeleteObject is true object will
		be deleted if it exists, or no operation will occur if it does not exist. Only
		one of Object or EscapedDataObject fields may be used.

	]]
	DataObject: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Flag to indicate that this object should be deleted. Both DataObject and
		EscapedDataObject must not be set as well.

	]]
	DeleteObject: boolean?,
}

export type GetFilesResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	Metadata: GetFileMetadata?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

export type ObjectResult = {
	--[[
		Name of the object. Restricted to a-Z, 0-9, '(', ')', '_', '-' and '.'

	]]
	ObjectName: string?,
	--[[
		Escaped string JSON body of the object, if EscapeObject is true.

	]]
	EscapedDataObject: string?,
	--[[
		Un-escaped JSON object, if EscapeObject false or default.

	]]
	DataObject: {
		-- No properties defined in spec
		[string]: any
	}?,
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

export type InitiateFileUploadsResponse = {
	--[[
		Collection of file names and upload urls

	]]
	UploadDetails: { InitiateFileUploadMetadata }?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
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

export type FinalizeFileUploadsResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	Metadata: GetFileMetadata?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

--[[
	Deletes the requested files from the entity's profile.

]]
export type DeleteFilesRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Names of the files to be deleted.

	]]
	FileNames: { string },
	--[[
		The expected version of the profile, if set and doesn't match the current
		version of the profile the operation will not be performed.

	]]
	ProfileVersion: number?,
}

export type DeleteFilesResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

export type AbortFileUploadsResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

--[[
	Aborts the pending upload of the requested files.

]]
export type AbortFileUploadsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Names of the files to have their pending uploads aborted.

	]]
	FileNames: { string },
	--[[
		The expected version of the profile, if set and doesn't match the current
		version of the profile the operation will not be performed.

	]]
	ProfileVersion: number?,
}

--[[
	Sets JSON objects on the requested entity profile. May include a version
	number to be used to perform optimistic concurrency operations during
	update. If the current version differs from the version in the request the
	request will be ignored. If no version is set on the request then the value
	will always be updated if the values differ. Using the version value does
	not guarantee a write though, ConcurrentEditError may still occur if
	multiple clients are attempting to update the same profile.

]]
export type SetObjectsRequest = {
	--[[
		Collection of objects to set on the profile.

	]]
	Objects: { SetObject },
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		Optional field used for concurrency control. By specifying the previously
		returned value of ProfileVersion from GetProfile API, you can ensure that the
		object set will only be performed if the profile has not been updated by any
		other clients since the version you last loaded.

	]]
	ExpectedProfileVersion: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Returns URLs that may be used to upload the files for a profile 5 minutes.
	After using the upload calls FinalizeFileUploads must be called to move the
	file status from pending to live.

]]
export type InitiateFileUploadsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Names of the files to be set. Restricted to a-Z, 0-9, '(', ')', '_', '-' and
		'.'

	]]
	FileNames: { string },
	--[[
		The expected version of the profile, if set and doesn't match the current
		version of the profile the operation will not be performed.

	]]
	ProfileVersion: number?,
}

--[[
	Finalizes the upload of the requested files. Verifies that the files have
	been successfully uploaded and moves the file pointers from pending to live.

]]
export type FinalizeFileUploadsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Names of the files to be finalized. Restricted to a-Z, 0-9, '(', ')', '_', '-'
		and '.'

	]]
	FileNames: { string },
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

export type OperationTypes = 
	| "Created"
	| "Updated"
	| "Deleted"
	| "None"

export type InitiateFileUploadMetadata = {
	--[[
		Name of the file.

	]]
	FileName: string?,
	--[[
		Location the data should be sent to via an HTTP PUT operation.

	]]
	UploadUrl: string?,
}

export type GetObjectsResponse = {
	Objects: ObjectResult?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The current version of the profile, can be used for concurrency control during
		updates.

	]]
	ProfileVersion: number,
}

--[[
	Returns URLs that may be used to download the files for a profile for a
	limited length of time. Only returns files that have been successfully
	uploaded, files that are still pending will either return the old value, if
	it exists, or nothing.

]]
export type GetFilesRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SetObjectsResponse = {
	--[[
		New version of the entity profile.

	]]
	SetResults: { SetObjectInfo }?,
	--[[
		New version of the entity profile.

	]]
	ProfileVersion: number,
}



return nil
