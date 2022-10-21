--!strict
--[=[
	# DataApi

	Store arbitrary data associated with an entity. Objects are small (~1KB) JSON-compatible 
	objects which are stored directly on the entity profile. Objects are made available 
	for use in other PlayFab contexts, such as PlayStream events and CloudScript 
	functions. Files can efficiently store data of any size or format. Both objects 
	and files support a flexible permissions system to control read and write access 
	by other entities. 

	API Version: 1.221007.0
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)
local Types = require(script.Parent.Types)
local DataApi = require(script.Apis)

function DataApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AbortFileUploadsRequest = Types.AbortFileUploadsRequest
export type AbortFileUploadsResponse = Types.AbortFileUploadsResponse
export type ApiErrorWrapper = Types.ApiErrorWrapper
export type DeleteFilesRequest = Types.DeleteFilesRequest
export type DeleteFilesResponse = Types.DeleteFilesResponse
export type EntityKey = Types.EntityKey
export type FinalizeFileUploadsRequest = Types.FinalizeFileUploadsRequest
export type FinalizeFileUploadsResponse = Types.FinalizeFileUploadsResponse
export type GetFileMetadata = Types.GetFileMetadata
export type GetFilesRequest = Types.GetFilesRequest
export type GetFilesResponse = Types.GetFilesResponse
export type GetObjectsRequest = Types.GetObjectsRequest
export type GetObjectsResponse = Types.GetObjectsResponse
export type InitiateFileUploadMetadata = Types.InitiateFileUploadMetadata
export type InitiateFileUploadsRequest = Types.InitiateFileUploadsRequest
export type InitiateFileUploadsResponse = Types.InitiateFileUploadsResponse
export type ObjectResult = Types.ObjectResult
export type OperationTypes = Types.OperationTypes
export type SetObject = Types.SetObject
export type SetObjectInfo = Types.SetObjectInfo
export type SetObjectsRequest = Types.SetObjectsRequest
export type SetObjectsResponse = Types.SetObjectsResponse

return DataApi

