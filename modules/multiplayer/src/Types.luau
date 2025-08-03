--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

export type RegionSelectionRule = {
	LinearExpansion: LinearRegionSelectionRuleExpansion?,
	--[[
		Specifies which attribute in a ticket to use.

	]]
	Path: string,
	--[[
		Specifies the maximum latency that is allowed between the client and the
		selected server. The value is in milliseconds.

	]]
	MaxLatency: number,
	--[[
		The relative weight of this rule compared to others.

	]]
	Weight: number,
	CustomExpansion: CustomRegionSelectionRuleExpansion?,
	--[[
		Friendly name chosen by developer.

	]]
	Name: string,
	--[[
		How many seconds before this rule is no longer enforced (but tickets that
		comply with this rule will still be prioritized over those that don't). Leave
		blank if this rule is always enforced.

	]]
	SecondsUntilOptional: number?,
}

--[[
	The server specifies all the members and their attributes.

]]
export type CreateServerMatchmakingTicketRequest = {
	--[[
		The Id of a match queue.

	]]
	QueueName: string,
	--[[
		How long to attempt matching this ticket in seconds.

	]]
	GiveUpAfterSeconds: number,
	--[[
		The users who will be part of this ticket.

	]]
	Members: { MatchmakingPlayer },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateTitleMultiplayerServersQuotaChangeResponse = {
	--[[
		Determines if the request was approved or not. When false, our team is
		reviewing and may respond within 2 business days.

	]]
	WasApproved: boolean,
	--[[
		Id of the change request that was created.

	]]
	RequestId: string?,
}

--[[
	Gets multiplayer server logs for a specific server id in a region. The logs
	are available only after a server has terminated.

]]
export type GetMultiplayerServerLogsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The server ID of multiplayer server to get logs for.

	]]
	ServerId: string,
}

--[[
	Removes the specified tag from the image. After this operation, a 'docker
	pull' will fail for the specified image and tag combination. Morever,
	ListContainerImageTags will not return the specified tag.

]]
export type UntagContainerImageRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The container image which tag we want to remove.

	]]
	ImageName: string?,
	--[[
		The tag we want to remove.

	]]
	Tag: string?,
}

--[[
	Cancels all backfill tickets of which the player is a member in a given
	queue that are not cancelled or matched. This API is useful if you lose
	track of what tickets the player is a member of (if the server crashes for
	instance) and want to "reset".

]]
export type CancelAllServerBackfillTicketsForPlayerRequest = {
	--[[
		The name of the queue from which a player's backfill tickets should be
		canceled.

	]]
	QueueName: string,
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

export type Port = {
	--[[
		The number for the port.

	]]
	Num: number,
	--[[
		The name for the port.

	]]
	Name: string,
	Protocol: ProtocolType,
}

export type ListMatchmakingQueuesResult = {
	--[[
		The list of matchmaking queue configs for this title.

	]]
	MatchMakingQueues: { MatchmakingQueueConfig }?,
}

export type GetTitleMultiplayerServersQuotaChangeResponse = {
	Change: QuotaChange?,
}

--[[
	Preview: Request to join a lobby as a server. Only callable by a game_server
	entity and this is restricted to client owned lobbies which are using
	connections.

]]
export type JoinLobbyAsServerRequest = {
	--[[
		The private key-value pairs which are visible to all entities in the lobby but
		can only be modified by the joined server.At most 30 key - value pairs may be
		stored here, keys are limited to 30 characters and values to 1000.The total
		size of all serverData values may not exceed 4096 bytes.

	]]
	ServerData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	ServerEntity: EntityKey,
	--[[
		A field which indicates which lobby the game_server will be joining. This
		field is opaque to everyone except the Lobby service.

	]]
	ConnectionString: string,
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
	Gets new credentials to the container registry where game developers can
	upload custom container images to before creating a new build.

]]
export type RolloverContainerRegistryCredentialsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetMatchResult = {
	--[[
		A string that is used by players that are matched together to join an arranged
		lobby.

	]]
	ArrangementString: string?,
	--[[
		A list of Users that are matched together, along with their team assignments.

	]]
	Members: { MatchmakingPlayerWithTeamAssignment },
	--[[
		A list of regions that the match could be played in sorted by preference. This
		value is only set if the queue has a region selection rule.

	]]
	RegionPreferences: { string }?,
	ServerDetails: ServerDetails?,
	--[[
		The Id of a match.

	]]
	MatchId: string,
}

export type ListMatchmakingTicketsForPlayerResult = {
	--[[
		The list of ticket Ids the user is a member of.

	]]
	TicketIds: { string },
}

--[[
	Returns a list of multiplayer server game certificates for a title.

]]
export type ListCertificateSummariesRequest = {
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetLobbyResult = {
	Lobby: Lobby,
}

--[[
	Request to join an arranged lobby. Only a client can join an arranged lobby.

]]
export type JoinArrangedLobbyRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	MemberEntity: EntityKey,
	AccessPolicy: AccessPolicy?,
	--[[
		A setting that controls whether only the lobby owner can send invites to join
		the lobby. When true, only the lobby owner can send invites. When false or not
		specified, any member can send invites. Defaults to false if not specified.
		Restricted to client owned lobbies.

	]]
	RestrictInvitesToLobbyOwner: boolean,
	OwnerMigrationPolicy: OwnerMigrationPolicy?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The private key-value pairs used by the member to communicate information to
		other members and the owner. Visible to all entities in the lobby. At most 30
		key-value pairs may be stored here, keys are limited to 30 characters and
		values to 1000. The total size of all memberData values may not exceed 4096
		bytes. Keys are case sensitive.

	]]
	MemberData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		A field which indicates which lobby the user will be joining. This field is
		opaque to everyone except the Lobby service and the creator of the
		arrangementString (Matchmaking). This string defines a unique identifier for
		the arranged lobby as well as the title and member the string is valid for.
		Arrangement strings have an expiration.

	]]
	ArrangementString: string,
	--[[
		A setting to control whether connections are used. Defaults to true. When
		true, notifications are sent to subscribed players, disconnect detection
		removes connectionHandles, only owner migration policies using connections are
		allowed, and lobbies must have at least one connected member to be searchable
		or be a server hosted lobby with a connected server. If false, then
		notifications are not sent, connections are not allowed, and lobbies do not
		need connections to be searchable.

	]]
	UseConnections: boolean,
	--[[
		The maximum number of players allowed in the lobby. The value must be between
		2 and 128.

	]]
	MaxPlayers: number,
}

export type CancellationReason = 
	| "Requested"
	| "Internal"
	| "Timeout"

export type Member = {
	--[[
		Opaque string, stored on a Subscribe call, which indicates the connection an
		owner or member has with PubSub.

	]]
	PubSubConnectionHandle: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	MemberEntity: EntityKey?,
	--[[
		Key-value pairs specific to member.

	]]
	MemberData: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GameCertificateReference = {
	--[[
		An alias for the game certificate. The game server will reference this alias
		via GSDK config to retrieve the game certificate. This alias is used as an
		identifier in game server code to allow a new certificate with different Name
		field to be uploaded without the need to change any game server code to
		reference the new Name.

	]]
	GsdkAlias: string?,
	--[[
		The name of the game certificate. This name should match the name of a
		certificate that was previously uploaded to this title.

	]]
	Name: string?,
}

--[[
	Deletes a multiplayer server game certificate.

]]
export type DeleteCertificateRequest = {
	--[[
		The name of the certificate.

	]]
	Name: string,
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
	Removes the specified container image repository. After this operation, a
	'docker pull' will fail for all the tags of the specified image. Morever,
	ListContainerImages will not return the specified image.

]]
export type DeleteContainerImageRequest = {
	--[[
		The container image repository we want to delete.

	]]
	ImageName: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type AssetReference = {
	--[[
		The asset's file name. This is a filename with the .zip, .tar, or .tar.gz
		extension.

	]]
	FileName: string?,
	--[[
		The asset's mount path.

	]]
	MountPath: string?,
}

--[[
	Request to delete a lobby. Only servers can delete lobbies.

]]
export type DeleteLobbyRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The id of the lobby.

	]]
	LobbyId: string?,
}

export type UnsubscribeFromMatchResourceResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Cancels all tickets of which the player is a member in a given queue that
	are not cancelled or matched. This API is useful if you lose track of what
	tickets the player is a member of (if the title crashes for instance) and
	want to "reset". The Entity field is optional if the caller is a player and
	defaults to that player. Players may not cancel tickets for other people.
	The Entity field is required if the caller is a server (authenticated as the
	title).

]]
export type CancelAllMatchmakingTicketsForPlayerRequest = {
	--[[
		The name of the queue from which a player's tickets should be canceled.

	]]
	QueueName: string,
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

export type EnableMultiplayerServersForTitleResponse = {
	Status: TitleMultiplayerServerEnabledStatus?,
}

export type OverrideUnsignedInt = {
	--[[
		The custom expansion value.

	]]
	Value: number,
}

export type FindLobbiesResult = {
	Pagination: PaginationResponse,
	--[[
		Array of lobbies found that matched FindLobbies request.

	]]
	Lobbies: { LobbySummary },
}

export type VmStartupScriptPortRequestParams = {
	--[[
		The name for the port.

	]]
	Name: string,
	Protocol: ProtocolType,
}

export type GameCertificateReferenceParams = {
	--[[
		An alias for the game certificate. The game server will reference this alias
		via GSDK config to retrieve the game certificate. This alias is used as an
		identifier in game server code to allow a new certificate with different Name
		field to be uploaded without the need to change any game server code to
		reference the new Name.

	]]
	GsdkAlias: string,
	--[[
		The name of the game certificate. This name should match the name of a
		certificate that was previously uploaded to this title.

	]]
	Name: string,
}

export type BuildSummary = {
	--[[
		The time the build was created in UTC.

	]]
	CreationTime: string?,
	--[[
		The build name.

	]]
	BuildName: string?,
	--[[
		The guid string build ID of the build.

	]]
	BuildId: string?,
	--[[
		The configuration and status for each region in the build.

	]]
	RegionConfigurations: { BuildRegion }?,
	--[[
		The metadata of the build.

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type TitleMultiplayerServerEnabledStatus = 
	| "Initializing"
	| "Enabled"
	| "Disabled"

export type GetMatchmakingQueueResult = {
	MatchmakingQueue: MatchmakingQueueConfig?,
}

--[[
	Creates a multiplayer server build with the game server running as a process
	and returns information about the build creation request.

]]
export type CreateBuildWithProcessBasedServerRequest = {
	LinuxInstrumentationConfiguration: LinuxInstrumentationConfiguration?,
	OsPlatform: OsPlatform?,
	VmStartupScriptConfiguration: VmStartupScriptParams?,
	--[[
		The region configurations for the build.

	]]
	RegionConfigurations: { BuildRegionParams },
	--[[
		The working directory for the game process. If this is not provided, the
		working directory will be set based on the mount path of the game server
		executable.

	]]
	GameWorkingDirectory: string?,
	--[[
		When true, assets will not be copied for each server inside the VM. All
		serverswill run from the same set of assets, or will have the same assets
		mounted in the container.

	]]
	AreAssetsReadonly: boolean?,
	--[[
		The game certificates for the build.

	]]
	GameCertificateReferences: { GameCertificateReferenceParams }?,
	--[[
		The game secrets for the build.

	]]
	GameSecretReferences: { GameSecretReferenceParams }?,
	--[[
		The list of game assets related to the build.

	]]
	GameAssetReferences: { AssetReferenceParams },
	--[[
		The command to run when the multiplayer server is started, including any
		arguments. The path to any executable should be relative to the root asset
		folder when unzipped.

	]]
	StartMultiplayerServerCommand: string,
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?,
	--[[
		The ports to map the build on.

	]]
	Ports: { Port },
	--[[
		The build name.

	]]
	BuildName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Indicates whether this build will be created using the OS Preview
		versionPreview OS is recommended for dev builds to detect any breaking changes
		before they are released to retail. Retail builds should set this value to
		false.

	]]
	IsOSPreview: boolean?,
	--[[
		The number of multiplayer servers to host on a single VM.

	]]
	MultiplayerServerCountPerVm: number,
	--[[
		Metadata to tag the build. The keys are case insensitive. The build metadata
		is made available to the server through Game Server SDK (GSDK).Constraints:
		Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
	InstrumentationConfiguration: InstrumentationConfiguration?,
	VmSize: AzureVmSize?,
}

export type OwnerMigrationPolicy = 
	| "None"
	| "Automatic"
	| "Manual"
	| "Server"

--[[
	The ticket includes the invited players, their attributes if they have
	joined, the ticket status, the match Id when applicable, etc. Only servers,
	the ticket creator and the invited players can get the ticket.

]]
export type GetMatchmakingTicketRequest = {
	--[[
		The name of the queue to find a match for.

	]]
	QueueName: string,
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
	--[[
		Determines whether the matchmaking attributes will be returned as an escaped
		JSON string or as an un-escaped JSON object.

	]]
	EscapeObject: boolean,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type MatchTotalRuleExpansion = {
	--[[
		Manually specify the values to use for each expansion interval. When this is
		set, Min is ignored.

	]]
	MinOverrides: { OverrideDouble }?,
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
	--[[
		Manually specify the values to use for each expansion interval. When this is
		set, Max is ignored.

	]]
	MaxOverrides: { OverrideDouble }?,
}

export type MatchmakingQueueTeam = {
	--[[
		A name to identify the team. This is case insensitive.

	]]
	Name: string,
	--[[
		The minimum number of players required for the team.

	]]
	MinTeamSize: number,
	--[[
		The maximum number of players required for the team.

	]]
	MaxTeamSize: number,
}

export type BuildRegion = {
	--[[
		The target number of standby multiplayer servers for the region.

	]]
	StandbyServers: number,
	Region: AzureRegion?,
	--[[
		Whether the game assets provided for the build have been replicated to this
		region.

	]]
	IsAssetReplicationComplete: boolean,
	ScheduledStandbySettings: ScheduledStandbySettings?,
	DynamicStandbySettings: DynamicStandbySettings?,
	VmSize: AzureVmSize?,
	--[[
		Regional override for the number of multiplayer servers to host on a single VM
		of the build.

	]]
	MultiplayerServerCountPerVm: number?,
	CurrentServerStats: CurrentServerStats?,
	--[[
		The maximum number of multiplayer servers for the region.

	]]
	MaxServers: number,
	--[[
		The status of multiplayer servers in the build region. Valid values are -
		Unknown, Initialized, Deploying, Deployed, Unhealthy, Deleting, Deleted.

	]]
	Status: string?,
}

export type BuildAliasParams = {
	--[[
		The guid string alias ID to use for the request.

	]]
	AliasId: string,
}

export type GetMultiplayerServerLogsResponse = {
	--[[
		URL for logs download.

	]]
	LogDownloadUrl: string?,
}

export type BuildAliasDetailsResponse = {
	--[[
		The alias name.

	]]
	AliasName: string?,
	--[[
		Array of build selection criteria.

	]]
	BuildSelectionCriteria: { BuildSelectionCriterion }?,
	--[[
		The guid string alias Id of the alias to be created or updated.

	]]
	AliasId: string?,
}

export type AttributeMergeFunction = 
	| "Min"
	| "Max"
	| "Average"

export type ConnectedPlayer = {
	--[[
		The player ID of the player connected to the multiplayer server.

	]]
	PlayerId: string?,
}

export type RequestMultiplayerServerResponse = {
	--[[
		The public IPv4 address of the virtual machine that is hosting this
		multiplayer server.

	]]
	IPV4Address: string?,
	--[[
		The list of public Ipv4 addresses associated with the server.

	]]
	PublicIPV4Addresses: { PublicIpAddress }?,
	--[[
		The ports the multiplayer server uses.

	]]
	Ports: { Port }?,
	--[[
		The identity of the build in which the server was allocated.

	]]
	BuildId: string?,
	--[[
		The connected players in the multiplayer server.

	]]
	ConnectedPlayers: { ConnectedPlayer }?,
	--[[
		The string server ID of the multiplayer server generated by PlayFab.

	]]
	ServerId: string?,
	--[[
		The fully qualified domain name of the virtual machine that is hosting this
		multiplayer server.

	]]
	FQDN: string?,
	Region: AzureRegion?,
	--[[
		The guid string session ID of the multiplayer server.

	]]
	SessionId: string?,
	--[[
		The time (UTC) at which a change in the multiplayer server state was observed.

	]]
	LastStateTransitionTime: string?,
	--[[
		The state of the multiplayer server.

	]]
	State: string?,
	--[[
		The virtual machine ID that the multiplayer server is located on.

	]]
	VmId: string?,
}

--[[
	Creates a multiplayer server build alias and returns the created alias.

]]
export type UpdateBuildAliasRequest = {
	--[[
		The guid string alias Id of the alias to be updated.

	]]
	AliasId: string,
	--[[
		The alias name.

	]]
	AliasName: string?,
	--[[
		Array of build selection criteria.

	]]
	BuildSelectionCriteria: { BuildSelectionCriterion }?,
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
	Gets the URL to upload assets to.

]]
export type GetAssetUploadUrlRequest = {
	--[[
		The asset's file name to get the upload URL for.

	]]
	FileName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type TeamTicketSizeSimilarityRule = {
	--[[
		Friendly name chosen by developer.

	]]
	Name: string,
	--[[
		How many seconds before this rule is no longer enforced (but tickets that
		comply with this rule will still be prioritized over those that don't). Leave
		blank if this rule is always enforced.

	]]
	SecondsUntilOptional: number?,
}

export type SetIntersectionRule = {
	LinearExpansion: LinearSetIntersectionRuleExpansion?,
	--[[
		The default value assigned to tickets that are missing the attribute specified
		by AttributePath (assuming that AttributeNotSpecifiedBehavior is UseDefault).
		Values must be unique.

	]]
	DefaultAttributeValue: { string }?,
	--[[
		How many seconds before this rule is no longer enforced (but tickets that
		comply with this rule will still be prioritized over those that don't). Leave
		blank if this rule is always enforced.

	]]
	SecondsUntilOptional: number?,
	--[[
		The minimum number of values that must match between sets.

	]]
	MinIntersectionSize: number,
	CustomExpansion: CustomSetIntersectionRuleExpansion?,
	--[[
		Friendly name chosen by developer.

	]]
	Name: string,
	--[[
		The relative weight of this rule compared to others.

	]]
	Weight: number,
	AttributeNotSpecifiedBehavior: AttributeNotSpecifiedBehavior,
	Attribute: QueueRuleAttribute,
}

export type MatchTotalRule = {
	--[[
		The minimum total value for a group. Must be >=2.

	]]
	Min: number,
	Expansion: MatchTotalRuleExpansion?,
	--[[
		Friendly name chosen by developer.

	]]
	Name: string,
	--[[
		The relative weight of this rule compared to others.

	]]
	Weight: number,
	--[[
		The maximum total value for a group. Must be >= Min.

	]]
	Max: number,
	Attribute: QueueRuleAttribute,
	--[[
		How many seconds before this rule is no longer enforced (but tickets that
		comply with this rule will still be prioritized over those that don't). Leave
		blank if this rule is always enforced.

	]]
	SecondsUntilOptional: number?,
}

export type EmptyResponse = {
	-- No properties defined in spec
	[string]: any
}

export type GameSecretReference = {
	--[[
		The name of the game secret. This name should match the name of a secret that
		was previously added to this title.

	]]
	Name: string?,
}

export type GetAssetDownloadUrlResponse = {
	--[[
		The asset's download URL.

	]]
	AssetDownloadUrl: string?,
	--[[
		The asset's file name to get the download URL for.

	]]
	FileName: string?,
}

export type GetAssetUploadUrlResponse = {
	--[[
		The asset's file name to get the upload URL for.

	]]
	FileName: string?,
	--[[
		The asset's upload URL.

	]]
	AssetUploadUrl: string?,
}

--[[
	Unsubscribe from a Match resource's notifications. For MatchInvite, players
	are expected to unsubscribe once they can no longer accept invites. For
	MatchTicketStatusChange, players are expected to unsusbcribe once the ticket
	has reached a canceled or matched state.

]]
export type UnsubscribeFromMatchResourceRequest = {
	--[[
		Opaque string, given to a client upon creating a connection with PubSub.

	]]
	PubSubConnectionHandle: string,
	--[[
		Type of the subscription to be canceled.

	]]
	Type: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Version number for the unsubscription from this resource.

	]]
	SubscriptionVersion: number,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	EntityKey: EntityKey,
	--[[
		The name of the resource to unsubscribe from. It follows the format
		{queueName}|{ticketId} for MatchTicketStatusChange. For MatchInvite,
		ResourceId is @me.

	]]
	ResourceId: string,
}

export type GetRemoteLoginEndpointResponse = {
	--[[
		The remote login IPV4 address of multiplayer server.

	]]
	IPV4Address: string?,
	--[[
		The remote login port of multiplayer server.

	]]
	Port: number,
}

export type MultiplayerServerSummary = {
	--[[
		The connected players in the multiplayer server.

	]]
	ConnectedPlayers: { ConnectedPlayer }?,
	--[[
		The string server ID of the multiplayer server generated by PlayFab.

	]]
	ServerId: string?,
	Region: AzureRegion?,
	--[[
		The title generated guid string session ID of the multiplayer server.

	]]
	SessionId: string?,
	--[[
		The time (UTC) at which a change in the multiplayer server state was observed.

	]]
	LastStateTransitionTime: string?,
	--[[
		The state of the multiplayer server.

	]]
	State: string?,
	--[[
		The virtual machine ID that the multiplayer server is located on.

	]]
	VmId: string?,
}

export type FindFriendLobbiesResult = {
	Pagination: PaginationResponse,
	--[[
		Array of lobbies found that matched FindFriendLobbies request.

	]]
	Lobbies: { FriendLobbySummary },
}

export type Lobby = {
	--[[
		An opaque string stored on a SubscribeToLobbyResource call, which indicates
		the connection an owner or member has with PubSub.

	]]
	PubSubConnectionHandle: string?,
	AccessPolicy: AccessPolicy,
	--[[
		A number that increments once for each request that modifies the lobby.

	]]
	ChangeNumber: number,
	--[[
		Lobby data.

	]]
	LobbyData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Owner: EntityKey?,
	--[[
		Array of all lobby members.

	]]
	Members: { Member }?,
	--[[
		A string used to join the lobby. This field is populated by the Lobby service.
		Invites are performed by communicating this connectionString to other players.

	]]
	ConnectionString: string,
	--[[
		A setting that controls lobby invites. When true only owners can invite new
		players, when false all members area allowed to invite.

	]]
	RestrictInvitesToLobbyOwner: boolean,
	--[[
		Search data.

	]]
	SearchData: {
		-- No properties defined in spec
		[string]: any
	}?,
	MembershipLock: MembershipLock,
	--[[
		Id to uniquely identify a lobby.

	]]
	LobbyId: string,
	OwnerMigrationPolicy: OwnerMigrationPolicy?,
	--[[
		A flag which determines if connections are used. Defaults to true. Only set on
		create.

	]]
	UseConnections: boolean,
	Server: LobbyServer?,
	--[[
		The maximum number of players allowed in the lobby.

	]]
	MaxPlayers: number,
}

export type AttributeSource = 
	| "User"
	| "PlayerEntity"

export type FriendLobbySummary = {
	--[[
		Friends in Lobby.

	]]
	Friends: { EntityKey }?,
	--[[
		Search data.

	]]
	SearchData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The current number of players in the lobby.

	]]
	CurrentPlayers: number,
	--[[
		A string used to join the lobby.This field is populated by the Lobby
		service.Invites are performed by communicating this connectionString to other
		players.

	]]
	ConnectionString: string,
	MembershipLock: MembershipLock?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Owner: EntityKey,
	--[[
		Id to uniquely identify a lobby.

	]]
	LobbyId: string,
	--[[
		The maximum number of players allowed in the lobby.

	]]
	MaxPlayers: number,
}

export type OsPlatform = 
	| "Windows"
	| "Linux"

export type VirtualMachineSummary = {
	--[[
		The virtual machine state.

	]]
	State: string?,
	--[[
		The virtual machine health status.

	]]
	HealthStatus: string?,
	--[[
		The virtual machine ID.

	]]
	VmId: string?,
}

--[[
	Deletes a remote user to log on to a VM for a multiplayer server build in a
	specific region. Returns user credential information necessary to log on.

]]
export type DeleteRemoteUserRequest = {
	--[[
		The virtual machine ID the multiplayer server is located on.

	]]
	VmId: string,
	Region: AzureRegion,
	--[[
		The guid string build ID of the multiplayer server where the remote user is to
		delete.

	]]
	BuildId: string,
	--[[
		The username of the remote user to delete.

	]]
	Username: string,
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
	Gets the status of whether a title is enabled for the multiplayer server
	feature. The enabled status can be Initializing, Enabled, and Disabled.

]]
export type GetTitleEnabledForMultiplayerServersStatusRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type StringEqualityRule = {
	--[[
		The default value assigned to tickets that are missing the attribute specified
		by AttributePath (assuming that AttributeNotSpecifiedBehavior is false).

	]]
	DefaultAttributeValue: string?,
	--[[
		Friendly name chosen by developer.

	]]
	Name: string,
	--[[
		The relative weight of this rule compared to others.

	]]
	Weight: number,
	AttributeNotSpecifiedBehavior: AttributeNotSpecifiedBehavior,
	Expansion: StringEqualityRuleExpansion?,
	Attribute: QueueRuleAttribute,
	--[[
		How many seconds before this rule is no longer enforced (but tickets that
		comply with this rule will still be prioritized over those that don't). Leave
		blank if this rule is always enforced.

	]]
	SecondsUntilOptional: number?,
}

export type StatisticsVisibilityToPlayers = {
	--[[
		Whether to allow players to view the current number of players in the
		matchmaking queue.

	]]
	ShowNumberOfPlayersMatching: boolean,
	--[[
		Whether to allow players to view statistics representing the time it takes for
		tickets to find a match.

	]]
	ShowTimeToMatch: boolean,
}

export type CoreCapacity = {
	--[[
		The available core capacity for the (Region, VmFamily)

	]]
	Available: number,
	--[[
		The total core capacity for the (Region, VmFamily)

	]]
	Total: number,
	Region: AzureRegion?,
	VmFamily: AzureVmFamily?,
}

--[[
	Request to update a lobby.

]]
export type UpdateLobbyRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	MemberEntity: EntityKey?,
	AccessPolicy: AccessPolicy?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Owner: EntityKey?,
	--[[
		The private key-value pairs which are visible to all entities in the lobby.
		Optional. Sets or updates key-value pairs on the lobby. Only the current lobby
		owner can set lobby data. Keys may be an arbitrary string of at most 30
		characters. The total size of all lobbyData values may not exceed 4096 bytes.
		Values are not individually limited. There can be up to 30 key-value pairs
		stored here. Keys are case sensitive.

	]]
	LobbyData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The private key-value pairs used by the member to communicate information to
		other members and the owner. Optional. Sets or updates new key-value pairs on
		the caller's member data. New keys will be added with their values and
		existing keys will be updated with the new values. Visible to all entities in
		the lobby. At most 30 key-value pairs may be stored here, keys are limited to
		30 characters and values to 1000. The total size of all memberData values may
		not exceed 4096 bytes. Keys are case sensitive. Servers cannot specifiy this.

	]]
	MemberData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The public key-value pairs which allow queries to differentiate between
		lobbies. Optional. Sets or updates key-value pairs on the lobby for use with
		queries. Only the current lobby owner can set search data. New keys will be
		added with their values and existing keys will be updated with the new values.
		There can be up to 30 key-value pairs stored here. Keys are of the format
		string_key1, string_key2... string_key30 for string values, or number_key1,
		number_key2, ... number_key30 for numeric values. Numeric values are floats.
		Values can be at most 256 characters long. The total size of all searchData
		values may not exceed 1024 bytes.Keys are case sensitive.

	]]
	SearchData: {
		-- No properties defined in spec
		[string]: any
	}?,
	MembershipLock: MembershipLock?,
	--[[
		The id of the lobby.

	]]
	LobbyId: string?,
	--[[
		The maximum number of players allowed in the lobby. Updates the maximum
		allowed number of players in the lobby. Only the current lobby owner can set
		this. If set, the value must be greater than or equal to the number of members
		currently in the lobby.

	]]
	MaxPlayers: number?,
	--[[
		The keys to delete from the lobby LobbyData. Optional. Behaves similar to
		searchDataToDelete, but applies to lobbyData.

	]]
	LobbyDataToDelete: { string }?,
	--[[
		The keys to delete from the lobby SearchData. Optional. Deletes key-value
		pairs on the lobby. Only the current lobby owner can delete search data. All
		the specified keys will be removed from the search data. Keys that do not
		exist in the lobby are a no-op.If the key to delete exists in the searchData
		(same request) it will result in a bad request.

	]]
	SearchDataToDelete: { string }?,
	--[[
		The keys to delete from the lobby MemberData. Optional. Deletes key-value
		pairs on the caller's member data. All the specified keys will be removed from
		the caller's member data. Keys that do not exist are a no-op. If the key to
		delete exists in the memberData (same request) it will result in a bad
		request. Servers cannot specifiy this.

	]]
	MemberDataToDelete: { string }?,
}

--[[
	Request to invite a player to a lobby the caller is already a member of.
	Only a client can invite another player to a lobby.

]]
export type InviteToLobbyRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	MemberEntity: EntityKey?,
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
	InviteeEntity: EntityKey?,
	--[[
		The id of the lobby.

	]]
	LobbyId: string?,
}

export type ListBuildSummariesResponse = {
	--[[
		The list of build summaries for a title.

	]]
	BuildSummaries: { BuildSummary }?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
}

--[[
	Request to create a lobby. A Server or client can create a lobby.

]]
export type CreateLobbyRequest = {
	AccessPolicy: AccessPolicy?,
	--[[
		A setting that controls whether only the lobby owner can send invites to join
		the lobby. When true, only the lobby owner can send invites. When false or not
		specified, any member can send invites. Defaults to false if not specified.
		Restricted to client owned lobbies.

	]]
	RestrictInvitesToLobbyOwner: boolean,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Owner: EntityKey,
	--[[
		The member initially added to the lobby. Client must specify exactly one
		member, which is the creator's entity and member data. Member
		PubSubConnectionHandle must be null or empty. Game servers must not specify
		any members.

	]]
	Members: { Member }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The public key-value pairs which allow queries to differentiate between
		lobbies. Queries will refer to these key-value pairs in their filter and order
		by clauses to retrieve lobbies fitting the specified criteria. At most 30
		key-value pairs may be stored here. Keys are of the format string_key1,
		string_key2 ... string_key30 for string values, or number_key1, number_key2,
		... number_key30 for numeric values.Numeric values are floats. Values can be
		at most 256 characters long. The total size of all searchData values may not
		exceed 1024 bytes.

	]]
	SearchData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The private key-value pairs which are visible to all entities in the lobby. At
		most 30 key-value pairs may be stored here, keys are limited to 30 characters
		and values to 1000. The total size of all lobbyData values may not exceed 4096
		bytes. Keys are case sensitive.

	]]
	LobbyData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		A setting to control whether connections are used. Defaults to true. When
		true, notifications are sent to subscribed players, disconnect detection
		removes connectionHandles, only owner migration policies using connections are
		allowed, and lobbies must have at least one connected member to be searchable
		or be a server hosted lobby with a connected server. If false, then
		notifications are not sent, connections are not allowed, and lobbies do not
		need connections to be searchable.

	]]
	UseConnections: boolean,
	OwnerMigrationPolicy: OwnerMigrationPolicy?,
	--[[
		The maximum number of players allowed in the lobby. The value must be between
		2 and 128.

	]]
	MaxPlayers: number,
}

export type CreateBuildWithProcessBasedServerResponse = {
	LinuxInstrumentationConfiguration: LinuxInstrumentationConfiguration?,
	OsPlatform: OsPlatform?,
	VmStartupScriptConfiguration: VmStartupScriptConfiguration?,
	ContainerFlavor: ContainerFlavor?,
	--[[
		The region configuration for the build.

	]]
	RegionConfigurations: { BuildRegion }?,
	--[[
		The working directory for the game process. If this is not provided, the
		working directory will be set based on the mount path of the game server
		executable.

	]]
	GameWorkingDirectory: string?,
	--[[
		When true, assets will not be copied for each server inside the VM. All
		serverswill run from the same set of assets, or will have the same assets
		mounted in the container.

	]]
	AreAssetsReadonly: boolean?,
	--[[
		The game certificates for the build.

	]]
	GameCertificateReferences: { GameCertificateReference }?,
	--[[
		The game secrets for the build.

	]]
	GameSecretReferences: { GameSecretReference }?,
	--[[
		The time the build was created in UTC.

	]]
	CreationTime: string?,
	--[[
		The command to run when the multiplayer server is started, including any
		arguments. The path to any executable is relative to the root asset folder
		when unzipped.

	]]
	StartMultiplayerServerCommand: string?,
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?,
	--[[
		The ports the build is mapped on.

	]]
	Ports: { Port }?,
	--[[
		The guid string build ID. Must be unique for every build.

	]]
	BuildId: string?,
	--[[
		The build name.

	]]
	BuildName: string?,
	--[[
		The metadata of the build.

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Indicates whether this build will be created using the OS Preview
		versionPreview OS is recommended for dev builds to detect any breaking changes
		before they are released to retail. Retail builds should set this value to
		false.

	]]
	IsOSPreview: boolean?,
	--[[
		The game assets for the build.

	]]
	GameAssetReferences: { AssetReference }?,
	--[[
		When true, assets will be downloaded and uncompressed in memory, without the
		compressedversion being written first to disc.

	]]
	UseStreamingForAssetDownloads: boolean?,
	--[[
		The number of multiplayer servers to host on a single VM of the build.

	]]
	MultiplayerServerCountPerVm: number,
	ServerType: ServerType?,
	InstrumentationConfiguration: InstrumentationConfiguration?,
	VmSize: AzureVmSize?,
}

--[[
	Add the player to a matchmaking ticket and specify all of its matchmaking
	attributes. Players can join a ticket if and only if their EntityKeys are
	already listed in the ticket's Members list. The matchmaking service
	automatically starts matching the ticket against other matchmaking tickets
	once all players have joined the ticket. It is not possible to join a ticket
	once it has started matching.

]]
export type JoinMatchmakingTicketRequest = {
	--[[
		The name of the queue to join.

	]]
	QueueName: string,
	--[[
		A user in a matchmaking ticket.

	]]
	Member: MatchmakingPlayer,
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ServerDetails = {
	--[[
		The IPv4 address of the virtual machine that is hosting this multiplayer
		server.

	]]
	IPV4Address: string?,
	--[[
		The string server ID of the multiplayer server generated by PlayFab.

	]]
	ServerId: string?,
	--[[
		The server's region.

	]]
	Region: string?,
	--[[
		The ports the multiplayer server uses.

	]]
	Ports: { Port }?,
	--[[
		The fully qualified domain name of the virtual machine that is hosting this
		multiplayer server.

	]]
	Fqdn: string?,
}

export type CancelMatchmakingTicketResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Preview: Request for server to leave a lobby. Only a game_server entity can
	leave and this is restricted to client owned lobbies which are using
	connections.

]]
export type LeaveLobbyAsServerRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	ServerEntity: EntityKey,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The id of the lobby.

	]]
	LobbyId: string,
}

--[[
	Creates a multiplayer server build with a custom container and returns
	information about the build creation request.

]]
export type CreateBuildWithCustomContainerRequest = {
	LinuxInstrumentationConfiguration: LinuxInstrumentationConfiguration?,
	VmStartupScriptConfiguration: VmStartupScriptParams?,
	ContainerFlavor: ContainerFlavor?,
	--[[
		The region configurations for the build.

	]]
	RegionConfigurations: { BuildRegionParams },
	--[[
		When true, assets will not be copied for each server inside the VM. All
		serverswill run from the same set of assets, or will have the same assets
		mounted in the container.

	]]
	AreAssetsReadonly: boolean?,
	--[[
		The game certificates for the build.

	]]
	GameCertificateReferences: { GameCertificateReferenceParams }?,
	--[[
		The game secrets for the build.

	]]
	GameSecretReferences: { GameSecretReferenceParams }?,
	--[[
		The list of game assets related to the build.

	]]
	GameAssetReferences: { AssetReferenceParams }?,
	ServerResourceConstraints: ServerResourceConstraintParams?,
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?,
	--[[
		The container command to run when the multiplayer server has been allocated,
		including any arguments.

	]]
	ContainerRunCommand: string?,
	--[[
		The ports to map the build on.

	]]
	Ports: { Port },
	--[[
		The build name.

	]]
	BuildName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	ContainerImageReference: ContainerImageReference?,
	--[[
		Metadata to tag the build. The keys are case insensitive. The build metadata
		is made available to the server through Game Server SDK (GSDK).Constraints:
		Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The number of multiplayer servers to host on a single VM.

	]]
	MultiplayerServerCountPerVm: number,
	VmSize: AzureVmSize?,
}

--[[
	Deletes a multiplayer server build.

]]
export type DeleteBuildRequest = {
	--[[
		The guid string build ID of the build to delete.

	]]
	BuildId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type MonitoringApplicationConfiguration = {
	AssetReference: AssetReference,
	--[[
		Execution script name, this will be the main executable for the monitoring
		application.

	]]
	ExecutionScriptName: string,
	--[[
		Installation script name, this will be run before the ExecutionScript.

	]]
	InstallationScriptName: string?,
	--[[
		Timespan the monitoring application will be kept alive when running from the
		start of the VM

	]]
	OnStartRuntimeInMinutes: number?,
}

export type ServerResourceConstraintParams = {
	--[[
		The maximum number of cores that each server is allowed to use.

	]]
	CpuLimit: number,
	--[[
		The maximum number of GiB of memory that each server is allowed to use.
		WARNING: After exceeding this limit, the server will be killed

	]]
	MemoryLimitGB: number,
}

--[[
	Request to unsubscribe from lobby notifications.

]]
export type UnsubscribeFromLobbyResourceRequest = {
	--[[
		Opaque string, given to a client upon creating a connection with PubSub.

	]]
	PubSubConnectionHandle: string,
	Type: SubscriptionType,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Version number passed for the subscription of this resource.

	]]
	SubscriptionVersion: number,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	EntityKey: EntityKey,
	--[[
		The name of the resource to unsubscribe from.

	]]
	ResourceId: string,
}

--[[
	Only servers and ticket members can cancel a ticket. The ticket can be in
	five different states when it is cancelled. 1: the ticket is waiting for
	members to join it, and it has not started matching. If the ticket is
	cancelled at this stage, it will never match. 2: the ticket is matching. If
	the ticket is cancelled, it will stop matching. 3: the ticket is matched. A
	matched ticket cannot be cancelled. 4: the ticket is already cancelled and
	nothing happens. 5: the ticket is waiting for a server. If the ticket is
	cancelled, server allocation will be stopped. A server may still be
	allocated due to a race condition, but that will not be reflected in the
	ticket. There may be race conditions between the ticket getting matched and
	the client making a cancellation request. The client must handle the
	possibility that the cancel request fails if a match is found before the
	cancellation request is processed. We do not allow resubmitting a cancelled
	ticket because players must consent to enter matchmaking again. Create a new
	ticket instead.

]]
export type CancelMatchmakingTicketRequest = {
	--[[
		The name of the queue the ticket is in.

	]]
	QueueName: string,
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DynamicStandbySettings = {
	--[[
		When true, dynamic standby will be enabled

	]]
	IsEnabled: boolean,
	--[[
		List of auto standing by trigger values and corresponding standing by
		multiplier. Defaults to 1.5X at 50%, 3X at 25%, and 4X at 5%

	]]
	DynamicFloorMultiplierThresholds: { DynamicStandbyThreshold }?,
	--[[
		The time it takes to reduce target standing by to configured floor value after
		an increase. Defaults to 30 minutes

	]]
	RampDownSeconds: number?,
}

--[[
	Request to leave a lobby. Only a client can leave a lobby.

]]
export type LeaveLobbyRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	MemberEntity: EntityKey?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The id of the lobby.

	]]
	LobbyId: string?,
}

export type QueueRuleAttribute = {
	Source: AttributeSource,
	--[[
		Specifies which attribute in a ticket to use.

	]]
	Path: string,
}

--[[
	Gets a remote login endpoint to a VM that is hosting a multiplayer server
	build in a specific region.

]]
export type GetRemoteLoginEndpointRequest = {
	--[[
		The virtual machine ID the multiplayer server is located on.

	]]
	VmId: string,
	--[[
		The guid string build ID of the multiplayer server to get remote login
		information for.

	]]
	BuildId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	Region: AzureRegion,
}

export type AssetReferenceParams = {
	--[[
		The asset's file name.

	]]
	FileName: string,
	--[[
		The asset's mount path.

	]]
	MountPath: string?,
}

export type ContainerImageReference = {
	--[[
		The container image name.

	]]
	ImageName: string,
	--[[
		The container tag.

	]]
	Tag: string?,
}

export type Statistics = {
	--[[
		The 50th percentile.

	]]
	Percentile50: number,
	--[[
		The average.

	]]
	Average: number,
	--[[
		The 90th percentile.

	]]
	Percentile90: number,
	--[[
		The 99th percentile.

	]]
	Percentile99: number,
}

--[[
	Uploads a multiplayer server game certificate.

]]
export type UploadCertificateRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Forces the certificate renewal if the certificate already exists. Default is
		false

	]]
	ForceUpdate: boolean?,
	GameCertificate: Certificate,
}

--[[
	Subscribe to match resource notifications. Match subscriptions have two
	types; MatchInvite and MatchTicketStatusChange

]]
export type SubscribeToMatchResourceRequest = {
	--[[
		Opaque string, given to a client upon creating a connection with PubSub.
		Notifications will be sent to the connection associated with this handle.

	]]
	PubSubConnectionHandle: string,
	--[[
		Subscription type. MatchInvite subscriptions are per-player.
		MatchTicketStatusChange subscriptions are per-ticket. Subscribe calls are
		idempotent. Subscribing on the same resource for the same connection results
		in success.

	]]
	Type: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Version number for the subscription of this resource. Current supported
		version must be 1.

	]]
	SubscriptionVersion: number,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	EntityKey: EntityKey,
	--[[
		The name of the resource to subscribe to. It follows the format
		{queueName}|{ticketId} for MatchTicketStatusChange. For MatchInvite,
		ResourceId is @me.

	]]
	ResourceId: string,
}

--[[
	Request to find lobbies.

]]
export type FindLobbiesRequest = {
	--[[
		OData style string that contains sorting for this query in either ascending
		("asc") or descending ("desc") order. OrderBy clauses are of the form
		"number_key1 asc" or the pre-defined search key "lobby/memberCount asc",
		"lobby/memberCountRemaining desc" and "lobby/maxMemberCount desc". To sort by
		closest, a moniker `distance{number_key1 = 5}` can be used to sort by distance
		from the given number. This field only supports either one sort clause or one
		distance clause.

	]]
	OrderBy: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	Pagination: PaginationRequest?,
	--[[
		OData style string that contains one or more filters. Only the following
		operators are supported: "and" (logical and), "eq" (equal), "ne" (not equals),
		"ge" (greater than or equal), "gt" (greater than), "le" (less than or equal),
		and "lt" (less than). The left-hand side of each OData logical expression
		should be either a search property key (e.g. string_key1, number_key3, etc) or
		one of the pre-defined search keys all of which must be prefixed by "lobby/":
		lobby/memberCount (number of players in a lobby), lobby/maxMemberCount
		(maximum number of players allowed in a lobby), lobby/memberCountRemaining
		(remaining number of players who can be allowed in a lobby),
		lobby/membershipLock (must equal 'Unlocked' or 'Locked'), lobby/amOwner
		(required to equal "true"), lobby/amMember (required to equal "true").

	]]
	Filter: string?,
}

export type ListTitleMultiplayerServersQuotaChangesResponse = {
	--[[
		All change requests for this title.

	]]
	Changes: { QuotaChange }?,
}

export type VmStartupScriptConfiguration = {
	VmStartupScriptAssetReference: AssetReference,
	--[[
		Optional port requests (name/protocol) that will be used by the
		VmStartupScript. Max of 5 requests.

	]]
	PortRequests: { VmStartupScriptPortRequest }?,
}

export type CancelServerBackfillTicketResult = {
	-- No properties defined in spec
	[string]: any
}

export type TitleMultiplayerServersQuotas = {
	--[[
		The core capacity for the various regions and VM Family

	]]
	CoreCapacities: { CoreCapacity }?,
}

export type CertificateSummary = {
	--[[
		The name of the certificate.

	]]
	Name: string?,
	--[[
		The thumbprint for the certificate.

	]]
	Thumbprint: string?,
}

export type ListBuildAliasesResponse = {
	--[[
		The list of build aliases for the title

	]]
	BuildAliases: { BuildAliasDetailsResponse }?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
}

--[[
	The matchmaking attributes for a user.

]]
export type MatchmakingPlayerAttributes = {
	--[[
		A data object representing a user's attributes.

	]]
	DataObject: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		An escaped data object representing a user's attributes.

	]]
	EscapedDataObject: string?,
}

--[[
	Creates a remote user to log on to a VM for a multiplayer server build in a
	specific region. Returns user credential information necessary to log on.

]]
export type CreateRemoteUserRequest = {
	--[[
		The virtual machine ID the multiplayer server is located on.

	]]
	VmId: string,
	Region: AzureRegion,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The guid string build ID of to create the remote user for.

	]]
	BuildId: string,
	--[[
		The username to create the remote user with.

	]]
	Username: string,
	--[[
		The expiration time for the remote user created. Defaults to expiring in one
		day if not specified.

	]]
	ExpirationTime: string?,
}

--[[
	Returns the matchmaking statistics for a queue. These include the number of
	players matching and the statistics related to the time to match statistics
	in seconds (average and percentiles). Statistics are refreshed once every 5
	minutes. Servers can access all statistics no matter what the
	ClientStatisticsVisibility is configured to. Clients can access statistics
	according to the ClientStatisticsVisibility. Client requests are forbidden
	if all visibility fields are false.

]]
export type GetQueueStatisticsRequest = {
	--[[
		The name of the queue.

	]]
	QueueName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateServerBackfillTicketResult = {
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
}

--[[
	Returns a list of summarized details of all multiplayer server builds for a
	title.

]]
export type ListBuildSummariesRequest = {
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type AssetSummary = {
	--[[
		The asset's file name. This is a filename with the .zip, .tar, or .tar.gz
		extension.

	]]
	FileName: string?,
	--[[
		The metadata associated with the asset.

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	List all server quota change requests for a title.

]]
export type ListTitleMultiplayerServersQuotaChangesRequest = {
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
	Updates a multiplayer server build's regions.

]]
export type UpdateBuildRegionsRequest = {
	--[[
		The guid string ID of the build we want to update regions for.

	]]
	BuildId: string,
	--[[
		The updated region configuration that should be applied to the specified
		build.

	]]
	BuildRegions: { BuildRegionParams },
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
	Returns a list of multiplayer server game asset summaries for a title.

]]
export type ListAssetSummariesRequest = {
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type JoinLobbyAsServerResult = {
	--[[
		Successfully joined lobby's id.

	]]
	LobbyId: string,
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

--[[
	Returns the details about a multiplayer server build.

]]
export type GetBuildRequest = {
	--[[
		The guid string build ID of the build to get.

	]]
	BuildId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateMatchmakingTicketResult = {
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
}

export type CreateLobbyResult = {
	--[[
		A field which indicates which lobby the user will be joining.

	]]
	ConnectionString: string,
	--[[
		Id to uniquely identify a lobby.

	]]
	LobbyId: string,
}

export type LinearDifferenceRuleExpansion = {
	--[[
		Once the total difference reaches this value, expansion stops. Optional.

	]]
	Limit: number?,
	--[[
		This value gets added to Difference at every expansion interval.

	]]
	Delta: number,
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

--[[
	Gets a list of all the matchmaking queue configurations for the title.

]]
export type ListMatchmakingQueuesRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type RoutingType = 
	| "Microsoft"
	| "Internet"

--[[
	Returns a list of the tags for a particular container image that exists in
	the container registry for a title.

]]
export type ListContainerImageTagsRequest = {
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The container images we want to list tags for.

	]]
	ImageName: string?,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
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
	Returns a list of summarized details of all multiplayer server builds for a
	title.

]]
export type ListBuildAliasesRequest = {
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
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
	Gets a URL that can be used to download the specified asset.

]]
export type GetAssetDownloadUrlRequest = {
	--[[
		The asset's file name to get the download URL for.

	]]
	FileName: string,
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
	The client specifies the creator's attributes and optionally a list of other
	users to match with.

]]
export type CreateMatchmakingTicketRequest = {
	--[[
		A list of Entity Keys of other users to match with.

	]]
	MembersToMatchWith: { EntityKey }?,
	--[[
		A user in a matchmaking ticket.

	]]
	Creator: MatchmakingPlayer,
	--[[
		The Id of a match queue.

	]]
	QueueName: string,
	--[[
		How long to attempt matching this ticket in seconds.

	]]
	GiveUpAfterSeconds: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ListCertificateSummariesResponse = {
	--[[
		The list of game certificates.

	]]
	CertificateSummaries: { CertificateSummary }?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
}

export type GetTitleEnabledForMultiplayerServersStatusResponse = {
	Status: TitleMultiplayerServerEnabledStatus?,
}

export type RolloverContainerRegistryCredentialsResponse = {
	--[[
		The password for accessing the container registry.

	]]
	Password: string?,
	--[[
		The url of the container registry.

	]]
	DnsName: string?,
	--[[
		The username for accessing the container registry.

	]]
	Username: string?,
}

export type CancelAllServerBackfillTicketsForPlayerResult = {
	-- No properties defined in spec
	[string]: any
}

export type CustomRegionSelectionRuleExpansion = {
	--[[
		Manually specify the maximum latency to use for each expansion interval.

	]]
	MaxLatencyOverrides: { OverrideUnsignedInt },
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

--[[
	Returns a list of the container images that have been uploaded to the
	container registry for a title.

]]
export type ListContainerImagesRequest = {
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type AzureRegion = 
	| "AustraliaEast"
	| "AustraliaSoutheast"
	| "BrazilSouth"
	| "CentralUs"
	| "EastAsia"
	| "EastUs"
	| "EastUs2"
	| "JapanEast"
	| "JapanWest"
	| "NorthCentralUs"
	| "NorthEurope"
	| "SouthCentralUs"
	| "SoutheastAsia"
	| "WestEurope"
	| "WestUs"
	| "SouthAfricaNorth"
	| "WestCentralUs"
	| "KoreaCentral"
	| "FranceCentral"
	| "WestUs2"
	| "CentralIndia"
	| "UaeNorth"
	| "UkSouth"
	| "SwedenCentral"
	| "CanadaCentral"
	| "MexicoCentral"

export type JoinLobbyResult = {
	--[[
		Successfully joined lobby's id.

	]]
	LobbyId: string,
}

--[[
	A player in a created matchmaking match with a team assignment.

]]
export type MatchmakingPlayerWithTeamAssignment = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
	--[[
		The matchmaking attributes for a user.

	]]
	Attributes: MatchmakingPlayerAttributes?,
	--[[
		The Id of the team the User is assigned to.

	]]
	TeamId: string?,
}

export type ListContainerImagesResponse = {
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The list of container images.

	]]
	Images: { string }?,
}

export type ListContainerImageTagsResponse = {
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The list of tags for a particular container image.

	]]
	Tags: { string }?,
}

--[[
	Returns a list of multiplayer servers for a build in a specific region.

]]
export type ListMultiplayerServersRequest = {
	Region: AzureRegion,
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The guid string build ID of the multiplayer servers to list.

	]]
	BuildId: string,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetQueueStatisticsResult = {
	TimeToMatchStatisticsInSeconds: Statistics?,
	--[[
		The current number of players in the matchmaking queue, who are waiting to be
		matched.

	]]
	NumberOfPlayersMatching: number?,
}

--[[
	Creates a request to change a title's multiplayer server quotas.

]]
export type CreateTitleMultiplayerServersQuotaChangeRequest = {
	--[[
		Additional information about this request that our team can use to better
		understand the requirements.

	]]
	Notes: string?,
	--[[
		A brief description of the requested changes.

	]]
	ChangeDescription: string?,
	--[[
		When these changes would need to be in effect. Only required when a request is
		not approved.

	]]
	StartDate: string?,
	--[[
		Email to be contacted by our team about this request. Only required when a
		request is not approved.

	]]
	ContactEmail: string?,
	--[[
		Changes to make to the titles cores quota.

	]]
	Changes: { CoreCapacityChange },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type MembershipLock = 
	| "Unlocked"
	| "Locked"

--[[
	Deletes a multiplayer server game secret.

]]
export type DeleteSecretRequest = {
	--[[
		The name of the secret.

	]]
	Name: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ProtocolType = 
	| "TCP"
	| "UDP"

--[[
	The server specifies all the members, their teams and their attributes, and
	the server details if applicable.

]]
export type CreateServerBackfillTicketRequest = {
	--[[
		How long to attempt matching this ticket in seconds.

	]]
	GiveUpAfterSeconds: number,
	--[[
		The Id of a match queue.

	]]
	QueueName: string,
	--[[
		The users who will be part of this ticket, along with their team assignments.

	]]
	Members: { MatchmakingPlayerWithTeamAssignment },
	ServerDetails: ServerDetails?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CustomDifferenceRuleExpansion = {
	--[[
		Manually specify the values to use for each expansion interval (this overrides
		Difference, Delta, and MaxDifference).

	]]
	DifferenceOverrides: { OverrideDouble },
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

export type PartyNetworkConfiguration = {
	--[[
		The maximum number of users allowed per device. Must be between 1 and 8,
		inclusive.

	]]
	MaxUsersPerDevice: number,
	DirectPeerConnectivityOptions: DirectPeerConnectivityOptions?,
	--[[
		The maximum number of unique users allowed in the network. Must be greater
		than 0.

	]]
	MaxUsers: number,
	--[[
		The maximum number of devices allowed to connect to the network. Must be
		between 1 and 128, inclusive.

	]]
	MaxDevices: number,
	--[[
		The maximum number of devices allowed per user. Must be greater than 0.

	]]
	MaxDevicesPerUser: number,
	--[[
		The maximum number of endpoints allowed per device. Must be between 0 and 32,
		inclusive.

	]]
	MaxEndpointsPerDevice: number,
	PartyInvitationConfiguration: PartyInvitationConfiguration?,
}

--[[
	Gets credentials to the container registry where game developers can upload
	custom container images to before creating a new build.

]]
export type GetContainerRegistryCredentialsRequest = {
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
	Returns a list of quality of service servers for party.

]]
export type ListPartyQosServersRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type DynamicStandbyThreshold = {
	--[[
		When the trigger threshold is reached, multiply by this value

	]]
	Multiplier: number,
	--[[
		The multiplier will be applied when the actual standby divided by target
		standby floor is less than this value

	]]
	TriggerThresholdPercentage: number,
}

export type MatchmakingQueueConfig = {
	--[[
		Boolean flag to enable server allocation for the queue.

	]]
	ServerAllocationEnabled: boolean,
	RegionSelectionRule: RegionSelectionRule?,
	--[[
		List of match total rules used to find an optimal match.

	]]
	MatchTotalRules: { MatchTotalRule }?,
	StatisticsVisibilityToPlayers: StatisticsVisibilityToPlayers?,
	--[[
		Minimum number of players in a match.

	]]
	MinMatchSize: number,
	--[[
		Maximum number of players in a ticket. Optional.

	]]
	MaxTicketSize: number?,
	BuildAliasParams: BuildAliasParams?,
	--[[
		Maximum number of players in a match.

	]]
	MaxMatchSize: number,
	--[[
		List of difference rules used to find an optimal match.

	]]
	DifferenceRules: { DifferenceRule }?,
	--[[
		This is the buildId that will be used to allocate the multiplayer server for
		the match.

	]]
	BuildId: string?,
	TeamTicketSizeSimilarityRule: TeamTicketSizeSimilarityRule?,
	--[[
		Unique identifier for a Queue. Chosen by the developer.

	]]
	Name: string,
	--[[
		List of set intersection rules used to find an optimal match.

	]]
	SetIntersectionRules: { SetIntersectionRule }?,
	--[[
		List of string equality rules used to find an optimal match.

	]]
	StringEqualityRules: { StringEqualityRule }?,
	--[[
		The team configuration for a match. This may be null if there are no teams.

	]]
	Teams: { MatchmakingQueueTeam }?,
	TeamSizeBalanceRule: TeamSizeBalanceRule?,
	--[[
		List of team difference rules used to find an optimal match.

	]]
	TeamDifferenceRules: { TeamDifferenceRule }?,
}

export type RequestPartyServiceResponse = {
	--[[
		The invitation identifier supplied in the PartyInvitationConfiguration, or the
		PlayFab-generated guid if none was supplied.

	]]
	InvitationId: string?,
	--[[
		A base-64 encoded string containing the serialized network descriptor for this
		party.

	]]
	SerializedNetworkDescriptor: string?,
	--[[
		The guid string party ID of the party session.

	]]
	PartyId: string?,
}

--[[
	Only servers can cancel a backfill ticket. The ticket can be in three
	different states when it is cancelled. 1: the ticket is matching. If the
	ticket is cancelled, it will stop matching. 2: the ticket is matched. A
	matched ticket cannot be cancelled. 3: the ticket is already cancelled and
	nothing happens. There may be race conditions between the ticket getting
	matched and the server making a cancellation request. The server must handle
	the possibility that the cancel request fails if a match is found before the
	cancellation request is processed. We do not allow resubmitting a cancelled
	ticket. Create a new ticket instead.

]]
export type CancelServerBackfillTicketRequest = {
	--[[
		The name of the queue the ticket is in.

	]]
	QueueName: string,
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CreateBuildWithManagedContainerResponse = {
	OsPlatform: OsPlatform?,
	VmStartupScriptConfiguration: VmStartupScriptConfiguration?,
	ContainerFlavor: ContainerFlavor?,
	--[[
		The region configuration for the build.

	]]
	RegionConfigurations: { BuildRegion }?,
	--[[
		The directory containing the game executable. This would be the start path of
		the game assets that contain the main game server executable. If not provided,
		a best effort will be made to extract it from the start game command.

	]]
	GameWorkingDirectory: string?,
	--[[
		When true, assets will not be copied for each server inside the VM. All
		serverswill run from the same set of assets, or will have the same assets
		mounted in the container.

	]]
	AreAssetsReadonly: boolean?,
	--[[
		The game certificates for the build.

	]]
	GameCertificateReferences: { GameCertificateReference }?,
	--[[
		The game secrets for the build.

	]]
	GameSecretReferences: { GameSecretReference }?,
	--[[
		The time the build was created in UTC.

	]]
	CreationTime: string?,
	--[[
		The command to run when the multiplayer server has been allocated, including
		any arguments.

	]]
	StartMultiplayerServerCommand: string?,
	ServerResourceConstraints: ServerResourceConstraintParams?,
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?,
	--[[
		The ports the build is mapped on.

	]]
	Ports: { Port }?,
	--[[
		The guid string build ID. Must be unique for every build.

	]]
	BuildId: string?,
	--[[
		The build name.

	]]
	BuildName: string?,
	--[[
		The metadata of the build.

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The game assets for the build.

	]]
	GameAssetReferences: { AssetReference }?,
	--[[
		When true, assets will be downloaded and uncompressed in memory, without the
		compressedversion being written first to disc.

	]]
	UseStreamingForAssetDownloads: boolean?,
	--[[
		The number of multiplayer servers to host on a single VM of the build.

	]]
	MultiplayerServerCountPerVm: number,
	ServerType: ServerType?,
	InstrumentationConfiguration: InstrumentationConfiguration?,
	VmSize: AzureVmSize?,
}

export type QuotaChange = {
	--[[
		Additional information about this request that our team can use to better
		understand the requirements.

	]]
	Notes: string?,
	--[[
		A brief description of the requested changes.

	]]
	ChangeDescription: string?,
	--[[
		Whether or not this request is pending a review.

	]]
	IsPendingReview: boolean,
	--[[
		Requested changes to make to the titles cores quota.

	]]
	Changes: { CoreCapacityChange }?,
	--[[
		Comments by our team when a request is reviewed.

	]]
	ReviewComments: string?,
	--[[
		Whether or not this request was approved.

	]]
	WasApproved: boolean,
	--[[
		Id of the change request.

	]]
	RequestId: string?,
}

export type ListPartyQosServersResponse = {
	--[[
		The list of QoS servers.

	]]
	QosServers: { QosServer }?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
}

export type PublicIpAddress = {
	--[[
		Server IP Address

	]]
	IpAddress: string,
	--[[
		FQDN of the public IP

	]]
	FQDN: string,
	RoutingType: RoutingType,
}

export type LobbyEmptyResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Requests a multiplayer server session from a particular build in any of the
	given preferred regions.

]]
export type RequestMultiplayerServerRequest = {
	--[[
		Initial list of players (potentially matchmade) allowed to connect to the
		game. This list is passed to the game server when requested (via GSDK) and can
		be used to validate players connecting to it.

	]]
	InitialPlayers: { string }?,
	--[[
		The guid string build ID of the multiplayer server to request.

	]]
	BuildId: string?,
	BuildAliasParams: BuildAliasParams?,
	--[[
		A guid string session ID created track the multiplayer server session over its
		life.

	]]
	SessionId: string,
	--[[
		Data encoded as a string that is passed to the game server when requested.
		This can be used to communicate information such as game mode or map through
		the request flow. Maximum size is 8KB

	]]
	SessionCookie: string?,
	--[[
		The preferred regions to request a multiplayer server from. The Multiplayer
		Service will iterate through the regions in the specified order and allocate a
		server from the first one that has servers available.

	]]
	PreferredRegions: { AzureRegion },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LobbyServer = {
	--[[
		Opaque string, stored on a Subscribe call, which indicates the connection a
		joined server has with PubSub.

	]]
	PubSubConnectionHandle: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	ServerEntity: EntityKey?,
	--[[
		Key-value pairs specific to the joined server.

	]]
	ServerData: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type Certificate = {
	--[[
		If required for your PFX certificate, use this field to provide a password
		that will be used to install the certificate on the container.

	]]
	Password: string?,
	--[[
		Base64 encoded string contents of the certificate.

	]]
	Base64EncodedValue: string,
	--[[
		A name for the certificate. This is used to reference certificates in build
		configurations.

	]]
	Name: string,
}

--[[
	Creates a multiplayer server build alias and returns the created alias.

]]
export type CreateBuildAliasRequest = {
	--[[
		The alias name.

	]]
	AliasName: string,
	--[[
		Array of build selection criteria.

	]]
	BuildSelectionCriteria: { BuildSelectionCriterion }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CustomTeamSizeBalanceRuleExpansion = {
	--[[
		Manually specify the team size difference to use for each expansion interval.

	]]
	DifferenceOverrides: { OverrideUnsignedInt },
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

export type Schedule = {
	--[[
		A short description about this schedule. For example, "Game launch on July
		15th".

	]]
	Description: string?,
	--[[
		Disables the schedule.

	]]
	IsDisabled: boolean,
	--[[
		The date and time in UTC at which the schedule ends. If IsRecurringWeekly is
		true, this schedule will keep renewing for future weeks until disabled or
		removed.

	]]
	EndTime: string,
	--[[
		The date and time in UTC at which the schedule starts.

	]]
	StartTime: string,
	--[[
		If true, the StartTime and EndTime will get renewed every week.

	]]
	IsRecurringWeekly: boolean,
	--[[
		The standby target to maintain for the duration of the schedule.

	]]
	TargetStandby: number,
}

export type TeamSizeBalanceRule = {
	LinearExpansion: LinearTeamSizeBalanceRuleExpansion?,
	--[[
		Friendly name chosen by developer.

	]]
	Name: string,
	--[[
		The allowed difference in team size between any two teams.

	]]
	Difference: number,
	CustomExpansion: CustomTeamSizeBalanceRuleExpansion?,
	--[[
		How many seconds before this rule is no longer enforced (but tickets that
		comply with this rule will still be prioritized over those that don't). Leave
		blank if this rule is always enforced.

	]]
	SecondsUntilOptional: number?,
}

export type ListSecretSummariesResponse = {
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The list of game secret.

	]]
	SecretSummaries: { SecretSummary }?,
}

--[[
	Returns a list of multiplayer server game secrets for a title.

]]
export type ListSecretSummariesRequest = {
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ContainerFlavor = 
	| "ManagedWindowsServerCore"
	| "CustomLinux"
	| "ManagedWindowsServerCorePreview"
	| "Invalid"

export type JoinMatchmakingTicketResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Removes a multiplayer server build's region.

]]
export type DeleteBuildRegionRequest = {
	--[[
		The guid string ID of the build we want to update regions for.

	]]
	BuildId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	Region: AzureRegion,
}

export type PartyInvitationRevocability = 
	| "Creator"
	| "Anyone"

--[[
	When matchmaking has successfully matched together a collection of tickets,
	it produces a 'match' with an Id. The match contains all of the players that
	were matched together, and their team assigments. Only servers and ticket
	members can get the match.

]]
export type GetMatchRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The name of the queue to join.

	]]
	QueueName: string,
	--[[
		Determines whether the matchmaking attributes will be returned as an escaped
		JSON string or as an un-escaped JSON object.

	]]
	EscapeObject: boolean,
	--[[
		The Id of a match.

	]]
	MatchId: string,
	--[[
		Determines whether the matchmaking attributes for each user should be returned
		in the response for match request.

	]]
	ReturnMemberAttributes: boolean,
}

export type SubscribeToLobbyResourceResult = {
	--[[
		Topic will be returned in all notifications that are the result of this
		subscription.

	]]
	Topic: string,
}

export type PubSubNegotiateResult = {
	--[[
		The access token for the PubSub Azure SignalR service.

	]]
	AccessToken: string?,
	--[[
		The Url of the PubSub Azure SignalR endpoint.

	]]
	Url: string?,
}

export type LobbySummary = {
	--[[
		Search data.

	]]
	SearchData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The current number of players in the lobby.

	]]
	CurrentPlayers: number,
	--[[
		A string used to join the lobby.This field is populated by the Lobby
		service.Invites are performed by communicating this connectionString to other
		players.

	]]
	ConnectionString: string,
	MembershipLock: MembershipLock?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Owner: EntityKey,
	--[[
		Id to uniquely identify a lobby.

	]]
	LobbyId: string,
	--[[
		The maximum number of players allowed in the lobby.

	]]
	MaxPlayers: number,
}

--[[
	Gets the quotas for a title in relation to multiplayer servers.

]]
export type GetTitleMultiplayerServersQuotasRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type SubscribeToMatchResourceResult = {
	--[[
		Matchmaking resource

	]]
	Topic: string,
}

--[[
	Returns a list of virtual machines for a title.

]]
export type ListVirtualMachineSummariesRequest = {
	Region: AzureRegion,
	--[[
		The skip token for the paged request.

	]]
	SkipToken: string?,
	--[[
		The guid string build ID of the virtual machines to list.

	]]
	BuildId: string,
	--[[
		The page size for the request.

	]]
	PageSize: number?,
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
	Deletes a multiplayer server game asset for a title.

]]
export type DeleteAssetRequest = {
	--[[
		The filename of the asset to delete.

	]]
	FileName: string,
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
	Executes the shutdown callback from the GSDK and terminates the multiplayer
	server session. The callback in the GSDK will allow for graceful shutdown
	with a 15 minute timeoutIf graceful shutdown has not been completed before
	15 minutes have elapsed, the multiplayer server session will be forcefully
	terminated on it's own.

]]
export type ShutdownMultiplayerServerRequest = {
	--[[
		A guid string session ID of the multiplayer server to shut down.

	]]
	SessionId: string,
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
	If the caller is a title, the EntityKey in the request is required. If the
	caller is a player, then it is optional. If it is provided it must match the
	caller's entity.

]]
export type ListMatchmakingTicketsForPlayerRequest = {
	--[[
		The name of the queue to find a match for.

	]]
	QueueName: string,
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

--[[
	SignalR clients make this request to initiate their connection to the
	PubSubHub SignalR service. Clients will interpret the response and make a
	persistent websocket connection to the service with the details.

]]
export type PubSubNegotiateRequest = {
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
	Deletes a multiplayer server build alias.

]]
export type DeleteBuildAliasRequest = {
	--[[
		The guid string alias ID of the alias to perform the action on.

	]]
	AliasId: string,
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
	Gets multiplayer server session details for a build in a specific region.

]]
export type GetMultiplayerServerDetailsRequest = {
	--[[
		The title generated guid string session ID of the multiplayer server to get
		details for. This is to keep track of multiplayer server sessions.

	]]
	SessionId: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type CancelAllMatchmakingTicketsForPlayerResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Creates a multiplayer server build with a managed container and returns
	information about the build creation request.

]]
export type CreateBuildWithManagedContainerRequest = {
	VmStartupScriptConfiguration: VmStartupScriptParams?,
	ContainerFlavor: ContainerFlavor?,
	--[[
		The region configurations for the build.

	]]
	RegionConfigurations: { BuildRegionParams },
	--[[
		The directory containing the game executable. This would be the start path of
		the game assets that contain the main game server executable. If not provided,
		a best effort will be made to extract it from the start game command.

	]]
	GameWorkingDirectory: string?,
	--[[
		When true, assets will not be copied for each server inside the VM. All
		serverswill run from the same set of assets, or will have the same assets
		mounted in the container.

	]]
	AreAssetsReadonly: boolean?,
	--[[
		The game certificates for the build.

	]]
	GameCertificateReferences: { GameCertificateReferenceParams }?,
	--[[
		The game secrets for the build.

	]]
	GameSecretReferences: { GameSecretReferenceParams }?,
	--[[
		The list of game assets related to the build.

	]]
	GameAssetReferences: { AssetReferenceParams },
	--[[
		The command to run when the multiplayer server is started, including any
		arguments.

	]]
	StartMultiplayerServerCommand: string,
	ServerResourceConstraints: ServerResourceConstraintParams?,
	WindowsCrashDumpConfiguration: WindowsCrashDumpConfiguration?,
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?,
	--[[
		The ports to map the build on.

	]]
	Ports: { Port },
	--[[
		The build name.

	]]
	BuildName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The number of multiplayer servers to host on a single VM.

	]]
	MultiplayerServerCountPerVm: number,
	--[[
		Metadata to tag the build. The keys are case insensitive. The build metadata
		is made available to the server through Game Server SDK (GSDK).Constraints:
		Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
	InstrumentationConfiguration: InstrumentationConfiguration?,
	VmSize: AzureVmSize?,
}

--[[
	The ticket includes the players, their attributes, their teams, the ticket
	status, the match Id and the server details when applicable, etc. Only
	servers can get the ticket.

]]
export type GetServerBackfillTicketRequest = {
	--[[
		The name of the queue to find a match for.

	]]
	QueueName: string,
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
	--[[
		Determines whether the matchmaking attributes will be returned as an escaped
		JSON string or as an un-escaped JSON object.

	]]
	EscapeObject: boolean,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type OverrideDouble = {
	--[[
		The custom expansion value.

	]]
	Value: number,
}

export type SubscriptionType = 
	| "LobbyChange"
	| "LobbyInvite"

--[[
	List all server backfill ticket Ids the user is a member of.

]]
export type ListServerBackfillTicketsForPlayerRequest = {
	--[[
		The name of the queue the tickets are in.

	]]
	QueueName: string,
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

export type RemoveMatchmakingQueueResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Uploads a multiplayer server game secret.

]]
export type UploadSecretRequest = {
	GameSecret: Secret,
	--[[
		Forces the secret renewal if the secret already exists. Default is false

	]]
	ForceUpdate: boolean?,
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
	Requests a party session from a particular set of builds if build alias
	params is provided, in any of the given preferred regions.

]]
export type RequestPartyServiceRequest = {
	--[[
		The preferred regions to request a party session from. The party service will
		iterate through the regions in the specified order and allocate a party
		session from the first one that is available.

	]]
	PreferredRegions: { AzureRegion },
	NetworkConfiguration: PartyNetworkConfiguration,
	--[[
		A guid string party ID created track the party session over its life.

	]]
	PartyId: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetTitleMultiplayerServersQuotasResponse = {
	Quotas: TitleMultiplayerServersQuotas?,
}

export type GetContainerRegistryCredentialsResponse = {
	--[[
		The password for accessing the container registry.

	]]
	Password: string?,
	--[[
		The url of the container registry.

	]]
	DnsName: string?,
	--[[
		The username for accessing the container registry.

	]]
	Username: string?,
}

--[[
	Request to remove a member from a lobby. Owners may remove other members
	from a lobby. Members cannot remove themselves (use LeaveLobby instead).

]]
export type RemoveMemberFromLobbyRequest = {
	--[[
		If true, removed member can never rejoin this lobby.

	]]
	PreventRejoin: boolean,
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
	MemberEntity: EntityKey?,
	--[[
		The id of the lobby.

	]]
	LobbyId: string?,
}

export type TeamDifferenceRule = {
	LinearExpansion: LinearTeamDifferenceRuleExpansion?,
	--[[
		The default value assigned to tickets that are missing the attribute specified
		by AttributePath (assuming that AttributeNotSpecifiedBehavior is false).

	]]
	DefaultAttributeValue: number,
	--[[
		Friendly name chosen by developer.

	]]
	Name: string,
	--[[
		The allowed difference between any two teams at the start of matchmaking.

	]]
	Difference: number,
	CustomExpansion: CustomTeamDifferenceRuleExpansion?,
	Attribute: QueueRuleAttribute,
	--[[
		How many seconds before this rule is no longer enforced (but tickets that
		comply with this rule will still be prioritized over those that don't). Leave
		blank if this rule is always enforced.

	]]
	SecondsUntilOptional: number?,
}

export type AccessPolicy = 
	| "Public"
	| "Friends"
	| "Private"

export type PaginationRequest = {
	--[[
		Continuation token returned as a result in a previous FindLobbies call. Cannot
		be specified by clients.

	]]
	ContinuationToken: string?,
	--[[
		The number of lobbies that should be retrieved. Cannot be specified by
		servers, clients may specify any value up to 50

	]]
	PageSizeRequested: number?,
}

--[[
	Request to find friends lobbies. Only a client can find friend lobbies.

]]
export type FindFriendLobbiesRequest = {
	--[[
		OData style string that contains sorting for this query in either ascending
		("asc") or descending ("desc") order. OrderBy clauses are of the form
		"number_key1 asc" or the pre-defined search key "lobby/memberCount asc",
		"lobby/memberCountRemaining desc" and "lobby/maxMemberCount desc". To sort by
		closest, a moniker `distance{number_key1 = 5}` can be used to sort by distance
		from the given number. This field only supports either one sort clause or one
		distance clause.

	]]
	OrderBy: string?,
	Pagination: PaginationRequest?,
	--[[
		OData style string that contains one or more filters. Only the following
		operators are supported: "and" (logical and), "eq" (equal), "ne" (not equals),
		"ge" (greater than or equal), "gt" (greater than), "le" (less than or equal),
		and "lt" (less than). The left-hand side of each OData logical expression
		should be either a search property key (e.g. string_key1, number_key3, etc) or
		one of the pre-defined search keys all of which must be prefixed by "lobby/":
		lobby/memberCount (number of players in a lobby), lobby/maxMemberCount
		(maximum number of players allowed in a lobby), lobby/memberCountRemaining
		(remaining number of players who can be allowed in a lobby),
		lobby/membershipLock (must equal 'Unlocked' or 'Locked'), lobby/amOwner
		(required to equal "true"), lobby/amMember (required to equal "true").

	]]
	Filter: string?,
	--[[
		Xbox token if Xbox friends should be included. Requires Xbox be configured on
		PlayFab.

	]]
	XboxToken: string?,
	ExternalPlatformFriends: ExternalFriendSources?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ScheduledStandbySettings = {
	--[[
		When true, scheduled standby will be enabled

	]]
	IsEnabled: boolean,
	--[[
		A list of non-overlapping schedules

	]]
	ScheduleList: { Schedule }?,
}

export type Secret = {
	--[[
		Secret value.

	]]
	Value: string,
	--[[
		Optional secret expiration date.

	]]
	ExpirationDate: string?,
	--[[
		A name for the secret. This is used to reference secrets in build
		configurations.

	]]
	Name: string,
}

--[[
	Gets the current configuration for a queue.

]]
export type GetMatchmakingQueueRequest = {
	--[[
		The Id of the matchmaking queue to retrieve.

	]]
	QueueName: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ServerType = 
	| "Container"
	| "Process"

export type CreateBuildWithCustomContainerResponse = {
	CustomGameContainerImage: ContainerImageReference?,
	OsPlatform: OsPlatform?,
	VmStartupScriptConfiguration: VmStartupScriptConfiguration?,
	ContainerFlavor: ContainerFlavor?,
	--[[
		The region configuration for the build.

	]]
	RegionConfigurations: { BuildRegion }?,
	--[[
		When true, assets will not be copied for each server inside the VM. All
		serverswill run from the same set of assets, or will have the same assets
		mounted in the container.

	]]
	AreAssetsReadonly: boolean?,
	--[[
		The game certificates for the build.

	]]
	GameCertificateReferences: { GameCertificateReference }?,
	--[[
		The game secrets for the build.

	]]
	GameSecretReferences: { GameSecretReference }?,
	--[[
		The time the build was created in UTC.

	]]
	CreationTime: string?,
	ServerResourceConstraints: ServerResourceConstraintParams?,
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?,
	--[[
		The container command to run when the multiplayer server has been allocated,
		including any arguments.

	]]
	ContainerRunCommand: string?,
	--[[
		The ports the build is mapped on.

	]]
	Ports: { Port }?,
	--[[
		The guid string build ID. Must be unique for every build.

	]]
	BuildId: string?,
	--[[
		The build name.

	]]
	BuildName: string?,
	--[[
		The metadata of the build.

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The game assets for the build.

	]]
	GameAssetReferences: { AssetReference }?,
	LinuxInstrumentationConfiguration: LinuxInstrumentationConfiguration?,
	--[[
		The number of multiplayer servers to host on a single VM of the build.

	]]
	MultiplayerServerCountPerVm: number,
	ServerType: ServerType?,
	--[[
		When true, assets will be downloaded and uncompressed in memory, without the
		compressedversion being written first to disc.

	]]
	UseStreamingForAssetDownloads: boolean?,
	VmSize: AzureVmSize?,
}

--[[
	Request to join a lobby. Only a client can join a lobby.

]]
export type JoinLobbyRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	MemberEntity: EntityKey?,
	--[[
		A field which indicates which lobby the user will be joining. This field is
		opaque to everyone except the Lobby service.

	]]
	ConnectionString: string?,
	--[[
		The private key-value pairs used by the member to communicate information to
		other members and the owner. Visible to all entities in the lobby. At most 30
		key-value pairs may be stored here, keys are limited to 30 characters and
		values to 1000. The total size of all memberData values may not exceed 4096
		bytes.Keys are case sensitive.

	]]
	MemberData: {
		-- No properties defined in spec
		[string]: any
	}?,
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
	Use this API to create or update matchmaking queue configurations. The queue
	configuration defines the matchmaking rules. The matchmaking service will
	match tickets together according to the configured rules. Queue resources
	are not spun up by calling this API. Queues are created when the first
	ticket is submitted.

]]
export type SetMatchmakingQueueRequest = {
	MatchmakingQueue: MatchmakingQueueConfig,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type AzureVmFamily = 
	| "A"
	| "Av2"
	| "Dv2"
	| "Dv3"
	| "F"
	| "Fsv2"
	| "Dasv4"
	| "Dav4"
	| "Dadsv5"
	| "Dadsv6"
	| "Eav4"
	| "Easv4"
	| "Ev4"
	| "Esv4"
	| "Dsv3"
	| "Dsv2"
	| "NCasT4_v3"
	| "Ddv4"
	| "Ddsv4"
	| "HBv3"
	| "Ddv5"
	| "Ddsv5"

export type ListAssetSummariesResponse = {
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The list of asset summaries.

	]]
	AssetSummaries: { AssetSummary }?,
}

export type GetMultiplayerServerDetailsResponse = {
	--[[
		The public IPv4 address of the virtual machine that is hosting this
		multiplayer server.

	]]
	IPV4Address: string?,
	--[[
		The list of public Ipv4 addresses associated with the server.

	]]
	PublicIPV4Addresses: { PublicIpAddress }?,
	--[[
		The ports the multiplayer server uses.

	]]
	Ports: { Port }?,
	--[[
		The identity of the build in which the server was allocated.

	]]
	BuildId: string?,
	--[[
		The connected players in the multiplayer server.

	]]
	ConnectedPlayers: { ConnectedPlayer }?,
	--[[
		The string server ID of the multiplayer server generated by PlayFab.

	]]
	ServerId: string?,
	--[[
		The fully qualified domain name of the virtual machine that is hosting this
		multiplayer server.

	]]
	FQDN: string?,
	Region: AzureRegion?,
	--[[
		The guid string session ID of the multiplayer server.

	]]
	SessionId: string?,
	--[[
		The time (UTC) at which a change in the multiplayer server state was observed.

	]]
	LastStateTransitionTime: string?,
	--[[
		The state of the multiplayer server.

	]]
	State: string?,
	--[[
		The virtual machine ID that the multiplayer server is located on.

	]]
	VmId: string?,
}

export type PartyInvitationConfiguration = {
	--[[
		The list of PlayFab EntityKeys that the invitation allows to authenticate into
		the network. If this list is empty, all users are allowed to authenticate
		using the invitation's identifier. This list may contain no more than 1024
		items.

	]]
	EntityKeys: { EntityKey }?,
	Revocability: PartyInvitationRevocability?,
	--[[
		The invite identifier for this party. If this value is specified, it must be
		no longer than 127 characters.

	]]
	Identifier: string?,
}

--[[
	Gets a title's server quota change request.

]]
export type GetTitleMultiplayerServersQuotaChangeRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Id of the change request to get.

	]]
	RequestId: string,
}

export type WindowsCrashDumpConfiguration = {
	--[[
		Designates whether automatic crash dump capturing will be enabled for this
		Build.

	]]
	IsEnabled: boolean,
	--[[
		See
		https://docs.microsoft.com/en-us/windows/win32/wer/collecting-user-mode-dumps
		for valid values.

	]]
	CustomDumpFlags: number?,
	--[[
		See
		https://docs.microsoft.com/en-us/windows/win32/wer/collecting-user-mode-dumps
		for valid values.

	]]
	DumpType: number?,
}

--[[
	Returns the details about a multiplayer server build alias.

]]
export type GetBuildAliasRequest = {
	--[[
		The guid string alias ID of the alias to perform the action on.

	]]
	AliasId: string,
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
	Request to get a lobby.

]]
export type GetLobbyRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The id of the lobby.

	]]
	LobbyId: string?,
}

export type DirectPeerConnectivityOptions = 
	| "None"
	| "SamePlatformType"
	| "DifferentPlatformType"
	| "AnyPlatformType"
	| "SameEntityLoginProvider"
	| "DifferentEntityLoginProvider"
	| "AnyEntityLoginProvider"
	| "AnyPlatformTypeAndEntityLoginProvider"
	| "OnlyServers"

export type CreateRemoteUserResponse = {
	--[[
		The username for the remote user that was created.

	]]
	Username: string?,
	--[[
		The generated password for the remote user that was created.

	]]
	Password: string?,
	--[[
		The expiration time for the remote user created.

	]]
	ExpirationTime: string?,
}

export type SetMatchmakingQueueResult = {
	-- No properties defined in spec
	[string]: any
}

--[[
	Deletes the configuration for a queue. This will permanently delete the
	configuration and players will no longer be able to match in the queue. All
	outstanding matchmaking tickets will be cancelled.

]]
export type RemoveMatchmakingQueueRequest = {
	--[[
		The Id of the matchmaking queue to remove.

	]]
	QueueName: string?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetMatchmakingTicketResult = {
	--[[
		The server date and time at which ticket was created.

	]]
	Created: string,
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Creator: EntityKey,
	--[[
		Change number used for differentiating older matchmaking status updates from
		newer ones.

	]]
	ChangeNumber: number?,
	--[[
		The Id of a match queue.

	]]
	QueueName: string,
	--[[
		A list of Users that have joined this ticket.

	]]
	Members: { MatchmakingPlayer },
	--[[
		How long to attempt matching this ticket in seconds.

	]]
	GiveUpAfterSeconds: number,
	--[[
		The reason why the current ticket was canceled. This field is only set if the
		ticket is in canceled state. Please retry if CancellationReason is
		RetryRequired.

	]]
	CancellationReasonString: string?,
	--[[
		The current ticket status. Possible values are: WaitingForPlayers,
		WaitingForMatch, WaitingForServer, Canceled and Matched.

	]]
	Status: string,
	--[[
		The Id of a match.

	]]
	MatchId: string?,
	--[[
		A list of PlayFab Ids of Users to match with.

	]]
	MembersToMatchWith: { EntityKey }?,
}

export type ExternalFriendSources = 
	| "None"
	| "Steam"
	| "Facebook"
	| "Xbox"
	| "Psn"
	| "All"

--[[
	Preview: Request to update the serverData and serverEntity in case of
	migration. Only a game_server entity can update this information and this is
	restricted to client owned lobbies which are using connections.

]]
export type UpdateLobbyAsServerRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	ServerEntity: EntityKey?,
	--[[
		The id of the lobby.

	]]
	LobbyId: string,
	--[[
		The private key-value pairs which are visible to all entities in the lobby and
		modifiable by the joined server. Optional. Sets or updates key-value pairs on
		the lobby. Only the current lobby lobby server can set serverData. Keys may be
		an arbitrary string of at most 30 characters. The total size of all serverData
		values may not exceed 4096 bytes. Values are not individually limited. There
		can be up to 30 key-value pairs stored here. Keys are case sensitive.

	]]
	ServerData: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The keys to delete from the lobby serverData. Optional. Optional. Deletes
		key-value pairs on the lobby. Only the current joined lobby server can delete
		serverData. All the specified keys will be removed from the serverData. Keys
		that do not exist in the lobby are a no-op. If the key to delete exists in the
		serverData (same request) it will result in a bad request.

	]]
	ServerDataToDelete: { string }?,
}

export type VmStartupScriptPortRequest = {
	--[[
		The name for the port.

	]]
	Name: string,
	Protocol: ProtocolType,
}

export type GetBuildResponse = {
	CustomGameContainerImage: ContainerImageReference?,
	OsPlatform: OsPlatform?,
	VmStartupScriptConfiguration: VmStartupScriptConfiguration?,
	ContainerFlavor: ContainerFlavor?,
	--[[
		The region configuration for the build.

	]]
	RegionConfigurations: { BuildRegion }?,
	--[[
		When true, assets will not be copied for each server inside the VM. All
		serverswill run from the same set of assets, or will have the same assets
		mounted in the container.

	]]
	AreAssetsReadonly: boolean?,
	--[[
		The game certificates for the build.

	]]
	GameCertificateReferences: { GameCertificateReference }?,
	--[[
		The time the build was created in UTC.

	]]
	CreationTime: string?,
	--[[
		The command to run when the multiplayer server has been allocated, including
		any arguments. This only applies to managed builds. If the build is a custom
		build, this field will be null.

	]]
	StartMultiplayerServerCommand: string?,
	ServerResourceConstraints: ServerResourceConstraintParams?,
	--[[
		The container command to run when the multiplayer server has been allocated,
		including any arguments. This only applies to custom builds. If the build is a
		managed build, this field will be null.

	]]
	ContainerRunCommand: string?,
	--[[
		The ports the build is mapped on.

	]]
	Ports: { Port }?,
	--[[
		The guid string build ID of the build.

	]]
	BuildId: string?,
	--[[
		The build name.

	]]
	BuildName: string?,
	--[[
		Metadata of the build. The keys are case insensitive. The build metadata is
		made available to the server through Game Server SDK (GSDK).

	]]
	Metadata: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The current build status. Valid values are - Deploying, Deployed,
		DeletingRegion, Unhealthy.

	]]
	BuildStatus: string?,
	--[[
		The game assets for the build.

	]]
	GameAssetReferences: { AssetReference }?,
	--[[
		The number of multiplayer servers to hosted on a single VM of the build.

	]]
	MultiplayerServerCountPerVm: number,
	ServerType: ServerType?,
	InstrumentationConfiguration: InstrumentationConfiguration?,
	VmSize: AzureVmSize?,
}

--[[
	Returns a list of quality of service servers for a title.

]]
export type ListQosServersForTitleRequest = {
	--[[
		Indicates that the response should contain Qos servers for all regions,
		including those where there are no builds deployed for the title.

	]]
	IncludeAllRegions: boolean?,
	RoutingPreference: RoutingType?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type InstrumentationConfiguration = {
	--[[
		Designates whether windows instrumentation configuration will be enabled for
		this Build

	]]
	IsEnabled: boolean?,
	--[[
		This property is deprecated, use IsEnabled. The list of processes to be
		monitored on a VM for this build. Providing processes will turn on performance
		metrics collection for this build. Process names should not include
		extensions. If the game server process is: GameServer.exe; then,
		ProcessesToMonitor = [ GameServer ]

	]]
	ProcessesToMonitor: { string }?,
}

export type DifferenceRule = {
	LinearExpansion: LinearDifferenceRuleExpansion?,
	--[[
		The default value assigned to tickets that are missing the attribute specified
		by AttributePath (assuming that AttributeNotSpecifiedBehavior is false).
		Optional.

	]]
	DefaultAttributeValue: number?,
	--[[
		How many seconds before this rule is no longer enforced (but tickets that
		comply with this rule will still be prioritized over those that don't). Leave
		blank if this rule is always enforced.

	]]
	SecondsUntilOptional: number?,
	CustomExpansion: CustomDifferenceRuleExpansion?,
	MergeFunction: AttributeMergeFunction,
	--[[
		Friendly name chosen by developer.

	]]
	Name: string,
	--[[
		The allowed difference between any two tickets at the start of matchmaking.

	]]
	Difference: number,
	AttributeNotSpecifiedBehavior: AttributeNotSpecifiedBehavior,
	Attribute: QueueRuleAttribute,
	--[[
		The relative weight of this rule compared to others.

	]]
	Weight: number,
}

export type LinuxInstrumentationConfiguration = {
	--[[
		Designates whether Linux instrumentation configuration will be enabled for
		this Build

	]]
	IsEnabled: boolean,
}

--[[
	Enables the multiplayer server feature for a title and returns the enabled
	status. The enabled status can be Initializing, Enabled, and Disabled. It
	can up to 20 minutes or more for the title to be enabled for the feature. On
	average, it can take up to 20 minutes for the title to be enabled for the
	feature.

]]
export type EnableMultiplayerServersForTitleRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type StringEqualityRuleExpansion = {
	--[[
		List of bools specifying whether the rule is applied during this expansion.

	]]
	EnabledOverrides: { boolean },
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

export type ListMultiplayerServersResponse = {
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
	--[[
		The list of multiplayer server summary details.

	]]
	MultiplayerServerSummaries: { MultiplayerServerSummary }?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
}

export type LinearRegionSelectionRuleExpansion = {
	--[[
		Once the max Latency reaches this value, expansion stops.

	]]
	Limit: number,
	--[[
		This value gets added to MaxLatency at every expansion interval.

	]]
	Delta: number,
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

export type AzureVmSize = 
	| "Standard_A1"
	| "Standard_A2"
	| "Standard_A3"
	| "Standard_A4"
	| "Standard_A1_v2"
	| "Standard_A2_v2"
	| "Standard_A4_v2"
	| "Standard_A8_v2"
	| "Standard_D1_v2"
	| "Standard_D2_v2"
	| "Standard_D3_v2"
	| "Standard_D4_v2"
	| "Standard_D5_v2"
	| "Standard_D2_v3"
	| "Standard_D4_v3"
	| "Standard_D8_v3"
	| "Standard_D16_v3"
	| "Standard_F1"
	| "Standard_F2"
	| "Standard_F4"
	| "Standard_F8"
	| "Standard_F16"
	| "Standard_F2s_v2"
	| "Standard_F4s_v2"
	| "Standard_F8s_v2"
	| "Standard_F16s_v2"
	| "Standard_D2as_v4"
	| "Standard_D4as_v4"
	| "Standard_D8as_v4"
	| "Standard_D16as_v4"
	| "Standard_D2a_v4"
	| "Standard_D4a_v4"
	| "Standard_D8a_v4"
	| "Standard_D16a_v4"
	| "Standard_D2ads_v5"
	| "Standard_D4ads_v5"
	| "Standard_D8ads_v5"
	| "Standard_D16ads_v5"
	| "Standard_D2ads_v6"
	| "Standard_D4ads_v6"
	| "Standard_D8ads_v6"
	| "Standard_D16ads_v6"
	| "Standard_E2a_v4"
	| "Standard_E4a_v4"
	| "Standard_E8a_v4"
	| "Standard_E16a_v4"
	| "Standard_E2as_v4"
	| "Standard_E4as_v4"
	| "Standard_E8as_v4"
	| "Standard_E16as_v4"
	| "Standard_D2s_v3"
	| "Standard_D4s_v3"
	| "Standard_D8s_v3"
	| "Standard_D16s_v3"
	| "Standard_DS1_v2"
	| "Standard_DS2_v2"
	| "Standard_DS3_v2"
	| "Standard_DS4_v2"
	| "Standard_DS5_v2"
	| "Standard_NC4as_T4_v3"
	| "Standard_D2d_v4"
	| "Standard_D4d_v4"
	| "Standard_D8d_v4"
	| "Standard_D16d_v4"
	| "Standard_D2ds_v4"
	| "Standard_D4ds_v4"
	| "Standard_D8ds_v4"
	| "Standard_D16ds_v4"
	| "Standard_HB120_16rs_v3"
	| "Standard_HB120_32rs_v3"
	| "Standard_HB120_64rs_v3"
	| "Standard_HB120_96rs_v3"
	| "Standard_HB120rs_v3"
	| "Standard_D2d_v5"
	| "Standard_D4d_v5"
	| "Standard_D8d_v5"
	| "Standard_D16d_v5"
	| "Standard_D32d_v5"
	| "Standard_D2ds_v5"
	| "Standard_D4ds_v5"
	| "Standard_D8ds_v5"
	| "Standard_D16ds_v5"
	| "Standard_D32ds_v5"

export type LinearTeamSizeBalanceRuleExpansion = {
	--[[
		Once the total difference reaches this value, expansion stops. Optional.

	]]
	Limit: number?,
	--[[
		This value gets added to Difference at every expansion interval.

	]]
	Delta: number,
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

export type PaginationResponse = {
	--[[
		Continuation token returned by server call. Not returned for clients

	]]
	ContinuationToken: string?,
	--[[
		The number of lobbies that matched the search request.

	]]
	TotalMatchedLobbyCount: number?,
}

export type LinearTeamDifferenceRuleExpansion = {
	--[[
		Once the total difference reaches this value, expansion stops. Optional.

	]]
	Limit: number?,
	--[[
		This value gets added to Difference at every expansion interval.

	]]
	Delta: number,
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

--[[
	Gets multiplayer server logs for a specific server id in a region. The logs
	are available only after a server has terminated.

]]
export type GetMultiplayerSessionLogsBySessionIdRequest = {
	--[[
		The server ID of multiplayer server to get logs for.

	]]
	SessionId: string,
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

export type CustomSetIntersectionRuleExpansion = {
	--[[
		Manually specify the values to use for each expansion interval.

	]]
	MinIntersectionSizeOverrides: { OverrideUnsignedInt },
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

export type AttributeNotSpecifiedBehavior = 
	| "UseDefault"
	| "MatchAny"

export type QosServer = {
	Region: AzureRegion?,
	--[[
		The QoS server URL.

	]]
	ServerUrl: string?,
}

export type LinearSetIntersectionRuleExpansion = {
	--[[
		This value gets added to MinIntersectionSize at every expansion interval.

	]]
	Delta: number,
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

export type ListVirtualMachineSummariesResponse = {
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The list of virtual machine summaries.

	]]
	VirtualMachines: { VirtualMachineSummary }?,
}

export type GameSecretReferenceParams = {
	--[[
		The name of the game secret. This name should match the name of a secret that
		was previously added to this title.

	]]
	Name: string,
}

--[[
	Request to subscribe to lobby resource notifications.

]]
export type SubscribeToLobbyResourceRequest = {
	--[[
		Opaque string, given to a client upon creating a connection with PubSub.

	]]
	PubSubConnectionHandle: string,
	Type: SubscriptionType,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		Version number for the subscription of this resource.

	]]
	SubscriptionVersion: number,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	EntityKey: EntityKey,
	--[[
		The name of the resource to subscribe to. For LobbyChange subscriptions this
		is the lobbyId. For LobbyInvite subscriptions this should always be "@me".

	]]
	ResourceId: string,
}

export type VmStartupScriptParams = {
	VmStartupScriptAssetReference: AssetReferenceParams,
	--[[
		Optional port requests (name/protocol) that will be used by the
		VmStartupScript. Max of 5 requests.

	]]
	PortRequests: { VmStartupScriptPortRequestParams }?,
}

--[[
	Updates a multiplayer server build's name.

]]
export type UpdateBuildNameRequest = {
	--[[
		The guid string ID of the build we want to update the name of.

	]]
	BuildId: string,
	--[[
		The build name.

	]]
	BuildName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetServerBackfillTicketResult = {
	--[[
		The server date and time at which ticket was created.

	]]
	Created: string,
	--[[
		The Id of the ticket to find a match for.

	]]
	TicketId: string,
	--[[
		The Id of a match queue.

	]]
	QueueName: string,
	--[[
		A list of Users that are part of this ticket, along with their team
		assignments.

	]]
	Members: { MatchmakingPlayerWithTeamAssignment },
	--[[
		How long to attempt matching this ticket in seconds.

	]]
	GiveUpAfterSeconds: number,
	--[[
		The reason why the current ticket was canceled. This field is only set if the
		ticket is in canceled state.

	]]
	CancellationReasonString: string?,
	--[[
		The current ticket status. Possible values are: WaitingForMatch, Canceled and
		Matched.

	]]
	Status: string,
	--[[
		The Id of a match.

	]]
	MatchId: string?,
	ServerDetails: ServerDetails,
}

export type CoreCapacityChange = {
	Region: AzureRegion,
	--[[
		New quota core limit for the given vm family/region.

	]]
	NewCoreLimit: number,
	VmFamily: AzureVmFamily,
}

export type ListServerBackfillTicketsForPlayerResult = {
	--[[
		The list of backfill ticket Ids the user is a member of.

	]]
	TicketIds: { string },
}

--[[
	A user in a matchmaking ticket.

]]
export type MatchmakingPlayer = {
	--[[
		The matchmaking attributes for a user.

	]]
	Attributes: MatchmakingPlayerAttributes?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey,
}

export type BuildSelectionCriterion = {
	--[[
		Dictionary of build ids and their respective weights for distribution of
		allocation requests.

	]]
	BuildWeightDistribution: {
		-- No properties defined in spec
		[string]: any
	}?,
}

--[[
	Updates a multiplayer server build's region.

]]
export type UpdateBuildRegionRequest = {
	--[[
		The guid string ID of the build we want to update regions for.

	]]
	BuildId: string,
	BuildRegion: BuildRegionParams,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type MonitoringApplicationConfigurationParams = {
	AssetReference: AssetReferenceParams,
	--[[
		Execution script name, this will be the main executable for the monitoring
		application.

	]]
	ExecutionScriptName: string,
	--[[
		Installation script name, this will be run before the ExecutionScript.

	]]
	InstallationScriptName: string?,
	--[[
		Timespan the monitoring application will be kept alive when running from the
		start of the VM

	]]
	OnStartRuntimeInMinutes: number?,
}

export type BuildRegionParams = {
	VmSize: AzureVmSize?,
	--[[
		The number of standby multiplayer servers for the region.

	]]
	StandbyServers: number,
	Region: AzureRegion,
	--[[
		The maximum number of multiplayer servers for the region.

	]]
	MaxServers: number,
	ScheduledStandbySettings: ScheduledStandbySettings?,
	--[[
		Regional override for the number of multiplayer servers to host on a single VM
		of the build.

	]]
	MultiplayerServerCountPerVm: number?,
	DynamicStandbySettings: DynamicStandbySettings?,
}

export type CustomTeamDifferenceRuleExpansion = {
	--[[
		Manually specify the team difference value to use for each expansion interval.

	]]
	DifferenceOverrides: { OverrideDouble },
	--[[
		How many seconds before this rule is expanded.

	]]
	SecondsBetweenExpansions: number,
}

export type CurrentServerStats = {
	--[[
		The number of active multiplayer servers.

	]]
	Active: number,
	--[[
		The total number of multiplayer servers.

	]]
	Total: number,
	--[[
		The number of multiplayer servers still downloading game resources (such as
		assets).

	]]
	Propping: number,
	--[[
		The number of standingby multiplayer servers.

	]]
	StandingBy: number,
}

export type ListQosServersForTitleResponse = {
	--[[
		The list of QoS servers.

	]]
	QosServers: { QosServer }?,
	--[[
		The page size on the response.

	]]
	PageSize: number,
	--[[
		The skip token for the paged response.

	]]
	SkipToken: string?,
}

export type SecretSummary = {
	--[[
		Optional secret expiration date.

	]]
	ExpirationDate: string?,
	--[[
		The name of the secret.

	]]
	Name: string?,
	--[[
		The secret version auto-generated after upload.

	]]
	Version: string?,
}



return nil
