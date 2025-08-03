--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

export type CreateOrUpdatePSNResponse = {
	-- No properties defined in spec
	[string]: any
}

export type GetPSNResponse = {
	--[[
		Addon status.

	]]
	Created: boolean,
	--[[
		Client ID obtained after setting up your game with Sony. This one is
		associated with the existing PS4 marketplace.

	]]
	ClientID: string?,
	--[[
		Client ID obtained after setting up your game with Sony. This one is
		associated with the modern marketplace, which includes PS5, cross-generation
		for PS4, and unified entitlements.

	]]
	NextGenClientID: string?,
}

export type CreateOrUpdateNintendoRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Nintendo Switch Application ID, without the "0x" prefix.

	]]
	ApplicationID: string?,
	--[[
		List of Nintendo Environments, currently supporting up to 4. Needs Catalog
		enabled.

	]]
	Environments: { NintendoEnvironment }?,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type DeleteNintendoResponse = {
	-- No properties defined in spec
	[string]: any
}

export type CreateOrUpdateGoogleRequest = {
	--[[
		Authorized Redirect Uri obtained through the Google Developer Console. This
		currently defaults to https://oauth.playfab.com/oauth2/google. If you are
		authenticating players via browser, please update this to your own domain.

	]]
	OAuthCustomRedirectUri: string?,
	--[[
		Google OAuth Client ID obtained through the Google Developer Console by
		creating a new set of "OAuth Client ID". Required if using Google
		Authentication.

	]]
	OAuthClientID: string?,
	--[[
		Google App License Key obtained after setting up your app in the Google Play
		developer portal. Required if using Google receipt validation.

	]]
	AppLicenseKey: string?,
	--[[
		Google App Package ID obtained after setting up your app in the Google Play
		developer portal. Required if using Google receipt validation.

	]]
	AppPackageID: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Needed to enable pending purchase handling and subscription processing.

	]]
	ServiceAccountKey: string?,
	--[[
		Google OAuth Client Secret obtained through the Google Developer Console by
		creating a new set of "OAuth Client ID". Required if using Google
		Authentication.

	]]
	OAuthClientSecret: string?,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type CreateOrUpdateToxModResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeleteAppleResponse = {
	-- No properties defined in spec
	[string]: any
}

export type NintendoEnvironment = {
	--[[
		Client Secret for the Nintendo Environment.

	]]
	ClientSecret: string?,
	--[[
		Client ID for the Nintendo Environment.

	]]
	ClientID: string?,
	--[[
		ID for the Nintendo Environment.

	]]
	ID: string?,
}

export type CreateOrUpdateKongregateResponse = {
	-- No properties defined in spec
	[string]: any
}

export type CreateOrUpdatePSNRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Client ID obtained after setting up your game with Sony. This one is
		associated with the existing PS4 marketplace.

	]]
	ClientID: string?,
	--[[
		Client ID obtained after setting up your game with Sony. This one is
		associated with the modern marketplace, which includes PS5, cross-generation
		for PS4, and unified entitlements.

	]]
	NextGenClientID: string?,
	--[[
		Client secret obtained after setting up your game with Sony. This one is
		associated with the existing PS4 marketplace.

	]]
	ClientSecret: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Client secret obtained after setting up your game with Sony. This one is
		associated with the modern marketplace, which includes PS5, cross-generation
		for PS4, and unified entitlements.

	]]
	NextGenClientSecret: string?,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type CreateOrUpdateTwitchRequest = {
	--[[
		Client ID obtained after creating your Twitch developer account.

	]]
	ClientID: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Client Secret obtained after creating your Twitch developer account.

	]]
	ClientSecret: string?,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type GetSteamRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateOrUpdateFacebookRequest = {
	--[[
		Facebook App ID obtained after setting up your app in Facebook.

	]]
	AppID: string,
	--[[
		Email address for purchase dispute notifications.

	]]
	NotificationEmail: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Facebook App Secret obtained after setting up your app in Facebook.

	]]
	AppSecret: string,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type DeleteGoogleResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeleteFacebookInstantGamesRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeleteGoogleRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeleteFacebookRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetGoogleRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateOrUpdateToxModRequest = {
	--[[
		Whether ToxMod Addon is Enabled by Title.

	]]
	Enabled: boolean,
	--[[
		Account ID obtained after creating your ToxMod developer account.

	]]
	AccountId: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Account Key obtained after creating your ToxMod developer account.

	]]
	AccountKey: string,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type GetSteamResponse = {
	--[[
		Addon status.

	]]
	Created: boolean,
	--[[
		Enforce usage of AzurePlayFab identity in user authentication tickets.

	]]
	EnforceServiceSpecificTickets: boolean?,
	--[[
		Use Steam Payments sandbox endpoint for test transactions.

	]]
	UseSandbox: boolean?,
	--[[
		Application ID obtained after setting up your game in Valve's developer
		portal.

	]]
	ApplicationId: string?,
}

export type CreateOrUpdateFacebookInstantGamesResponse = {
	-- No properties defined in spec
	[string]: any
}

export type CreateOrUpdateAppleRequest = {
	--[[
		iOS App Bundle ID obtained after setting up your app in the App Store.

	]]
	AppBundleId: string,
	--[[
		Ignore expiration date for identity tokens. Be aware that when set to true
		this can invalidate expired tokens in the case where Apple rotates their
		signing keys.

	]]
	IgnoreExpirationDate: boolean?,
	--[[
		iOS App Shared Secret obtained after setting up your app in the App Store.

	]]
	AppSharedSecret: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Require secure authentication only for this app.

	]]
	RequireSecureAuthentication: boolean?,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type GetKongregateResponse = {
	--[[
		Addon status.

	]]
	Created: boolean,
}

export type CreateOrUpdateAppleResponse = {
	-- No properties defined in spec
	[string]: any
}

export type CreateOrUpdateSteamRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Sercet Key obtained after setting up your app in Valve's developer portal.

	]]
	SecretKey: string,
	--[[
		Application ID obtained after setting up your app in Valve's developer portal.

	]]
	ApplicationId: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Use Steam Payments sandbox endpoint for test transactions.

	]]
	UseSandbox: boolean?,
	--[[
		Enforce usage of AzurePlayFab identity in user authentication tickets.

	]]
	EnforceServiceSpecificTickets: boolean?,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type DeleteKongregateRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeletePSNResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeleteNintendoRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeleteFacebookResponse = {
	-- No properties defined in spec
	[string]: any
}

export type GetAppleResponse = {
	--[[
		iOS App Bundle ID obtained after setting up your app in the App Store.

	]]
	AppBundleId: string?,
	--[[
		Ignore expiration date for identity tokens.

	]]
	IgnoreExpirationDate: boolean?,
	--[[
		Require secure authentication only for this app.

	]]
	RequireSecureAuthentication: boolean?,
	--[[
		Addon status.

	]]
	Created: boolean,
}

export type CreateOrUpdateGoogleResponse = {
	-- No properties defined in spec
	[string]: any
}

export type CreateOrUpdateFacebookResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeletePSNRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateOrUpdateTwitchResponse = {
	-- No properties defined in spec
	[string]: any
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

export type GetGoogleResponse = {
	--[[
		Addon status.

	]]
	Created: boolean,
	--[[
		Authorized Redirect Uri obtained through the Google Developer Console. This
		currently defaults to https://oauth.playfab.com/oauth2/google. If you are
		authenticating players via browser, please update this to your own domain.

	]]
	OauthCustomRedirectUri: string?,
	--[[
		Google App Package ID obtained after setting up your app in the Google Play
		developer portal. Required if using Google receipt validation.

	]]
	AppPackageID: string?,
	--[[
		Google OAuth Client ID obtained through the Google Developer Console by
		creating a new set of "OAuth Client ID". Required if using Google
		Authentication.

	]]
	OAuthClientID: string?,
}

export type GetTwitchResponse = {
	--[[
		Client ID obtained after creating your Twitch developer account.

	]]
	ClientID: string?,
	--[[
		Addon status.

	]]
	Created: boolean,
}

export type GetFacebookInstantGamesResponse = {
	--[[
		Facebook App ID obtained after setting up your app in Facebook Instant Games.

	]]
	AppID: string?,
	--[[
		Addon status.

	]]
	Created: boolean,
}

export type DeleteToxModResponse = {
	-- No properties defined in spec
	[string]: any
}

export type CreateOrUpdateFacebookInstantGamesRequest = {
	--[[
		Facebook App ID obtained after setting up your app in Facebook Instant Games.

	]]
	AppID: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Facebook App Secret obtained after setting up your app in Facebook Instant
		Games.

	]]
	AppSecret: string,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type GetAppleRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetPSNRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateOrUpdateNintendoResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeleteSteamResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeleteToxModRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetToxModRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeleteTwitchResponse = {
	-- No properties defined in spec
	[string]: any
}

export type GetNintendoResponse = {
	--[[
		Addon status.

	]]
	Created: boolean,
	--[[
		Nintendo Switch Application ID, without the "0x" prefix.

	]]
	ApplicationID: string?,
	--[[
		List of Nintendo Environments, currently supporting up to 4.

	]]
	Environments: { NintendoEnvironment }?,
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

export type DeleteFacebookInstantGamesResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeleteTwitchRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeleteAppleRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateOrUpdateKongregateRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Kongregate Secret API Key obtained after setting up your game in your
		Kongregate developer account.

	]]
	SecretAPIKey: string,
	--[[
		If an error should be returned if the addon already exists.

	]]
	ErrorIfExists: boolean?,
}

export type GetFacebookRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetFacebookResponse = {
	--[[
		Addon status.

	]]
	Created: boolean,
	--[[
		Facebook App ID obtained after setting up your app in Facebook.

	]]
	AppID: string?,
	--[[
		Email address for purchase dispute notifications.

	]]
	NotificationEmail: string?,
}

export type GetToxModResponse = {
	--[[
		Whether the ToxMod Addon is enabled by the title.

	]]
	Enabled: boolean,
	--[[
		Addon status.

	]]
	Created: boolean,
	--[[
		Account Key obtained after creating your Twitch developer account.

	]]
	AccountKey: string?,
	--[[
		Account ID obtained after creating your Twitch developer account.

	]]
	AccountId: string?,
}

export type DeleteSteamRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetFacebookInstantGamesRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetKongregateRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DeleteKongregateResponse = {
	-- No properties defined in spec
	[string]: any
}

export type GetTwitchRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateOrUpdateSteamResponse = {
	-- No properties defined in spec
	[string]: any
}

export type GetNintendoRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}



return nil
