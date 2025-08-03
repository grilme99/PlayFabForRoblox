--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Creates the Apple addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdateapple).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateApple(request: Types.CreateOrUpdateAppleRequest, entityToken: string): Result<Types.CreateOrUpdateAppleResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateApple",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the ToxMod addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdatetoxmod).

	### Errors
	- AddonAlreadyExists
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateToxMod(request: Types.CreateOrUpdateToxModRequest, entityToken: string): Result<Types.CreateOrUpdateToxModResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateToxMod",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the Facebook addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdatefacebook).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateFacebook(request: Types.CreateOrUpdateFacebookRequest, entityToken: string): Result<Types.CreateOrUpdateFacebookResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateFacebook",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the Nintendo addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdatenintendo).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateNintendo(request: Types.CreateOrUpdateNintendoRequest, entityToken: string): Result<Types.CreateOrUpdateNintendoResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateNintendo",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the Steam addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/getsteam).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetSteam(request: Types.GetSteamRequest, entityToken: string): Result<Types.GetSteamResponse, string>
	return makeApiCall(
		"/Addon/GetSteam",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the Google addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/getgoogle).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetGoogle(request: Types.GetGoogleRequest, entityToken: string): Result<Types.GetGoogleResponse, string>
	return makeApiCall(
		"/Addon/GetGoogle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the Steam addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdatesteam).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateSteam(request: Types.CreateOrUpdateSteamRequest, entityToken: string): Result<Types.CreateOrUpdateSteamResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateSteam",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the Steam addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletesteam).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteSteam(request: Types.DeleteSteamRequest, entityToken: string): Result<Types.DeleteSteamResponse, string>
	return makeApiCall(
		"/Addon/DeleteSteam",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the PSN addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/getpsn).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetPSN(request: Types.GetPSNRequest, entityToken: string): Result<Types.GetPSNResponse, string>
	return makeApiCall(
		"/Addon/GetPSN",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the Kongregate addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/getkongregate).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetKongregate(request: Types.GetKongregateRequest, entityToken: string): Result<Types.GetKongregateResponse, string>
	return makeApiCall(
		"/Addon/GetKongregate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the Google addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletegoogle).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteGoogle(request: Types.DeleteGoogleRequest, entityToken: string): Result<Types.DeleteGoogleResponse, string>
	return makeApiCall(
		"/Addon/DeleteGoogle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the Facebook Instant Games addon on a title, omits
	secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/getfacebookinstantgames).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetFacebookInstantGames(request: Types.GetFacebookInstantGamesRequest, entityToken: string): Result<Types.GetFacebookInstantGamesResponse, string>
	return makeApiCall(
		"/Addon/GetFacebookInstantGames",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the Nintendo addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/getnintendo).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetNintendo(request: Types.GetNintendoRequest, entityToken: string): Result<Types.GetNintendoResponse, string>
	return makeApiCall(
		"/Addon/GetNintendo",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the Twitch addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdatetwitch).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateTwitch(request: Types.CreateOrUpdateTwitchRequest, entityToken: string): Result<Types.CreateOrUpdateTwitchResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateTwitch",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the PSN addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdatepsn).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdatePSN(request: Types.CreateOrUpdatePSNRequest, entityToken: string): Result<Types.CreateOrUpdatePSNResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdatePSN",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the Kongregate addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletekongregate).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteKongregate(request: Types.DeleteKongregateRequest, entityToken: string): Result<Types.DeleteKongregateResponse, string>
	return makeApiCall(
		"/Addon/DeleteKongregate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the Apple addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/getapple).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetApple(request: Types.GetAppleRequest, entityToken: string): Result<Types.GetAppleResponse, string>
	return makeApiCall(
		"/Addon/GetApple",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the ToxMod addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/gettoxmod).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetToxMod(request: Types.GetToxModRequest, entityToken: string): Result<Types.GetToxModResponse, string>
	return makeApiCall(
		"/Addon/GetToxMod",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the Kongregate addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdatekongregate).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateKongregate(request: Types.CreateOrUpdateKongregateRequest, entityToken: string): Result<Types.CreateOrUpdateKongregateResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateKongregate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the Google addon on a title, or updates it if it already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdategoogle).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateGoogle(request: Types.CreateOrUpdateGoogleRequest, entityToken: string): Result<Types.CreateOrUpdateGoogleResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateGoogle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the ToxMod addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletetoxmod).

	### Errors
	- AddonDoesntExist
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteToxMod(request: Types.DeleteToxModRequest, entityToken: string): Result<Types.DeleteToxModResponse, string>
	return makeApiCall(
		"/Addon/DeleteToxMod",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the Facebook addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletefacebook).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteFacebook(request: Types.DeleteFacebookRequest, entityToken: string): Result<Types.DeleteFacebookResponse, string>
	return makeApiCall(
		"/Addon/DeleteFacebook",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the Facebook addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletefacebookinstantgames).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteFacebookInstantGames(request: Types.DeleteFacebookInstantGamesRequest, entityToken: string): Result<Types.DeleteFacebookInstantGamesResponse, string>
	return makeApiCall(
		"/Addon/DeleteFacebookInstantGames",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the Facebook addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/getfacebook).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetFacebook(request: Types.GetFacebookRequest, entityToken: string): Result<Types.GetFacebookResponse, string>
	return makeApiCall(
		"/Addon/GetFacebook",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets information of the Twitch addon on a title, omits secrets.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/gettwitch).

	### Errors
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.GetTwitch(request: Types.GetTwitchRequest, entityToken: string): Result<Types.GetTwitchResponse, string>
	return makeApiCall(
		"/Addon/GetTwitch",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the Nintendo addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletenintendo).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteNintendo(request: Types.DeleteNintendoRequest, entityToken: string): Result<Types.DeleteNintendoResponse, string>
	return makeApiCall(
		"/Addon/DeleteNintendo",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the Apple addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deleteapple).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteApple(request: Types.DeleteAppleRequest, entityToken: string): Result<Types.DeleteAppleResponse, string>
	return makeApiCall(
		"/Addon/DeleteApple",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates the Facebook Instant Games addon on a title, or updates it if it
	already exists.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/createorupdatefacebookinstantgames).

	### Errors
	- AddonAlreadyExists
	- BillingInformationRequired
	- CatalogBadRequest
	- CatalogConfigInvalid
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.CreateOrUpdateFacebookInstantGames(request: Types.CreateOrUpdateFacebookInstantGamesRequest, entityToken: string): Result<Types.CreateOrUpdateFacebookInstantGamesResponse, string>
	return makeApiCall(
		"/Addon/CreateOrUpdateFacebookInstantGames",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the Twitch addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletetwitch).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeleteTwitch(request: Types.DeleteTwitchRequest, entityToken: string): Result<Types.DeleteTwitchResponse, string>
	return makeApiCall(
		"/Addon/DeleteTwitch",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the PSN addon on a title.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/addon/addon/deletepsn).

	### Errors
	- AddonDoesntExist
	- CatalogBadRequest
	- InvalidEntityType
	- InvalidParams
	- InvalidTitleId

]]
function Apis.DeletePSN(request: Types.DeletePSNRequest, entityToken: string): Result<Types.DeletePSNResponse, string>
	return makeApiCall(
		"/Addon/DeletePSN",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
