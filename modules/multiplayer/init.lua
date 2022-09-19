--!strict
--[=[
	# MultiplayerApi

	API methods for managing multiplayer servers. API methods for managing parties. 
	The lobby service helps players group together to play multiplayer games. It 
	is often used as a rendezvous point for players to share connection information. 
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local MultiplayerApi = {}

export type AccessPolicy = 
	"Public"
	| "Friends"
	| "Private"

--- The basic wrapper around every failed API response 
export type ApiErrorWrapper = {
	code: number, --- Numerical HTTP code
	error: string?, --- Playfab error code
	errorCode: number, --- Numerical PlayFab error code
	errorDetails: {[any]: any}?, --- Detailed description of individual issues with the request object
	errorMessage: string?, --- Description for the PlayFab errorCode
	status: string?, --- String HTTP code
}

export type AssetReference = {
	FileName: string?, --- The asset's file name. This is a filename with the .zip, .tar, or .tar.gz extension.
	MountPath: string?, --- The asset's mount path.
}

export type AssetReferenceParams = {
	FileName: string, --- The asset's file name.
	MountPath: string?, --- The asset's mount path.
}

export type AssetSummary = {
	FileName: string?, --- The asset's file name. This is a filename with the .zip, .tar, or .tar.gz extension.
	Metadata: {[any]: any}?, --- The metadata associated with the asset.
}

export type AttributeMergeFunction = 
	"Min"
	| "Max"
	| "Average"

export type AttributeNotSpecifiedBehavior = 
	"UseDefault"
	| "MatchAny"

export type AttributeSource = 
	"User"
	| "PlayerEntity"

export type AzureRegion = 
	"AustraliaEast"
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

export type AzureVmFamily = 
	"A"
	| "Av2"
	| "Dv2"
	| "Dv3"
	| "F"
	| "Fsv2"
	| "Dasv4"
	| "Dav4"
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

export type AzureVmSize = 
	"Standard_A1"
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

export type BuildAliasDetailsResponse = {
	AliasId: string?, --- The guid string alias Id of the alias to be created or updated.
	AliasName: string?, --- The alias name.
	BuildSelectionCriteria: {BuildSelectionCriterion}?, --- Array of build selection criteria.
}

export type BuildAliasParams = {
	AliasId: string, --- The guid string alias ID to use for the request.
}

export type BuildRegion = {
	CurrentServerStats: CurrentServerStats?, --- The current multiplayer server stats for the region.
	DynamicStandbySettings: DynamicStandbySettings?, --- Optional settings to control dynamic adjustment of standby target
	IsAssetReplicationComplete: boolean, --- Whether the game assets provided for the build have been replicated to this region.
	MaxServers: number, --- The maximum number of multiplayer servers for the region.
	MultiplayerServerCountPerVm: number?, --- Regional override for the number of multiplayer servers to host on a single VM of the build.
	Region: string?, --- The build region.
	ScheduledStandbySettings: ScheduledStandbySettings?, --- Optional settings to set the standby target to specified values during the supplied schedules
	StandbyServers: number, --- The target number of standby multiplayer servers for the region.
	Status: string?, --- The status of multiplayer servers in the build region. Valid values are - Unknown, Initialized, Deploying, Deployed, Unhealthy, Deleting, Deleted.
	VmSize: string?, --- Regional override for the VM size the build was created on.
}

export type BuildRegionParams = {
	DynamicStandbySettings: DynamicStandbySettings?, --- Optional settings to control dynamic adjustment of standby target. If not specified, dynamic standby is disabled
	MaxServers: number, --- The maximum number of multiplayer servers for the region.
	MultiplayerServerCountPerVm: number?, --- Regional override for the number of multiplayer servers to host on a single VM of the build.
	Region: string, --- The build region.
	ScheduledStandbySettings: ScheduledStandbySettings?, --- Optional settings to set the standby target to specified values during the supplied schedules
	StandbyServers: number, --- The number of standby multiplayer servers for the region.
	VmSize: string?, --- Regional override for the VM size the build was created on.
}

export type BuildSelectionCriterion = {
	BuildWeightDistribution: {[any]: any}?, --- Dictionary of build ids and their respective weights for distribution of allocation requests.
}

export type BuildSummary = {
	BuildId: string?, --- The guid string build ID of the build.
	BuildName: string?, --- The build name.
	CreationTime: string?, --- The time the build was created in UTC.
	Metadata: {[any]: any}?, --- The metadata of the build.
	RegionConfigurations: {BuildRegion}?, --- The configuration and status for each region in the build.
}

--- Cancels all tickets of which the player is a member in a given queue that are 
--- not cancelled or matched. This API is useful if you lose track of what tickets 
--- the player is a member of (if the title crashes for instance) and want to "reset". 
--- The Entity field is optional if the caller is a player and defaults to that 
--- player. Players may not cancel tickets for other people. The Entity field is 
--- required if the caller is a server (authenticated as the title). 
export type CancelAllMatchmakingTicketsForPlayerRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity key of the player whose tickets should be canceled.
	QueueName: string, --- The name of the queue from which a player's tickets should be canceled.
}

export type CancelAllMatchmakingTicketsForPlayerResult = {
}

--- Cancels all backfill tickets of which the player is a member in a given queue 
--- that are not cancelled or matched. This API is useful if you lose track of what 
--- tickets the player is a member of (if the server crashes for instance) and want 
--- to "reset". 
export type CancelAllServerBackfillTicketsForPlayerRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity key of the player whose backfill tickets should be canceled.
	QueueName: string, --- The name of the queue from which a player's backfill tickets should be canceled.
}

export type CancelAllServerBackfillTicketsForPlayerResult = {
}

--- Only servers and ticket members can cancel a ticket. The ticket can be in five 
--- different states when it is cancelled. 1: the ticket is waiting for members 
--- to join it, and it has not started matching. If the ticket is cancelled at this 
--- stage, it will never match. 2: the ticket is matching. If the ticket is cancelled, 
--- it will stop matching. 3: the ticket is matched. A matched ticket cannot be 
--- cancelled. 4: the ticket is already cancelled and nothing happens. 5: the ticket 
--- is waiting for a server. If the ticket is cancelled, server allocation will 
--- be stopped. A server may still be allocated due to a race condition, but that 
--- will not be reflected in the ticket. There may be race conditions between the 
--- ticket getting matched and the client making a cancellation request. The client 
--- must handle the possibility that the cancel request fails if a match is found 
--- before the cancellation request is processed. We do not allow resubmitting a 
--- cancelled ticket because players must consent to enter matchmaking again. Create 
--- a new ticket instead. 
export type CancelMatchmakingTicketRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	QueueName: string, --- The name of the queue the ticket is in.
	TicketId: string, --- The Id of the ticket to find a match for.
}

export type CancelMatchmakingTicketResult = {
}

--- Only servers can cancel a backfill ticket. The ticket can be in three different 
--- states when it is cancelled. 1: the ticket is matching. If the ticket is cancelled, 
--- it will stop matching. 2: the ticket is matched. A matched ticket cannot be 
--- cancelled. 3: the ticket is already cancelled and nothing happens. There may 
--- be race conditions between the ticket getting matched and the server making 
--- a cancellation request. The server must handle the possibility that the cancel 
--- request fails if a match is found before the cancellation request is processed. 
--- We do not allow resubmitting a cancelled ticket. Create a new ticket instead. 
export type CancelServerBackfillTicketRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	QueueName: string, --- The name of the queue the ticket is in.
	TicketId: string, --- The Id of the ticket to find a match for.
}

export type CancelServerBackfillTicketResult = {
}

export type CancellationReason = 
	"Requested"
	| "Internal"
	| "Timeout"

export type Certificate = {
	Base64EncodedValue: string, --- Base64 encoded string contents of the certificate.
	Name: string, --- A name for the certificate. This is used to reference certificates in build configurations.
	Password: string?, --- If required for your PFX certificate, use this field to provide a password that will be used to install the certificate on the container.
}

export type CertificateSummary = {
	Name: string?, --- The name of the certificate.
	Thumbprint: string?, --- The thumbprint for the certificate.
}

export type ConnectedPlayer = {
	PlayerId: string?, --- The player ID of the player connected to the multiplayer server.
}

export type ContainerFlavor = 
	"ManagedWindowsServerCore"
	| "CustomLinux"
	| "ManagedWindowsServerCorePreview"
	| "Invalid"

export type ContainerImageReference = {
	ImageName: string, --- The container image name.
	Tag: string?, --- The container tag.
}

export type CoreCapacity = {
	Available: number, --- The available core capacity for the (Region, VmFamily)
	Region: string?, --- The AzureRegion
	Total: number, --- The total core capacity for the (Region, VmFamily)
	VmFamily: string?, --- The AzureVmFamily
}

export type CoreCapacityChange = {
	NewCoreLimit: number, --- New quota core limit for the given vm family/region.
	Region: string, --- Region to change.
	VmFamily: string, --- Virtual machine family to change.
}

--- Creates a multiplayer server build alias and returns the created alias. 
export type CreateBuildAliasRequest = {
	AliasName: string, --- The alias name.
	BuildSelectionCriteria: {BuildSelectionCriterion}?, --- Array of build selection criteria.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- Creates a multiplayer server build with a custom container and returns information 
--- about the build creation request. 
export type CreateBuildWithCustomContainerRequest = {
	AreAssetsReadonly: boolean?, --- When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or will have the same assets mounted in the container.
	BuildName: string, --- The build name.
	ContainerFlavor: string?, --- The flavor of container to create a build from.
	ContainerImageReference: ContainerImageReference?, --- The container reference, consisting of the image name and tag.
	ContainerRunCommand: string?, --- The container command to run when the multiplayer server has been allocated, including any arguments.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	GameAssetReferences: {AssetReferenceParams}?, --- The list of game assets related to the build.
	GameCertificateReferences: {GameCertificateReferenceParams}?, --- The game certificates for the build.
	LinuxInstrumentationConfiguration: LinuxInstrumentationConfiguration?, --- The Linux instrumentation configuration for the build.
	Metadata: {[any]: any}?, --- Metadata to tag the build. The keys are case insensitive. The build metadata is made available to the server through Game Server SDK (GSDK).Constraints: Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?, --- The configuration for the monitoring application on the build
	MultiplayerServerCountPerVm: number, --- The number of multiplayer servers to host on a single VM.
	Ports: {Port}, --- The ports to map the build on.
	RegionConfigurations: {BuildRegionParams}, --- The region configurations for the build.
	ServerResourceConstraints: ServerResourceConstraintParams?, --- The resource constraints to apply to each server on the VM (EXPERIMENTAL API)
	UseStreamingForAssetDownloads: boolean?, --- When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to disc.
	VmSize: string?, --- The VM size to create the build on.
}

export type CreateBuildWithCustomContainerResponse = {
	AreAssetsReadonly: boolean?, --- When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or will have the same assets mounted in the container.
	BuildId: string?, --- The guid string build ID. Must be unique for every build.
	BuildName: string?, --- The build name.
	ContainerFlavor: string?, --- The flavor of container of the build.
	ContainerRunCommand: string?, --- The container command to run when the multiplayer server has been allocated, including any arguments.
	CreationTime: string?, --- The time the build was created in UTC.
	CustomGameContainerImage: ContainerImageReference?, --- The custom game container image reference information.
	GameAssetReferences: {AssetReference}?, --- The game assets for the build.
	GameCertificateReferences: {GameCertificateReference}?, --- The game certificates for the build.
	LinuxInstrumentationConfiguration: LinuxInstrumentationConfiguration?, --- The Linux instrumentation configuration for this build.
	Metadata: {[any]: any}?, --- The metadata of the build.
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?, --- The configuration for the monitoring application for the build
	MultiplayerServerCountPerVm: number, --- The number of multiplayer servers to host on a single VM of the build.
	OsPlatform: string?, --- The OS platform used for running the game process.
	Ports: {Port}?, --- The ports the build is mapped on.
	RegionConfigurations: {BuildRegion}?, --- The region configuration for the build.
	ServerResourceConstraints: ServerResourceConstraintParams?, --- The resource constraints to apply to each server on the VM (EXPERIMENTAL API)
	ServerType: string?, --- The type of game server being hosted.
	UseStreamingForAssetDownloads: boolean?, --- When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to disc.
	VmSize: string?, --- The VM size the build was created on.
}

--- Creates a multiplayer server build with a managed container and returns information 
--- about the build creation request. 
export type CreateBuildWithManagedContainerRequest = {
	AreAssetsReadonly: boolean?, --- When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or will have the same assets mounted in the container.
	BuildName: string, --- The build name.
	ContainerFlavor: string?, --- The flavor of container to create a build from.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	GameAssetReferences: {AssetReferenceParams}, --- The list of game assets related to the build.
	GameCertificateReferences: {GameCertificateReferenceParams}?, --- The game certificates for the build.
	GameWorkingDirectory: string?, --- The directory containing the game executable. This would be the start path of the game assets that contain the main game server executable. If not provided, a best effort will be made to extract it from the start game command.
	InstrumentationConfiguration: InstrumentationConfiguration?, --- The instrumentation configuration for the build.
	Metadata: {[any]: any}?, --- Metadata to tag the build. The keys are case insensitive. The build metadata is made available to the server through Game Server SDK (GSDK).Constraints: Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?, --- The configuration for the monitoring application on the build
	MultiplayerServerCountPerVm: number, --- The number of multiplayer servers to host on a single VM.
	Ports: {Port}, --- The ports to map the build on.
	RegionConfigurations: {BuildRegionParams}, --- The region configurations for the build.
	ServerResourceConstraints: ServerResourceConstraintParams?, --- The resource constraints to apply to each server on the VM (EXPERIMENTAL API)
	StartMultiplayerServerCommand: string, --- The command to run when the multiplayer server is started, including any arguments.
	UseStreamingForAssetDownloads: boolean?, --- When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to disc.
	VmSize: string?, --- The VM size to create the build on.
	WindowsCrashDumpConfiguration: WindowsCrashDumpConfiguration?, --- The crash dump configuration for the build.
}

export type CreateBuildWithManagedContainerResponse = {
	AreAssetsReadonly: boolean?, --- When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or will have the same assets mounted in the container.
	BuildId: string?, --- The guid string build ID. Must be unique for every build.
	BuildName: string?, --- The build name.
	ContainerFlavor: string?, --- The flavor of container of the build.
	CreationTime: string?, --- The time the build was created in UTC.
	GameAssetReferences: {AssetReference}?, --- The game assets for the build.
	GameCertificateReferences: {GameCertificateReference}?, --- The game certificates for the build.
	GameWorkingDirectory: string?, --- The directory containing the game executable. This would be the start path of the game assets that contain the main game server executable. If not provided, a best effort will be made to extract it from the start game command.
	InstrumentationConfiguration: InstrumentationConfiguration?, --- The instrumentation configuration for this build.
	Metadata: {[any]: any}?, --- The metadata of the build.
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?, --- The configuration for the monitoring application for the build
	MultiplayerServerCountPerVm: number, --- The number of multiplayer servers to host on a single VM of the build.
	OsPlatform: string?, --- The OS platform used for running the game process.
	Ports: {Port}?, --- The ports the build is mapped on.
	RegionConfigurations: {BuildRegion}?, --- The region configuration for the build.
	ServerResourceConstraints: ServerResourceConstraintParams?, --- The resource constraints to apply to each server on the VM (EXPERIMENTAL API)
	ServerType: string?, --- The type of game server being hosted.
	StartMultiplayerServerCommand: string?, --- The command to run when the multiplayer server has been allocated, including any arguments.
	UseStreamingForAssetDownloads: boolean?, --- When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to disc.
	VmSize: string?, --- The VM size the build was created on.
}

--- Creates a multiplayer server build with the game server running as a process 
--- and returns information about the build creation request. 
export type CreateBuildWithProcessBasedServerRequest = {
	AreAssetsReadonly: boolean?, --- When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or will have the same assets mounted in the container.
	BuildName: string, --- The build name.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	GameAssetReferences: {AssetReferenceParams}, --- The list of game assets related to the build.
	GameCertificateReferences: {GameCertificateReferenceParams}?, --- The game certificates for the build.
	GameWorkingDirectory: string?, --- The working directory for the game process. If this is not provided, the working directory will be set based on the mount path of the game server executable.
	InstrumentationConfiguration: InstrumentationConfiguration?, --- The instrumentation configuration for the build.
	IsOSPreview: boolean?, --- Indicates whether this build will be created using the OS Preview versionPreview OS is recommended for dev builds to detect any breaking changes before they are released to retail. Retail builds should set this value to false.
	Metadata: {[any]: any}?, --- Metadata to tag the build. The keys are case insensitive. The build metadata is made available to the server through Game Server SDK (GSDK).Constraints: Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?, --- The configuration for the monitoring application on the build
	MultiplayerServerCountPerVm: number, --- The number of multiplayer servers to host on a single VM.
	OsPlatform: string?, --- The OS platform used for running the game process.
	Ports: {Port}, --- The ports to map the build on.
	RegionConfigurations: {BuildRegionParams}, --- The region configurations for the build.
	StartMultiplayerServerCommand: string, --- The command to run when the multiplayer server is started, including any arguments. The path to any executable should be relative to the root asset folder when unzipped.
	UseStreamingForAssetDownloads: boolean?, --- When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to disc.
	VmSize: string?, --- The VM size to create the build on.
}

export type CreateBuildWithProcessBasedServerResponse = {
	AreAssetsReadonly: boolean?, --- When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or will have the same assets mounted in the container.
	BuildId: string?, --- The guid string build ID. Must be unique for every build.
	BuildName: string?, --- The build name.
	ContainerFlavor: string?, --- The flavor of container of the build.
	CreationTime: string?, --- The time the build was created in UTC.
	GameAssetReferences: {AssetReference}?, --- The game assets for the build.
	GameCertificateReferences: {GameCertificateReference}?, --- The game certificates for the build.
	GameWorkingDirectory: string?, --- The working directory for the game process. If this is not provided, the working directory will be set based on the mount path of the game server executable.
	InstrumentationConfiguration: InstrumentationConfiguration?, --- The instrumentation configuration for this build.
	IsOSPreview: boolean?, --- Indicates whether this build will be created using the OS Preview versionPreview OS is recommended for dev builds to detect any breaking changes before they are released to retail. Retail builds should set this value to false.
	Metadata: {[any]: any}?, --- The metadata of the build.
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?, --- The configuration for the monitoring application for the build
	MultiplayerServerCountPerVm: number, --- The number of multiplayer servers to host on a single VM of the build.
	OsPlatform: string?, --- The OS platform used for running the game process.
	Ports: {Port}?, --- The ports the build is mapped on.
	RegionConfigurations: {BuildRegion}?, --- The region configuration for the build.
	ServerType: string?, --- The type of game server being hosted.
	StartMultiplayerServerCommand: string?, --- The command to run when the multiplayer server is started, including any arguments. The path to any executable is relative to the root asset folder when unzipped.
	UseStreamingForAssetDownloads: boolean?, --- When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to disc.
	VmSize: string?, --- The VM size the build was created on.
}

--- Request to create a lobby. A Server or client can create a lobby. 
export type CreateLobbyRequest = {
	AccessPolicy: string?, --- The policy indicating who is allowed to join the lobby, and the visibility to queries. May be 'Public', 'Friends' or 'Private'. Public means the lobby is both visible in queries and any player may join, including invited players. Friends means that users who are bidirectional friends of members in the lobby may search to find friend lobbies, to retrieve its connection string. Private means the lobby is not visible in queries, and a player must receive an invitation to join. Defaults to 'Public' on creation. Can only be changed by the lobby owner.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	LobbyData: {[any]: any}?, --- The private key-value pairs which are only visible to members of the lobby. At most 30 key-value pairs may be stored here, keys are limited to 30 characters and values to 1000. The total size of all lobbyData values may not exceed 4096 bytes. Keys are case sensitive.
	MaxPlayers: number, --- The maximum number of players allowed in the lobby. The value must be between 2 and 128.
	Members: {Member}?, --- The member initially added to the lobby. Client must specify exactly one member, which is the creator's entity and member data. Member PubSubConnectionHandle must be null or empty. Game servers must not specify any members.
	Owner: EntityKey, --- The lobby owner. Must be the calling entity.
	OwnerMigrationPolicy: string?, --- The policy for how a new owner is chosen. May be 'Automatic', 'Manual' or 'None'. Can only be specified by clients. If client-owned and 'Automatic' - The Lobby service will automatically assign another connected owner when the current owner leaves or disconnects. The useConnections property must be true. If client - owned and 'Manual' - Ownership is protected as long as the current owner is connected. If the current owner leaves or disconnects any member may set themselves as the current owner. The useConnections property must be true. If client-owned and 'None' - Any member can set ownership. The useConnections property can be either true or false.
	SearchData: {[any]: any}?, --- The public key-value pairs which allow queries to differentiate between lobbies. Queries will refer to these key-value pairs in their filter and order by clauses to retrieve lobbies fitting the specified criteria. At most 30 key-value pairs may be stored here. Keys are of the format string_key1, string_key2 ... string_key30 for string values, or number_key1, number_key2, ... number_key30 for numeric values.Numeric values are floats. Values can be at most 256 characters long. The total size of all searchData values may not exceed 1024 bytes.
	UseConnections: boolean, --- A setting to control whether connections are used. Defaults to true. When true, notifications are sent to subscribed players, disconnect detection removes connectionHandles, only owner migration policies using connections are allowed, and lobbies must have at least one connected member to be searchable or be a server hosted lobby with a connected server. If false, then notifications are not sent, connections are not allowed, and lobbies do not need connections to be searchable.
}

export type CreateLobbyResult = {
	ConnectionString: string, --- A field which indicates which lobby the user will be joining.
	LobbyId: string, --- Id to uniquely identify a lobby.
}

--- The client specifies the creator's attributes and optionally a list of other 
--- users to match with. 
export type CreateMatchmakingTicketRequest = {
	Creator: MatchmakingPlayer, --- The User who created this ticket.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	GiveUpAfterSeconds: number, --- How long to attempt matching this ticket in seconds.
	MembersToMatchWith: {EntityKey}?, --- A list of Entity Keys of other users to match with.
	QueueName: string, --- The Id of a match queue.
}

export type CreateMatchmakingTicketResult = {
	TicketId: string, --- The Id of the ticket to find a match for.
}

--- Creates a remote user to log on to a VM for a multiplayer server build in a 
--- specific region. Returns user credential information necessary to log on. 
export type CreateRemoteUserRequest = {
	BuildId: string, --- The guid string build ID of to create the remote user for.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExpirationTime: string?, --- The expiration time for the remote user created. Defaults to expiring in one day if not specified.
	Region: string, --- The region of virtual machine to create the remote user for.
	Username: string, --- The username to create the remote user with.
	VmId: string, --- The virtual machine ID the multiplayer server is located on.
}

export type CreateRemoteUserResponse = {
	ExpirationTime: string?, --- The expiration time for the remote user created.
	Password: string?, --- The generated password for the remote user that was created.
	Username: string?, --- The username for the remote user that was created.
}

--- The server specifies all the members, their teams and their attributes, and 
--- the server details if applicable. 
export type CreateServerBackfillTicketRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	GiveUpAfterSeconds: number, --- How long to attempt matching this ticket in seconds.
	Members: {MatchmakingPlayerWithTeamAssignment}, --- The users who will be part of this ticket, along with their team assignments.
	QueueName: string, --- The Id of a match queue.
	ServerDetails: ServerDetails?, --- The details of the server the members are connected to.
}

export type CreateServerBackfillTicketResult = {
	TicketId: string, --- The Id of the ticket to find a match for.
}

--- The server specifies all the members and their attributes. 
export type CreateServerMatchmakingTicketRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	GiveUpAfterSeconds: number, --- How long to attempt matching this ticket in seconds.
	Members: {MatchmakingPlayer}, --- The users who will be part of this ticket.
	QueueName: string, --- The Id of a match queue.
}

--- Creates a request to change a title's multiplayer server quotas. 
export type CreateTitleMultiplayerServersQuotaChangeRequest = {
	ChangeDescription: string?, --- A brief description of the requested changes.
	Changes: {CoreCapacityChange}, --- Changes to make to the titles cores quota.
	ContactEmail: string?, --- Email to be contacted by our team about this request. Only required when a request is not approved.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Notes: string?, --- Additional information about this request that our team can use to better understand the requirements.
	StartDate: string?, --- When these changes would need to be in effect. Only required when a request is not approved.
}

export type CreateTitleMultiplayerServersQuotaChangeResponse = {
	RequestId: string?, --- Id of the change request that was created.
	WasApproved: boolean, --- Determines if the request was approved or not. When false, our team is reviewing and may respond within 2 business days.
}

export type CurrentServerStats = {
	Active: number, --- The number of active multiplayer servers.
	Propping: number, --- The number of multiplayer servers still downloading game resources (such as assets).
	StandingBy: number, --- The number of standingby multiplayer servers.
	Total: number, --- The total number of multiplayer servers.
}

export type CustomDifferenceRuleExpansion = {
	DifferenceOverrides: {OverrideDouble}, --- Manually specify the values to use for each expansion interval (this overrides Difference, Delta, and MaxDifference).
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type CustomRegionSelectionRuleExpansion = {
	MaxLatencyOverrides: {OverrideUnsignedInt}, --- Manually specify the maximum latency to use for each expansion interval.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type CustomSetIntersectionRuleExpansion = {
	MinIntersectionSizeOverrides: {OverrideUnsignedInt}, --- Manually specify the values to use for each expansion interval.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type CustomTeamDifferenceRuleExpansion = {
	DifferenceOverrides: {OverrideDouble}, --- Manually specify the team difference value to use for each expansion interval.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type CustomTeamSizeBalanceRuleExpansion = {
	DifferenceOverrides: {OverrideUnsignedInt}, --- Manually specify the team size difference to use for each expansion interval.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

--- Deletes a multiplayer server game asset for a title. 
export type DeleteAssetRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FileName: string, --- The filename of the asset to delete.
}

--- Deletes a multiplayer server build alias. 
export type DeleteBuildAliasRequest = {
	AliasId: string, --- The guid string alias ID of the alias to perform the action on.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- Removes a multiplayer server build's region. 
export type DeleteBuildRegionRequest = {
	BuildId: string, --- The guid string ID of the build we want to update regions for.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Region: string, --- The build region to delete.
}

--- Deletes a multiplayer server build. 
export type DeleteBuildRequest = {
	BuildId: string, --- The guid string build ID of the build to delete.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- Deletes a multiplayer server game certificate. 
export type DeleteCertificateRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Name: string, --- The name of the certificate.
}

--- Removes the specified container image repository. After this operation, a 'docker 
--- pull' will fail for all the tags of the specified image. Morever, ListContainerImages 
--- will not return the specified image. 
export type DeleteContainerImageRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ImageName: string?, --- The container image repository we want to delete.
}

--- Request to delete a lobby. Only servers can delete lobbies. 
export type DeleteLobbyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	LobbyId: string?, --- The id of the lobby.
}

--- Deletes a remote user to log on to a VM for a multiplayer server build in a 
--- specific region. Returns user credential information necessary to log on. 
export type DeleteRemoteUserRequest = {
	BuildId: string, --- The guid string build ID of the multiplayer server where the remote user is to delete.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Region: string, --- The region of the multiplayer server where the remote user is to delete.
	Username: string, --- The username of the remote user to delete.
	VmId: string, --- The virtual machine ID the multiplayer server is located on.
}

export type DifferenceRule = {
	Attribute: QueueRuleAttribute, --- Description of the attribute used by this rule to match tickets.
	AttributeNotSpecifiedBehavior: string, --- Describes the behavior when an attribute is not specified in the ticket creation request or in the user's entity profile.
	CustomExpansion: CustomDifferenceRuleExpansion?, --- Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule. When this is set, Difference is ignored.
	DefaultAttributeValue: number?, --- The default value assigned to tickets that are missing the attribute specified by AttributePath (assuming that AttributeNotSpecifiedBehavior is false). Optional.
	Difference: number, --- The allowed difference between any two tickets at the start of matchmaking.
	LinearExpansion: LinearDifferenceRuleExpansion?, --- Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule.
	MergeFunction: string, --- How values are treated when there are multiple players in a single ticket.
	Name: string, --- Friendly name chosen by developer.
	SecondsUntilOptional: number?, --- How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be prioritized over those that don't). Leave blank if this rule is always enforced.
	Weight: number, --- The relative weight of this rule compared to others.
}

export type DynamicStandbySettings = {
	DynamicFloorMultiplierThresholds: {DynamicStandbyThreshold}?, --- List of auto standing by trigger values and corresponding standing by multiplier. Defaults to 1.5X at 50%, 3X at 25%, and 4X at 5%
	IsEnabled: boolean, --- When true, dynamic standby will be enabled
	RampDownSeconds: number?, --- The time it takes to reduce target standing by to configured floor value after an increase. Defaults to 30 minutes
}

export type DynamicStandbyThreshold = {
	Multiplier: number, --- When the trigger threshold is reached, multiply by this value
	TriggerThresholdPercentage: number, --- The multiplier will be applied when the actual standby divided by target standby floor is less than this value
}

export type EmptyResponse = {
}

--- Enables the multiplayer server feature for a title and returns the enabled status. 
--- The enabled status can be Initializing, Enabled, and Disabled. It can up to 
--- 20 minutes or more for the title to be enabled for the feature. On average, 
--- it can take up to 20 minutes for the title to be enabled for the feature. 
export type EnableMultiplayerServersForTitleRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type EnableMultiplayerServersForTitleResponse = {
	Status: string?, --- The enabled status for the multiplayer server features for the title.
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	Id: string, --- Unique ID of the entity.
	Type: string?, --- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
}

--- Request to find friends lobbies. Only a client can find friend lobbies. 
export type FindFriendLobbiesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ExcludeFacebookFriends: boolean, --- Controls whether this query should link to friends made on the Facebook network. Defaults to false
	ExcludeSteamFriends: boolean, --- Controls whether this query should link to friends made on the Steam network. Defaults to false
	Filter: string?, --- OData style string that contains one or more filters. Only the following operators are supported: "and" (logical and), "eq" (equal), "ne" (not equals), "ge" (greater than or equal), "gt" (greater than), "le" (less than or equal), and "lt" (less than). The left-hand side of each OData logical expression should be either a search property key (e.g. string_key1, number_key3, etc) or one of the pre-defined search keys all of which must be prefixed by "lobby/": lobby/memberCount (number of players in a lobby), lobby/maxMemberCount (maximum number of players allowed in a lobby), lobby/membershipLock (must equal 'Unlocked' or 'Locked'), lobby/amOwner (required to equal "true"), lobby/amMember (required to equal "true").
	OrderBy: string?, --- OData style string that contains sorting for this query in either ascending ("asc") or descending ("desc") order. OrderBy clauses are of the form "number_key1 asc" or the pre-defined search key "lobby/memberCount asc" and "lobby/maxMemberCount desc". To sort by closest, a moniker `distance{number_key1 = 5}` can be used to sort by distance from the given number. This field only supports either one sort clause or one distance clause.
	Pagination: PaginationRequest?, --- Request pagination information.
	XboxToken: string?, --- Xbox token if Xbox friends should be included. Requires Xbox be configured on PlayFab.
}

export type FindFriendLobbiesResult = {
	Lobbies: {FriendLobbySummary}, --- Array of lobbies found that matched FindFriendLobbies request.
	Pagination: PaginationResponse, --- Pagination response for FindFriendLobbies request.
}

--- Request to find lobbies. 
export type FindLobbiesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Filter: string?, --- OData style string that contains one or more filters. Only the following operators are supported: "and" (logical and), "eq" (equal), "ne" (not equals), "ge" (greater than or equal), "gt" (greater than), "le" (less than or equal), and "lt" (less than). The left-hand side of each OData logical expression should be either a search property key (e.g. string_key1, number_key3, etc) or one of the pre-defined search keys all of which must be prefixed by "lobby/": lobby/memberCount (number of players in a lobby), lobby/maxMemberCount (maximum number of players allowed in a lobby), lobby/membershipLock (must equal 'Unlocked' or 'Locked'), lobby/amOwner (required to equal "true"), lobby/amMember (required to equal "true").
	OrderBy: string?, --- OData style string that contains sorting for this query in either ascending ("asc") or descending ("desc") order. OrderBy clauses are of the form "number_key1 asc" or the pre-defined search key "lobby/memberCount asc" and "lobby/maxMemberCount desc". To sort by closest, a moniker `distance{number_key1 = 5}` can be used to sort by distance from the given number. This field only supports either one sort clause or one distance clause.
	Pagination: PaginationRequest?, --- Request pagination information.
}

export type FindLobbiesResult = {
	Lobbies: {LobbySummary}, --- Array of lobbies found that matched FindLobbies request.
	Pagination: PaginationResponse, --- Pagination response for FindLobbies request.
}

export type FriendLobbySummary = {
	ConnectionString: string, --- A string used to join the lobby.This field is populated by the Lobby service.Invites are performed by communicating this connectionString to other players.
	CurrentPlayers: number, --- The current number of players in the lobby.
	Friends: {EntityKey}?, --- Friends in Lobby.
	LobbyId: string, --- Id to uniquely identify a lobby.
	MaxPlayers: number, --- The maximum number of players allowed in the lobby.
	MembershipLock: string?, --- A setting indicating whether members are allowed to join this lobby. When Locked new members are prevented from joining.
	Owner: EntityKey, --- The client or server entity which owns this lobby.
	SearchData: {[any]: any}?, --- Search data.
}

export type GameCertificateReference = {
	GsdkAlias: string?, --- An alias for the game certificate. The game server will reference this alias via GSDK config to retrieve the game certificate. This alias is used as an identifier in game server code to allow a new certificate with different Name field to be uploaded without the need to change any game server code to reference the new Name.
	Name: string?, --- The name of the game certificate. This name should match the name of a certificate that was previously uploaded to this title.
}

export type GameCertificateReferenceParams = {
	GsdkAlias: string, --- An alias for the game certificate. The game server will reference this alias via GSDK config to retrieve the game certificate. This alias is used as an identifier in game server code to allow a new certificate with different Name field to be uploaded without the need to change any game server code to reference the new Name.
	Name: string, --- The name of the game certificate. This name should match the name of a certificate that was previously uploaded to this title.
}

--- Gets a URL that can be used to download the specified asset. 
export type GetAssetDownloadUrlRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FileName: string, --- The asset's file name to get the download URL for.
}

export type GetAssetDownloadUrlResponse = {
	AssetDownloadUrl: string?, --- The asset's download URL.
	FileName: string?, --- The asset's file name to get the download URL for.
}

--- Gets the URL to upload assets to. 
export type GetAssetUploadUrlRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	FileName: string, --- The asset's file name to get the upload URL for.
}

export type GetAssetUploadUrlResponse = {
	AssetUploadUrl: string?, --- The asset's upload URL.
	FileName: string?, --- The asset's file name to get the upload URL for.
}

--- Returns the details about a multiplayer server build alias. 
export type GetBuildAliasRequest = {
	AliasId: string, --- The guid string alias ID of the alias to perform the action on.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- Returns the details about a multiplayer server build. 
export type GetBuildRequest = {
	BuildId: string, --- The guid string build ID of the build to get.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetBuildResponse = {
	AreAssetsReadonly: boolean?, --- When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or will have the same assets mounted in the container.
	BuildId: string?, --- The guid string build ID of the build.
	BuildName: string?, --- The build name.
	BuildStatus: string?, --- The current build status. Valid values are - Deploying, Deployed, DeletingRegion, Unhealthy.
	ContainerFlavor: string?, --- The flavor of container of he build.
	ContainerRunCommand: string?, --- The container command to run when the multiplayer server has been allocated, including any arguments. This only applies to custom builds. If the build is a managed build, this field will be null.
	CreationTime: string?, --- The time the build was created in UTC.
	CustomGameContainerImage: ContainerImageReference?, --- The custom game container image for a custom build.
	GameAssetReferences: {AssetReference}?, --- The game assets for the build.
	GameCertificateReferences: {GameCertificateReference}?, --- The game certificates for the build.
	InstrumentationConfiguration: InstrumentationConfiguration?, --- The instrumentation configuration of the build.
	Metadata: {[any]: any}?, --- Metadata of the build. The keys are case insensitive. The build metadata is made available to the server through Game Server SDK (GSDK).
	MultiplayerServerCountPerVm: number, --- The number of multiplayer servers to hosted on a single VM of the build.
	OsPlatform: string?, --- The OS platform used for running the game process.
	Ports: {Port}?, --- The ports the build is mapped on.
	RegionConfigurations: {BuildRegion}?, --- The region configuration for the build.
	ServerResourceConstraints: ServerResourceConstraintParams?, --- The resource constraints to apply to each server on the VM.
	ServerType: string?, --- The type of game server being hosted.
	StartMultiplayerServerCommand: string?, --- The command to run when the multiplayer server has been allocated, including any arguments. This only applies to managed builds. If the build is a custom build, this field will be null.
	VmSize: string?, --- The VM size the build was created on.
}

--- Gets credentials to the container registry where game developers can upload 
--- custom container images to before creating a new build. 
export type GetContainerRegistryCredentialsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetContainerRegistryCredentialsResponse = {
	DnsName: string?, --- The url of the container registry.
	Password: string?, --- The password for accessing the container registry.
	Username: string?, --- The username for accessing the container registry.
}

--- Request to get a lobby. 
export type GetLobbyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	LobbyId: string?, --- The id of the lobby.
}

export type GetLobbyResult = {
	Lobby: Lobby, --- The information pertaining to the requested lobby.
}

--- When matchmaking has successfully matched together a collection of tickets, 
--- it produces a 'match' with an Id. The match contains all of the players that 
--- were matched together, and their team assigments. Only servers and ticket members 
--- can get the match. 
export type GetMatchRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EscapeObject: boolean, --- Determines whether the matchmaking attributes will be returned as an escaped JSON string or as an un-escaped JSON object.
	MatchId: string, --- The Id of a match.
	QueueName: string, --- The name of the queue to join.
	ReturnMemberAttributes: boolean, --- Determines whether the matchmaking attributes for each user should be returned in the response for match request.
}

export type GetMatchResult = {
	ArrangementString: string?, --- A string that is used by players that are matched together to join an arranged lobby.
	MatchId: string, --- The Id of a match.
	Members: {MatchmakingPlayerWithTeamAssignment}, --- A list of Users that are matched together, along with their team assignments.
	RegionPreferences: {any}?, --- A list of regions that the match could be played in sorted by preference. This value is only set if the queue has a region selection rule.
	ServerDetails: ServerDetails?, --- The details of the server that the match has been allocated to.
}

--- Gets the current configuration for a queue. 
export type GetMatchmakingQueueRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	QueueName: string?, --- The Id of the matchmaking queue to retrieve.
}

export type GetMatchmakingQueueResult = {
	MatchmakingQueue: MatchmakingQueueConfig?, --- The matchmaking queue config.
}

--- The ticket includes the invited players, their attributes if they have joined, 
--- the ticket status, the match Id when applicable, etc. Only servers, the ticket 
--- creator and the invited players can get the ticket. 
export type GetMatchmakingTicketRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EscapeObject: boolean, --- Determines whether the matchmaking attributes will be returned as an escaped JSON string or as an un-escaped JSON object.
	QueueName: string, --- The name of the queue to find a match for.
	TicketId: string, --- The Id of the ticket to find a match for.
}

export type GetMatchmakingTicketResult = {
	CancellationReasonString: string?, --- The reason why the current ticket was canceled. This field is only set if the ticket is in canceled state.
	ChangeNumber: number?, --- Change number used for differentiating older matchmaking status updates from newer ones.
	Created: string, --- The server date and time at which ticket was created.
	Creator: EntityKey, --- The Creator's entity key.
	GiveUpAfterSeconds: number, --- How long to attempt matching this ticket in seconds.
	MatchId: string?, --- The Id of a match.
	Members: {MatchmakingPlayer}, --- A list of Users that have joined this ticket.
	MembersToMatchWith: {EntityKey}?, --- A list of PlayFab Ids of Users to match with.
	QueueName: string, --- The Id of a match queue.
	Status: string, --- The current ticket status. Possible values are: WaitingForPlayers, WaitingForMatch, WaitingForServer, Canceled and Matched.
	TicketId: string, --- The Id of the ticket to find a match for.
}

--- Gets multiplayer server session details for a build in a specific region. 
export type GetMultiplayerServerDetailsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	SessionId: string, --- The title generated guid string session ID of the multiplayer server to get details for. This is to keep track of multiplayer server sessions.
}

export type GetMultiplayerServerDetailsResponse = {
	BuildId: string?, --- The identity of the build in which the server was allocated.
	ConnectedPlayers: {ConnectedPlayer}?, --- The connected players in the multiplayer server.
	FQDN: string?, --- The fully qualified domain name of the virtual machine that is hosting this multiplayer server.
	IPV4Address: string?, --- The IPv4 address of the virtual machine that is hosting this multiplayer server.
	LastStateTransitionTime: string?, --- The time (UTC) at which a change in the multiplayer server state was observed.
	Ports: {Port}?, --- The ports the multiplayer server uses.
	Region: string?, --- The region the multiplayer server is located in.
	ServerId: string?, --- The string server ID of the multiplayer server generated by PlayFab.
	SessionId: string?, --- The guid string session ID of the multiplayer server.
	State: string?, --- The state of the multiplayer server.
	VmId: string?, --- The virtual machine ID that the multiplayer server is located on.
}

--- Gets multiplayer server logs for a specific server id in a region. The logs 
--- are available only after a server has terminated. 
export type GetMultiplayerServerLogsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ServerId: string, --- The server ID of multiplayer server to get logs for.
}

export type GetMultiplayerServerLogsResponse = {
	LogDownloadUrl: string?, --- URL for logs download.
}

--- Gets multiplayer server logs for a specific server id in a region. The logs 
--- are available only after a server has terminated. 
export type GetMultiplayerSessionLogsBySessionIdRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	SessionId: string, --- The server ID of multiplayer server to get logs for.
}

--- Returns the matchmaking statistics for a queue. These include the number of 
--- players matching and the statistics related to the time to match statistics 
--- in seconds (average and percentiles). Statistics are refreshed once every 5 
--- minutes. Servers can access all statistics no matter what the ClientStatisticsVisibility 
--- is configured to. Clients can access statistics according to the ClientStatisticsVisibility. 
--- Client requests are forbidden if all visibility fields are false. 
export type GetQueueStatisticsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	QueueName: string, --- The name of the queue.
}

export type GetQueueStatisticsResult = {
	NumberOfPlayersMatching: number?, --- The current number of players in the matchmaking queue, who are waiting to be matched.
	TimeToMatchStatisticsInSeconds: Statistics?, --- Statistics representing the time (in seconds) it takes for tickets to find a match.
}

--- Gets a remote login endpoint to a VM that is hosting a multiplayer server build 
--- in a specific region. 
export type GetRemoteLoginEndpointRequest = {
	BuildId: string, --- The guid string build ID of the multiplayer server to get remote login information for.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Region: string, --- The region of the multiplayer server to get remote login information for.
	VmId: string, --- The virtual machine ID the multiplayer server is located on.
}

export type GetRemoteLoginEndpointResponse = {
	IPV4Address: string?, --- The remote login IPV4 address of multiplayer server.
	Port: number, --- The remote login port of multiplayer server.
}

--- The ticket includes the players, their attributes, their teams, the ticket status, 
--- the match Id and the server details when applicable, etc. Only servers can get 
--- the ticket. 
export type GetServerBackfillTicketRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EscapeObject: boolean, --- Determines whether the matchmaking attributes will be returned as an escaped JSON string or as an un-escaped JSON object.
	QueueName: string, --- The name of the queue to find a match for.
	TicketId: string, --- The Id of the ticket to find a match for.
}

export type GetServerBackfillTicketResult = {
	CancellationReasonString: string?, --- The reason why the current ticket was canceled. This field is only set if the ticket is in canceled state.
	Created: string, --- The server date and time at which ticket was created.
	GiveUpAfterSeconds: number, --- How long to attempt matching this ticket in seconds.
	MatchId: string?, --- The Id of a match.
	Members: {MatchmakingPlayerWithTeamAssignment}, --- A list of Users that are part of this ticket, along with their team assignments.
	QueueName: string, --- The Id of a match queue.
	ServerDetails: ServerDetails, --- The details of the server the members are connected to.
	Status: string, --- The current ticket status. Possible values are: WaitingForMatch, Canceled and Matched.
	TicketId: string, --- The Id of the ticket to find a match for.
}

--- Gets the status of whether a title is enabled for the multiplayer server feature. 
--- The enabled status can be Initializing, Enabled, and Disabled. 
export type GetTitleEnabledForMultiplayerServersStatusRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetTitleEnabledForMultiplayerServersStatusResponse = {
	Status: string?, --- The enabled status for the multiplayer server features for the title.
}

--- Gets a title's server quota change request. 
export type GetTitleMultiplayerServersQuotaChangeRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	RequestId: string, --- Id of the change request to get.
}

export type GetTitleMultiplayerServersQuotaChangeResponse = {
	Change: QuotaChange?, --- The change request for this title.
}

--- Gets the quotas for a title in relation to multiplayer servers. 
export type GetTitleMultiplayerServersQuotasRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type GetTitleMultiplayerServersQuotasResponse = {
	Quotas: TitleMultiplayerServersQuotas?, --- The various quotas for multiplayer servers for the title.
}

export type InstrumentationConfiguration = {
	IsEnabled: boolean?, --- Designates whether windows instrumentation configuration will be enabled for this Build
	ProcessesToMonitor: {any}?, --- This property is deprecated, use IsEnabled. The list of processes to be monitored on a VM for this build. Providing processes will turn on performance metrics collection for this build. Process names should not include extensions. If the game server process is: GameServer.exe; then, ProcessesToMonitor = [ GameServer ] 
}

--- Request to invite a player to a lobby the caller is already a member of. Only 
--- a client can invite another player to a lobby. 
export type InviteToLobbyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	InviteeEntity: EntityKey?, --- The entity invited to the lobby.
	LobbyId: string?, --- The id of the lobby.
	MemberEntity: EntityKey?, --- The member entity sending the invite. Must be a member of the lobby.
}

--- Request to join an arranged lobby. Only a client can join an arranged lobby. 
export type JoinArrangedLobbyRequest = {
	AccessPolicy: string?, --- The policy indicating who is allowed to join the lobby, and the visibility to queries. May be 'Public', 'Friends' or 'Private'. Public means the lobby is both visible in queries and any player may join, including invited players. Friends means that users who are bidirectional friends of members in the lobby may search to find friend lobbies, to retrieve its connection string. Private means the lobby is not visible in queries, and a player must receive an invitation to join. Defaults to 'Public' on creation. Can only be changed by the lobby owner.
	ArrangementString: string, --- A field which indicates which lobby the user will be joining. This field is opaque to everyone except the Lobby service and the creator of the arrangementString (Matchmaking). This string defines a unique identifier for the arranged lobby as well as the title and member the string is valid for. Arrangement strings have an expiration.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MaxPlayers: number, --- The maximum number of players allowed in the lobby. The value must be between 2 and 128.
	MemberData: {[any]: any}?, --- The private key-value pairs used by the member to communicate information to other members and the owner. Visible to all members of the lobby. At most 30 key-value pairs may be stored here, keys are limited to 30 characters and values to 1000. The total size of all memberData values may not exceed 4096 bytes. Keys are case sensitive.
	MemberEntity: EntityKey, --- The member entity who is joining the lobby. The first member to join will be the lobby owner.
	OwnerMigrationPolicy: string?, --- The policy for how a new owner is chosen. May be 'Automatic', 'Manual' or 'None'. Can only be specified by clients. If client-owned and 'Automatic' - The Lobby service will automatically assign another connected owner when the current owner leaves or disconnects. The useConnections property must be true. If client - owned and 'Manual' - Ownership is protected as long as the current owner is connected. If the current owner leaves or disconnects any member may set themselves as the current owner. The useConnections property must be true. If client-owned and 'None' - Any member can set ownership. The useConnections property can be either true or false.
	UseConnections: boolean, --- A setting to control whether connections are used. Defaults to true. When true, notifications are sent to subscribed players, disconnect detection removes connectionHandles, only owner migration policies using connections are allowed, and lobbies must have at least one connected member to be searchable or be a server hosted lobby with a connected server. If false, then notifications are not sent, connections are not allowed, and lobbies do not need connections to be searchable.
}

--- Request to join a lobby. Only a client can join a lobby. 
export type JoinLobbyRequest = {
	ConnectionString: string?, --- A field which indicates which lobby the user will be joining. This field is opaque to everyone except the Lobby service.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MemberData: {[any]: any}?, --- The private key-value pairs used by the member to communicate information to other members and the owner. Visible to all members of the lobby. At most 30 key-value pairs may be stored here, keys are limited to 30 characters and values to 1000. The total size of all memberData values may not exceed 4096 bytes.Keys are case sensitive.
	MemberEntity: EntityKey?, --- The member entity who is joining the lobby.
}

export type JoinLobbyResult = {
	LobbyId: string, --- Successfully joined lobby's id.
}

--- Add the player to a matchmaking ticket and specify all of its matchmaking attributes. 
--- Players can join a ticket if and only if their EntityKeys are already listed 
--- in the ticket's Members list. The matchmaking service automatically starts matching 
--- the ticket against other matchmaking tickets once all players have joined the 
--- ticket. It is not possible to join a ticket once it has started matching. 
export type JoinMatchmakingTicketRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Member: MatchmakingPlayer, --- The User who wants to join the ticket. Their Id must be listed in PlayFabIdsToMatchWith.
	QueueName: string, --- The name of the queue to join.
	TicketId: string, --- The Id of the ticket to find a match for.
}

export type JoinMatchmakingTicketResult = {
}

--- Request to leave a lobby. Only a client can leave a lobby. 
export type LeaveLobbyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	LobbyId: string?, --- The id of the lobby.
	MemberEntity: EntityKey?, --- The member entity leaving the lobby.
}

export type LinearDifferenceRuleExpansion = {
	Delta: number, --- This value gets added to Difference at every expansion interval.
	Limit: number?, --- Once the total difference reaches this value, expansion stops. Optional.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type LinearRegionSelectionRuleExpansion = {
	Delta: number, --- This value gets added to MaxLatency at every expansion interval.
	Limit: number, --- Once the max Latency reaches this value, expansion stops.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type LinearSetIntersectionRuleExpansion = {
	Delta: number, --- This value gets added to MinIntersectionSize at every expansion interval.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type LinearTeamDifferenceRuleExpansion = {
	Delta: number, --- This value gets added to Difference at every expansion interval.
	Limit: number?, --- Once the total difference reaches this value, expansion stops. Optional.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type LinearTeamSizeBalanceRuleExpansion = {
	Delta: number, --- This value gets added to Difference at every expansion interval.
	Limit: number?, --- Once the total difference reaches this value, expansion stops. Optional.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

export type LinuxInstrumentationConfiguration = {
	IsEnabled: boolean, --- Designates whether Linux instrumentation configuration will be enabled for this Build
}

--- Returns a list of multiplayer server game asset summaries for a title. 
export type ListAssetSummariesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PageSize: number?, --- The page size for the request.
	SkipToken: string?, --- The skip token for the paged request.
}

export type ListAssetSummariesResponse = {
	AssetSummaries: {AssetSummary}?, --- The list of asset summaries.
	PageSize: number, --- The page size on the response.
	SkipToken: string?, --- The skip token for the paged response.
}

--- Returns a list of summarized details of all multiplayer server builds for a 
--- title. 
export type ListBuildAliasesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PageSize: number?, --- The page size for the request.
	SkipToken: string?, --- The skip token for the paged request.
}

export type ListBuildAliasesResponse = {
	BuildAliases: {BuildAliasDetailsResponse}?, --- The list of build aliases for the title
	PageSize: number, --- The page size on the response.
	SkipToken: string?, --- The skip token for the paged response.
}

--- Returns a list of summarized details of all multiplayer server builds for a 
--- title. 
export type ListBuildSummariesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PageSize: number?, --- The page size for the request.
	SkipToken: string?, --- The skip token for the paged request.
}

export type ListBuildSummariesResponse = {
	BuildSummaries: {BuildSummary}?, --- The list of build summaries for a title.
	PageSize: number, --- The page size on the response.
	SkipToken: string?, --- The skip token for the paged response.
}

--- Returns a list of multiplayer server game certificates for a title. 
export type ListCertificateSummariesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PageSize: number?, --- The page size for the request.
	SkipToken: string?, --- The skip token for the paged request.
}

export type ListCertificateSummariesResponse = {
	CertificateSummaries: {CertificateSummary}?, --- The list of game certificates.
	PageSize: number, --- The page size on the response.
	SkipToken: string?, --- The skip token for the paged response.
}

--- Returns a list of the tags for a particular container image that exists in the 
--- container registry for a title. 
export type ListContainerImageTagsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ImageName: string?, --- The container images we want to list tags for.
}

export type ListContainerImageTagsResponse = {
	Tags: {any}?, --- The list of tags for a particular container image.
}

--- Returns a list of the container images that have been uploaded to the container 
--- registry for a title. 
export type ListContainerImagesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PageSize: number?, --- The page size for the request.
	SkipToken: string?, --- The skip token for the paged request.
}

export type ListContainerImagesResponse = {
	Images: {any}?, --- The list of container images.
	PageSize: number, --- The page size on the response.
	SkipToken: string?, --- The skip token for the paged response.
}

--- Gets a list of all the matchmaking queue configurations for the title. 
export type ListMatchmakingQueuesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type ListMatchmakingQueuesResult = {
	MatchMakingQueues: {MatchmakingQueueConfig}?, --- The list of matchmaking queue configs for this title.
}

--- If the caller is a title, the EntityKey in the request is required. If the caller 
--- is a player, then it is optional. If it is provided it must match the caller's 
--- entity. 
export type ListMatchmakingTicketsForPlayerRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey?, --- The entity key for which to find the ticket Ids.
	QueueName: string, --- The name of the queue to find a match for.
}

export type ListMatchmakingTicketsForPlayerResult = {
	TicketIds: {any}, --- The list of ticket Ids the user is a member of.
}

--- Returns a list of multiplayer servers for a build in a specific region. 
export type ListMultiplayerServersRequest = {
	BuildId: string, --- The guid string build ID of the multiplayer servers to list.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PageSize: number?, --- The page size for the request.
	Region: string, --- The region the multiplayer servers to list.
	SkipToken: string?, --- The skip token for the paged request.
}

export type ListMultiplayerServersResponse = {
	MultiplayerServerSummaries: {MultiplayerServerSummary}?, --- The list of multiplayer server summary details.
	PageSize: number, --- The page size on the response.
	SkipToken: string?, --- The skip token for the paged response.
}

--- Returns a list of quality of service servers for party. 
export type ListPartyQosServersRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type ListPartyQosServersResponse = {
	PageSize: number, --- The page size on the response.
	QosServers: {QosServer}?, --- The list of QoS servers.
	SkipToken: string?, --- The skip token for the paged response.
}

--- Returns a list of quality of service servers for a title. 
export type ListQosServersForTitleRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	IncludeAllRegions: boolean?, --- Indicates that the response should contain Qos servers for all regions, including those where there are no builds deployed for the title.
}

export type ListQosServersForTitleResponse = {
	PageSize: number, --- The page size on the response.
	QosServers: {QosServer}?, --- The list of QoS servers.
	SkipToken: string?, --- The skip token for the paged response.
}

--- List all server backfill ticket Ids the user is a member of. 
export type ListServerBackfillTicketsForPlayerRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	Entity: EntityKey, --- The entity key for which to find the ticket Ids.
	QueueName: string, --- The name of the queue the tickets are in.
}

export type ListServerBackfillTicketsForPlayerResult = {
	TicketIds: {any}, --- The list of backfill ticket Ids the user is a member of.
}

--- List all server quota change requests for a title. 
export type ListTitleMultiplayerServersQuotaChangesRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type ListTitleMultiplayerServersQuotaChangesResponse = {
	Changes: {QuotaChange}?, --- All change requests for this title.
}

--- Returns a list of virtual machines for a title. 
export type ListVirtualMachineSummariesRequest = {
	BuildId: string, --- The guid string build ID of the virtual machines to list.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	PageSize: number?, --- The page size for the request.
	Region: string, --- The region of the virtual machines to list.
	SkipToken: string?, --- The skip token for the paged request.
}

export type ListVirtualMachineSummariesResponse = {
	PageSize: number, --- The page size on the response.
	SkipToken: string?, --- The skip token for the paged response.
	VirtualMachines: {VirtualMachineSummary}?, --- The list of virtual machine summaries.
}

export type Lobby = {
	AccessPolicy: string, --- A setting indicating who is allowed to join this lobby, as well as see it in queries.
	ChangeNumber: number, --- A number that increments once for each request that modifies the lobby.
	ConnectionString: string, --- A string used to join the lobby. This field is populated by the Lobby service. Invites are performed by communicating this connectionString to other players.
	LobbyData: {[any]: any}?, --- Lobby data.
	LobbyId: string, --- Id to uniquely identify a lobby.
	MaxPlayers: number, --- The maximum number of players allowed in the lobby.
	Members: {Member}?, --- Array of all lobby members.
	MembershipLock: string, --- A setting indicating whether members are allowed to join this lobby. When Locked new members are prevented from joining.
	Owner: EntityKey?, --- The client or server entity which owns this lobby.
	OwnerMigrationPolicy: string?, --- A setting indicating the owner migration policy. If server owned, this field is not present.
	PubSubConnectionHandle: string?, --- An opaque string stored on a SubscribeToLobbyResource call, which indicates the connection an owner or member has with PubSub.
	SearchData: {[any]: any}?, --- Search data.
	UseConnections: boolean, --- A flag which determines if connections are used. Defaults to true. Only set on create.
}

export type LobbyEmptyResult = {
}

export type LobbySummary = {
	ConnectionString: string, --- A string used to join the lobby.This field is populated by the Lobby service.Invites are performed by communicating this connectionString to other players.
	CurrentPlayers: number, --- The current number of players in the lobby.
	LobbyId: string, --- Id to uniquely identify a lobby.
	MaxPlayers: number, --- The maximum number of players allowed in the lobby.
	MembershipLock: string?, --- A setting indicating whether members are allowed to join this lobby. When Locked new members are prevented from joining.
	Owner: EntityKey, --- The client or server entity which owns this lobby.
	SearchData: {[any]: any}?, --- Search data.
}

export type MatchTotalRule = {
	Attribute: QueueRuleAttribute, --- Description of the attribute used by this rule to match tickets.
	Expansion: MatchTotalRuleExpansion?, --- Collection of fields relating to expanding this rule at set intervals.
	Max: number, --- The maximum total value for a group. Must be >= Min.
	Min: number, --- The minimum total value for a group. Must be >=2.
	Name: string, --- Friendly name chosen by developer.
	SecondsUntilOptional: number?, --- How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be prioritized over those that don't). Leave blank if this rule is always enforced.
	Weight: number, --- The relative weight of this rule compared to others.
}

export type MatchTotalRuleExpansion = {
	MaxOverrides: {OverrideDouble}?, --- Manually specify the values to use for each expansion interval. When this is set, Max is ignored.
	MinOverrides: {OverrideDouble}?, --- Manually specify the values to use for each expansion interval. When this is set, Min is ignored.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

--- A user in a matchmaking ticket. 
export type MatchmakingPlayer = {
	Attributes: MatchmakingPlayerAttributes?, --- The user's attributes custom to the title.
	Entity: EntityKey, --- The entity key of the matchmaking user.
}

--- The matchmaking attributes for a user. 
export type MatchmakingPlayerAttributes = {
	DataObject: {[any]: any}?, --- A data object representing a user's attributes.
	EscapedDataObject: string?, --- An escaped data object representing a user's attributes.
}

--- A player in a created matchmaking match with a team assignment. 
export type MatchmakingPlayerWithTeamAssignment = {
	Attributes: MatchmakingPlayerAttributes?, --- The user's attributes custom to the title. These attributes will be null unless the request has ReturnMemberAttributes flag set to true.
	Entity: EntityKey, --- The entity key of the matchmaking user.
	TeamId: string?, --- The Id of the team the User is assigned to.
}

export type MatchmakingQueueConfig = {
	BuildAliasParams: BuildAliasParams?, --- This is the buildAlias that will be used to allocate the multiplayer server for the match.
	BuildId: string?, --- This is the buildId that will be used to allocate the multiplayer server for the match.
	DifferenceRules: {DifferenceRule}?, --- List of difference rules used to find an optimal match.
	MatchTotalRules: {MatchTotalRule}?, --- List of match total rules used to find an optimal match.
	MaxMatchSize: number, --- Maximum number of players in a match.
	MaxTicketSize: number?, --- Maximum number of players in a ticket. Optional.
	MinMatchSize: number, --- Minimum number of players in a match.
	Name: string, --- Unique identifier for a Queue. Chosen by the developer.
	RegionSelectionRule: RegionSelectionRule?, --- Region selection rule used to find an optimal match.
	ServerAllocationEnabled: boolean, --- Boolean flag to enable server allocation for the queue.
	SetIntersectionRules: {SetIntersectionRule}?, --- List of set intersection rules used to find an optimal match.
	StatisticsVisibilityToPlayers: StatisticsVisibilityToPlayers?, --- Controls which statistics are visible to players.
	StringEqualityRules: {StringEqualityRule}?, --- List of string equality rules used to find an optimal match.
	TeamDifferenceRules: {TeamDifferenceRule}?, --- List of team difference rules used to find an optimal match.
	TeamSizeBalanceRule: TeamSizeBalanceRule?, --- Team size balance rule used to find an optimal match.
	TeamTicketSizeSimilarityRule: TeamTicketSizeSimilarityRule?, --- Team ticket size similarity rule used to find an optimal match.
	Teams: {MatchmakingQueueTeam}?, --- The team configuration for a match. This may be null if there are no teams.
}

export type MatchmakingQueueTeam = {
	MaxTeamSize: number, --- The maximum number of players required for the team.
	MinTeamSize: number, --- The minimum number of players required for the team.
	Name: string, --- A name to identify the team. This is case insensitive.
}

export type Member = {
	MemberData: {[any]: any}?, --- Key-value pairs specific to member.
	MemberEntity: EntityKey?, --- The member entity key.
	PubSubConnectionHandle: string?, --- Opaque string, stored on a Subscribe call, which indicates the connection an owner or member has with PubSub.
}

export type MembershipLock = 
	"Unlocked"
	| "Locked"

export type MonitoringApplicationConfiguration = {
	AssetReference: AssetReference, --- Asset which contains the monitoring application files and scripts.
	ExecutionScriptName: string, --- Execution script name, this will be the main executable for the monitoring application.
	InstallationScriptName: string?, --- Installation script name, this will be run before the ExecutionScript.
	OnStartRuntimeInMinutes: number?, --- Timespan the monitoring application will be kept alive when running from the start of the VM
}

export type MonitoringApplicationConfigurationParams = {
	AssetReference: AssetReferenceParams, --- Asset which contains the monitoring application files and scripts.
	ExecutionScriptName: string, --- Execution script name, this will be the main executable for the monitoring application.
	InstallationScriptName: string?, --- Installation script name, this will be run before the ExecutionScript.
	OnStartRuntimeInMinutes: number?, --- Timespan the monitoring application will be kept alive when running from the start of the VM
}

export type MultiplayerServerSummary = {
	ConnectedPlayers: {ConnectedPlayer}?, --- The connected players in the multiplayer server.
	LastStateTransitionTime: string?, --- The time (UTC) at which a change in the multiplayer server state was observed.
	Region: string?, --- The region the multiplayer server is located in.
	ServerId: string?, --- The string server ID of the multiplayer server generated by PlayFab.
	SessionId: string?, --- The title generated guid string session ID of the multiplayer server.
	State: string?, --- The state of the multiplayer server.
	VmId: string?, --- The virtual machine ID that the multiplayer server is located on.
}

export type OsPlatform = 
	"Windows"
	| "Linux"

export type OverrideDouble = {
	Value: number, --- The custom expansion value.
}

export type OverrideUnsignedInt = {
	Value: number, --- The custom expansion value.
}

export type OwnerMigrationPolicy = 
	"None"
	| "Automatic"
	| "Manual"
	| "Server"

export type PaginationRequest = {
	ContinuationToken: string?, --- Continuation token returned as a result in a previous FindLobbies call. Cannot be specified by clients.
	PageSizeRequested: number?, --- The number of lobbies that should be retrieved. Cannot be specified by servers, clients may specify any value up to 50
}

export type PaginationResponse = {
	ContinuationToken: string?, --- Continuation token returned by server call. Not returned for clients
	TotalMatchedLobbyCount: number?, --- The number of lobbies that matched the search request.
}

export type Port = {
	Name: string, --- The name for the port.
	Num: number, --- The number for the port.
	Protocol: string, --- The protocol for the port.
}

export type ProtocolType = 
	"TCP"
	| "UDP"

--- SignalR clients make this request to initiate their connection to the PubSubHub 
--- SignalR service. Clients will interpret the response and make a persistent websocket 
--- connection to the service with the details. 
export type PubSubNegotiateRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type PubSubNegotiateResult = {
	AccessToken: string?, --- The access token for the PubSub Azure SignalR service.
	Url: string?, --- The Url of the PubSub Azure SignalR endpoint.
}

export type QosServer = {
	Region: string?, --- The region the QoS server is located in.
	ServerUrl: string?, --- The QoS server URL.
}

export type QueueRuleAttribute = {
	Path: string, --- Specifies which attribute in a ticket to use.
	Source: string, --- Specifies which source the attribute comes from.
}

export type QuotaChange = {
	ChangeDescription: string?, --- A brief description of the requested changes.
	Changes: {CoreCapacityChange}?, --- Requested changes to make to the titles cores quota.
	IsPendingReview: boolean, --- Whether or not this request is pending a review.
	Notes: string?, --- Additional information about this request that our team can use to better understand the requirements.
	RequestId: string?, --- Id of the change request.
	ReviewComments: string?, --- Comments by our team when a request is reviewed.
	WasApproved: boolean, --- Whether or not this request was approved.
}

export type RegionSelectionRule = {
	CustomExpansion: CustomRegionSelectionRuleExpansion?, --- Controls how the Max Latency parameter expands over time. Only one expansion can be set per rule. When this is set, MaxLatency is ignored.
	LinearExpansion: LinearRegionSelectionRuleExpansion?, --- Controls how the Max Latency parameter expands over time. Only one expansion can be set per rule.
	MaxLatency: number, --- Specifies the maximum latency that is allowed between the client and the selected server. The value is in milliseconds.
	Name: string, --- Friendly name chosen by developer.
	Path: string, --- Specifies which attribute in a ticket to use.
	SecondsUntilOptional: number?, --- How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be prioritized over those that don't). Leave blank if this rule is always enforced.
	Weight: number, --- The relative weight of this rule compared to others.
}

--- Deletes the configuration for a queue. This will permanently delete the configuration 
--- and players will no longer be able to match in the queue. All outstanding matchmaking 
--- tickets will be cancelled. 
export type RemoveMatchmakingQueueRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	QueueName: string?, --- The Id of the matchmaking queue to remove.
}

export type RemoveMatchmakingQueueResult = {
}

--- Request to remove a member from a lobby. Owners may remove other members from 
--- a lobby. Members cannot remove themselves (use LeaveLobby instead). 
export type RemoveMemberFromLobbyRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	LobbyId: string?, --- The id of the lobby.
	MemberEntity: EntityKey?, --- The member entity to be removed from the lobby.
	PreventRejoin: boolean, --- If true, removed member can never rejoin this lobby.
}

--- Requests a multiplayer server session from a particular build in any of the 
--- given preferred regions. 
export type RequestMultiplayerServerRequest = {
	BuildAliasParams: BuildAliasParams?, --- The identifiers of the build alias to use for the request.
	BuildId: string?, --- The guid string build ID of the multiplayer server to request.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	InitialPlayers: {any}?, --- Initial list of players (potentially matchmade) allowed to connect to the game. This list is passed to the game server when requested (via GSDK) and can be used to validate players connecting to it.
	PreferredRegions: {AzureRegion}, --- The preferred regions to request a multiplayer server from. The Multiplayer Service will iterate through the regions in the specified order and allocate a server from the first one that has servers available.
	SessionCookie: string?, --- Data encoded as a string that is passed to the game server when requested. This can be used to to communicate information such as game mode or map through the request flow.
	SessionId: string, --- A guid string session ID created track the multiplayer server session over its life.
}

export type RequestMultiplayerServerResponse = {
	BuildId: string?, --- The identity of the build in which the server was allocated.
	ConnectedPlayers: {ConnectedPlayer}?, --- The connected players in the multiplayer server.
	FQDN: string?, --- The fully qualified domain name of the virtual machine that is hosting this multiplayer server.
	IPV4Address: string?, --- The IPv4 address of the virtual machine that is hosting this multiplayer server.
	LastStateTransitionTime: string?, --- The time (UTC) at which a change in the multiplayer server state was observed.
	Ports: {Port}?, --- The ports the multiplayer server uses.
	Region: string?, --- The region the multiplayer server is located in.
	ServerId: string?, --- The string server ID of the multiplayer server generated by PlayFab.
	SessionId: string?, --- The guid string session ID of the multiplayer server.
	State: string?, --- The state of the multiplayer server.
	VmId: string?, --- The virtual machine ID that the multiplayer server is located on.
}

--- Gets new credentials to the container registry where game developers can upload 
--- custom container images to before creating a new build. 
export type RolloverContainerRegistryCredentialsRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

export type RolloverContainerRegistryCredentialsResponse = {
	DnsName: string?, --- The url of the container registry.
	Password: string?, --- The password for accessing the container registry.
	Username: string?, --- The username for accessing the container registry.
}

export type Schedule = {
	Description: string?, --- A short description about this schedule. For example, "Game launch on July 15th".
	EndTime: string, --- The date and time in UTC at which the schedule ends. If IsRecurringWeekly is true, this schedule will keep renewing for future weeks until disabled or removed.
	IsDisabled: boolean, --- Disables the schedule.
	IsRecurringWeekly: boolean, --- If true, the StartTime and EndTime will get renewed every week.
	StartTime: string, --- The date and time in UTC at which the schedule starts.
	TargetStandby: number, --- The standby target to maintain for the duration of the schedule.
}

export type ScheduledStandbySettings = {
	IsEnabled: boolean, --- When true, scheduled standby will be enabled
	ScheduleList: {Schedule}?, --- A list of non-overlapping schedules
}

export type ServerDetails = {
	Fqdn: string?, --- The fully qualified domain name of the virtual machine that is hosting this multiplayer server.
	IPV4Address: string?, --- The IPv4 address of the virtual machine that is hosting this multiplayer server.
	Ports: {Port}?, --- The ports the multiplayer server uses.
	Region: string?, --- The server's region.
}

export type ServerResourceConstraintParams = {
	CpuLimit: number, --- The maximum number of cores that each server is allowed to use.
	MemoryLimitGB: number, --- The maximum number of GiB of memory that each server is allowed to use. WARNING: After exceeding this limit, the server will be killed
}

export type ServerType = 
	"Container"
	| "Process"

export type SetIntersectionRule = {
	Attribute: QueueRuleAttribute, --- Description of the attribute used by this rule to match tickets.
	AttributeNotSpecifiedBehavior: string, --- Describes the behavior when an attribute is not specified in the ticket creation request or in the user's entity profile.
	CustomExpansion: CustomSetIntersectionRuleExpansion?, --- Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule. When this is set, MinIntersectionSize is ignored.
	DefaultAttributeValue: {any}?, --- The default value assigned to tickets that are missing the attribute specified by AttributePath (assuming that AttributeNotSpecifiedBehavior is UseDefault). Values must be unique.
	LinearExpansion: LinearSetIntersectionRuleExpansion?, --- Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule.
	MinIntersectionSize: number, --- The minimum number of values that must match between sets.
	Name: string, --- Friendly name chosen by developer.
	SecondsUntilOptional: number?, --- How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be prioritized over those that don't). Leave blank if this rule is always enforced.
	Weight: number, --- The relative weight of this rule compared to others.
}

--- Use this API to create or update matchmaking queue configurations. The queue 
--- configuration defines the matchmaking rules. The matchmaking service will match 
--- tickets together according to the configured rules. Queue resources are not 
--- spun up by calling this API. Queues are created when the first ticket is submitted. 
export type SetMatchmakingQueueRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	MatchmakingQueue: MatchmakingQueueConfig?, --- The matchmaking queue config.
}

export type SetMatchmakingQueueResult = {
}

--- Executes the shutdown callback from the GSDK and terminates the multiplayer 
--- server session. The callback in the GSDK will allow for graceful shutdown with 
--- a 15 minute timeoutIf graceful shutdown has not been completed before 15 minutes 
--- have elapsed, the multiplayer server session will be forcefully terminated on 
--- it's own. 
export type ShutdownMultiplayerServerRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	SessionId: string, --- A guid string session ID of the multiplayer server to shut down.
}

export type Statistics = {
	Average: number, --- The average.
	Percentile50: number, --- The 50th percentile.
	Percentile90: number, --- The 90th percentile.
	Percentile99: number, --- The 99th percentile.
}

export type StatisticsVisibilityToPlayers = {
	ShowNumberOfPlayersMatching: boolean, --- Whether to allow players to view the current number of players in the matchmaking queue.
	ShowTimeToMatch: boolean, --- Whether to allow players to view statistics representing the time it takes for tickets to find a match.
}

export type StringEqualityRule = {
	Attribute: QueueRuleAttribute, --- Description of the attribute used by this rule to match tickets.
	AttributeNotSpecifiedBehavior: string, --- Describes the behavior when an attribute is not specified in the ticket creation request or in the user's entity profile.
	DefaultAttributeValue: string?, --- The default value assigned to tickets that are missing the attribute specified by AttributePath (assuming that AttributeNotSpecifiedBehavior is false).
	Expansion: StringEqualityRuleExpansion?, --- Collection of fields relating to expanding this rule at set intervals. For StringEqualityRules, this is limited to turning the rule off or on during different intervals.
	Name: string, --- Friendly name chosen by developer.
	SecondsUntilOptional: number?, --- How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be prioritized over those that don't). Leave blank if this rule is always enforced.
	Weight: number, --- The relative weight of this rule compared to others.
}

export type StringEqualityRuleExpansion = {
	EnabledOverrides: {any}, --- List of bools specifying whether the rule is applied during this expansion.
	SecondsBetweenExpansions: number, --- How many seconds before this rule is expanded.
}

--- Request to subscribe to lobby resource notifications. 
export type SubscribeToLobbyResourceRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EntityKey: EntityKey, --- The entity performing the subscription.
	PubSubConnectionHandle: string, --- Opaque string, given to a client upon creating a connection with PubSub.
	ResourceId: string, --- The name of the resource to subscribe to.
	SubscriptionVersion: number, --- Version number for the subscription of this resource.
	Type: string, --- Subscription type.
}

export type SubscribeToLobbyResourceResult = {
	Topic: string, --- Topic will be returned in all notifications that are the result of this subscription.
}

--- Subscribe to match resource notifications. Match subscriptions have two types; 
--- MatchInvite and MatchTicketStatusChange 
export type SubscribeToMatchResourceRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EntityKey: EntityKey, --- The entity performing the subscription. The entity must be authorized to use this connectionHandle.
	PubSubConnectionHandle: string, --- Opaque string, given to a client upon creating a connection with PubSub. Notifications will be sent to the connection associated with this handle.
	ResourceId: string, --- The name of the resource to subscribe to.
	SubscriptionVersion: number, --- Version number for the subscription of this resource. Current supported version must be 1.
	Type: string, --- Subscription type. MatchInvite subscriptions are per-player. MatchTicketStatusChange subscriptions are per-ticket. Subscribe calls are idempotent. Subscribing on the same resource for the same connection results in success.
}

export type SubscribeToMatchResourceResult = {
	Topic: string, --- Matchmaking resource
}

export type SubscriptionType = 
	"LobbyChange"
	| "LobbyInvite"

export type TeamDifferenceRule = {
	Attribute: QueueRuleAttribute, --- Description of the attribute used by this rule to match teams.
	CustomExpansion: CustomTeamDifferenceRuleExpansion?, --- Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule. When this is set, Difference is ignored.
	DefaultAttributeValue: number, --- The default value assigned to tickets that are missing the attribute specified by AttributePath (assuming that AttributeNotSpecifiedBehavior is false).
	Difference: number, --- The allowed difference between any two teams at the start of matchmaking.
	LinearExpansion: LinearTeamDifferenceRuleExpansion?, --- Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule.
	Name: string, --- Friendly name chosen by developer.
	SecondsUntilOptional: number?, --- How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be prioritized over those that don't). Leave blank if this rule is always enforced.
}

export type TeamSizeBalanceRule = {
	CustomExpansion: CustomTeamSizeBalanceRuleExpansion?, --- Controls how the Difference parameter expands over time. Only one expansion can be set per rule. When this is set, Difference is ignored.
	Difference: number, --- The allowed difference in team size between any two teams.
	LinearExpansion: LinearTeamSizeBalanceRuleExpansion?, --- Controls how the Difference parameter expands over time. Only one expansion can be set per rule.
	Name: string, --- Friendly name chosen by developer.
	SecondsUntilOptional: number?, --- How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be prioritized over those that don't). Leave blank if this rule is always enforced.
}

export type TeamTicketSizeSimilarityRule = {
	Name: string, --- Friendly name chosen by developer.
	SecondsUntilOptional: number?, --- How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be prioritized over those that don't). Leave blank if this rule is always enforced.
}

export type TitleMultiplayerServerEnabledStatus = 
	"Initializing"
	| "Enabled"
	| "Disabled"

export type TitleMultiplayerServersQuotas = {
	CoreCapacities: {CoreCapacity}?, --- The core capacity for the various regions and VM Family
}

--- Request to unsubscribe from lobby notifications. 
export type UnsubscribeFromLobbyResourceRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EntityKey: EntityKey, --- The entity which performed the subscription.
	PubSubConnectionHandle: string, --- Opaque string, given to a client upon creating a connection with PubSub.
	ResourceId: string, --- The name of the resource to unsubscribe from.
	SubscriptionVersion: number, --- Version number passed for the subscription of this resource.
	Type: string, --- Subscription type.
}

--- Unsubscribe from a Match resource's notifications. For MatchInvite, players 
--- are expected to unsubscribe once they can no longer accept invites. For MatchTicketStatusChange, 
--- players are expected to unsusbcribe once the ticket has reached a canceled or 
--- matched state. 
export type UnsubscribeFromMatchResourceRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	EntityKey: EntityKey, --- The entity performing the unsubscription. The entity must be authorized to use this connectionHandle.
	PubSubConnectionHandle: string, --- Opaque string, given to a client upon creating a connection with PubSub.
	ResourceId: string, --- The resource to unsubscribe from.
	SubscriptionVersion: number, --- Version number for the unsubscription from this resource.
	Type: string, --- Type of the subscription to be canceled.
}

export type UnsubscribeFromMatchResourceResult = {
}

--- Removes the specified tag from the image. After this operation, a 'docker pull' 
--- will fail for the specified image and tag combination. Morever, ListContainerImageTags 
--- will not return the specified tag. 
export type UntagContainerImageRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	ImageName: string?, --- The container image which tag we want to remove.
	Tag: string?, --- The tag we want to remove.
}

--- Creates a multiplayer server build alias and returns the created alias. 
export type UpdateBuildAliasRequest = {
	AliasId: string, --- The guid string alias Id of the alias to be updated.
	AliasName: string?, --- The alias name.
	BuildSelectionCriteria: {BuildSelectionCriterion}?, --- Array of build selection criteria.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- Updates a multiplayer server build's name. 
export type UpdateBuildNameRequest = {
	BuildId: string, --- The guid string ID of the build we want to update the name of.
	BuildName: string, --- The build name.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- Updates a multiplayer server build's region. 
export type UpdateBuildRegionRequest = {
	BuildId: string, --- The guid string ID of the build we want to update regions for.
	BuildRegion: BuildRegionParams, --- The updated region configuration that should be applied to the specified build.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- Updates a multiplayer server build's regions. 
export type UpdateBuildRegionsRequest = {
	BuildId: string, --- The guid string ID of the build we want to update regions for.
	BuildRegions: {BuildRegionParams}, --- The updated region configuration that should be applied to the specified build.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
}

--- Request to update a lobby. 
export type UpdateLobbyRequest = {
	AccessPolicy: string?, --- The policy indicating who is allowed to join the lobby, and the visibility to queries. May be 'Public', 'Friends' or 'Private'. Public means the lobby is both visible in queries and any player may join, including invited players. Friends means that users who are bidirectional friends of members in the lobby may search to find friend lobbies, to retrieve its connection string. Private means the lobby is not visible in queries, and a player must receive an invitation to join. Defaults to 'Public' on creation. Can only be changed by the lobby owner.
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	LobbyData: {[any]: any}?, --- The private key-value pairs which are only visible to members of the lobby. Optional. Sets or updates key-value pairs on the lobby. Only the current lobby owner can set lobby data. Keys may be an arbitrary string of at most 30 characters. The total size of all lobbyData values may not exceed 4096 bytes. Values are not individually limited. There can be up to 30 key-value pairs stored here. Keys are case sensitive.
	LobbyDataToDelete: {any}?, --- The keys to delete from the lobby LobbyData. Optional. Behaves similar to searchDataToDelete, but applies to lobbyData.
	LobbyId: string?, --- The id of the lobby.
	MaxPlayers: number?, --- The maximum number of players allowed in the lobby. Updates the maximum allowed number of players in the lobby. Only the current lobby owner can set this. If set, the value must be greater than or equal to the number of members currently in the lobby.
	MemberData: {[any]: any}?, --- The private key-value pairs used by the member to communicate information to other members and the owner. Optional. Sets or updates new key-value pairs on the caller's member data. New keys will be added with their values and existing keys will be updated with the new values. Visible to all members of the lobby. At most 30 key-value pairs may be stored here, keys are limited to 30 characters and values to 1000. The total size of all memberData values may not exceed 4096 bytes. Keys are case sensitive. Servers cannot specifiy this.
	MemberDataToDelete: {any}?, --- The keys to delete from the lobby MemberData. Optional. Deletes key-value pairs on the caller's member data. All the specified keys will be removed from the caller's member data. Keys that do not exist are a no-op. If the key to delete exists in the memberData (same request) it will result in a bad request. Servers cannot specifiy this.
	MemberEntity: EntityKey?, --- The member entity whose data is being modified. Servers cannot specify this.
	MembershipLock: string?, --- A setting indicating whether the lobby is locked. May be 'Unlocked' or 'Locked'. When Locked new members are not allowed to join. Defaults to 'Unlocked' on creation. Can only be changed by the lobby owner.
	Owner: EntityKey?, --- The lobby owner. Optional. Set to transfer ownership of the lobby. If client - owned and 'Automatic' - The Lobby service will automatically assign another connected owner when the current owner leaves or disconnects. useConnections must be true. If client - owned and 'Manual' - Ownership is protected as long as the current owner is connected. If the current owner leaves or disconnects any member may set themselves as the current owner. The useConnections property must be true. If client-owned and 'None' - Any member can set ownership. The useConnections property can be either true or false. For all client-owned lobbies when the owner leaves and a new owner can not be automatically selected - The owner field is set to null. For all client-owned lobbies when the owner disconnects and a new owner can not be automatically selected - The owner field remains unchanged and the current owner retains all owner abilities for the lobby. If server-owned (must be 'Server') - Any server can set ownership. The useConnections property must be true.
	SearchData: {[any]: any}?, --- The public key-value pairs which allow queries to differentiate between lobbies. Optional. Sets or updates key-value pairs on the lobby for use with queries. Only the current lobby owner can set search data. New keys will be added with their values and existing keys will be updated with the new values. There can be up to 30 key-value pairs stored here. Keys are of the format string_key1, string_key2... string_key30 for string values, or number_key1, number_key2, ... number_key30 for numeric values. Numeric values are floats. Values can be at most 256 characters long. The total size of all searchData values may not exceed 1024 bytes.Keys are case sensitive.
	SearchDataToDelete: {any}?, --- The keys to delete from the lobby SearchData. Optional. Deletes key-value pairs on the lobby. Only the current lobby owner can delete search data. All the specified keys will be removed from the search data. Keys that do not exist in the lobby are a no-op.If the key to delete exists in the searchData (same request) it will result in a bad request.
}

--- Uploads a multiplayer server game certificate. 
export type UploadCertificateRequest = {
	CustomTags: {[any]: any}?, --- The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
	GameCertificate: Certificate, --- The game certificate to upload.
}

export type VirtualMachineSummary = {
	HealthStatus: string?, --- The virtual machine health status.
	State: string?, --- The virtual machine state.
	VmId: string?, --- The virtual machine ID.
}

export type WindowsCrashDumpConfiguration = {
	CustomDumpFlags: number?, --- See https://docs.microsoft.com/en-us/windows/win32/wer/collecting-user-mode-dumps for valid values.
	DumpType: number?, --- See https://docs.microsoft.com/en-us/windows/win32/wer/collecting-user-mode-dumps for valid values.
	IsEnabled: boolean, --- Designates whether automatic crash dump capturing will be enabled for this Build.
}


--- Creates a multiplayer lobby. The caller is the lobby creator. Caller may be 
--- a server or player entity. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/createlobby
function MultiplayerApi.CreateLobbyAsync(
	entityToken: string, 
	request: CreateLobbyRequest
): CreateLobbyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Delete a lobby. This method is only callable by servers. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/deletelobby
function MultiplayerApi.DeleteLobbyAsync(
	entityToken: string, 
	request: DeleteLobbyRequest
): LobbyEmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/DeleteLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Find lobbies which match certain criteria and contain friends of the caller. 
--- Friends optionally include Steam, Facebook and Xbox friends. Returns a maximum 
--- of 50 instances for client calls. This method is not callable by servers. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/findfriendlobbies
function MultiplayerApi.FindFriendLobbiesAsync(
	entityToken: string, 
	request: FindFriendLobbiesRequest
): FindFriendLobbiesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/FindFriendLobbies",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Find lobbies which match certain criteria. Returns a maximum of 500 entries 
--- for server callers, and 50 entries for client callers. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/findlobbies
function MultiplayerApi.FindLobbiesAsync(
	entityToken: string, 
	request: FindLobbiesRequest
): FindLobbiesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/FindLobbies",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/getlobby
function MultiplayerApi.GetLobbyAsync(
	entityToken: string, 
	request: GetLobbyRequest
): GetLobbyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Invite a player to a lobby the caller is already a member of. Only players may 
--- call this. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/invitetolobby
function MultiplayerApi.InviteToLobbyAsync(
	entityToken: string, 
	request: InviteToLobbyRequest
): LobbyEmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/InviteToLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinarrangedlobby
function MultiplayerApi.JoinArrangedLobbyAsync(
	entityToken: string, 
	request: JoinArrangedLobbyRequest
): JoinLobbyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/JoinArrangedLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinlobby
function MultiplayerApi.JoinLobbyAsync(
	entityToken: string, 
	request: JoinLobbyRequest
): JoinLobbyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/JoinLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Leave a lobby. Members will also be automatically unsubscribed from the lobby. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/leavelobby
function MultiplayerApi.LeaveLobbyAsync(
	entityToken: string, 
	request: LeaveLobbyRequest
): LobbyEmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/LeaveLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Remove another member from a lobby. Owners and servers may remove any member 
--- from a lobby. Members cannot remove themselves but they can use LeaveLobby instead. 
--- Members are also unsubscribed from the lobby. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/removemember
function MultiplayerApi.RemoveMemberAsync(
	entityToken: string, 
	request: RemoveMemberFromLobbyRequest
): LobbyEmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/RemoveMember",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Subscribe to lobby resource notifications. Lobby subscriptions have two types; 
--- LobbyChange and LobbyInvite. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/subscribetolobbyresource
function MultiplayerApi.SubscribeToLobbyResourceAsync(
	entityToken: string, 
	request: SubscribeToLobbyResourceRequest
): SubscribeToLobbyResourceResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/SubscribeToLobbyResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Unsubscribe from lobby notifications. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/unsubscribefromlobbyresource
function MultiplayerApi.UnsubscribeFromLobbyResourceAsync(
	entityToken: string, 
	request: UnsubscribeFromLobbyResourceRequest
): LobbyEmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UnsubscribeFromLobbyResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/updatelobby
function MultiplayerApi.UpdateLobbyAsync(
	entityToken: string, 
	request: UpdateLobbyRequest
): LobbyEmptyResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UpdateLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Cancels all tickets of which the player is a member in a given queue that are 
--- not cancelled or matched. This API is useful if you lose track of what tickets 
--- the player is a member of (if the title crashes for instance) and want to "reset". 
--- The Entity field is optional if the caller is a player and defaults to that 
--- player. Players may not cancel tickets for other people. The Entity field is 
--- required if the caller is a server (authenticated as the title). 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallmatchmakingticketsforplayer
function MultiplayerApi.CancelAllMatchmakingTicketsForPlayerAsync(
	entityToken: string, 
	request: CancelAllMatchmakingTicketsForPlayerRequest
): CancelAllMatchmakingTicketsForPlayerResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CancelAllMatchmakingTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Cancels all backfill tickets of which the player is a member in a given queue 
--- that are not cancelled or matched. This API is useful if you lose track of what 
--- tickets the player is a member of (if the server crashes for instance) and want 
--- to "reset". 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelallserverbackfillticketsforplayer
function MultiplayerApi.CancelAllServerBackfillTicketsForPlayerAsync(
	entityToken: string, 
	request: CancelAllServerBackfillTicketsForPlayerRequest
): CancelAllServerBackfillTicketsForPlayerResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CancelAllServerBackfillTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Only servers and ticket members can cancel a ticket. The ticket can be in five 
--- different states when it is cancelled. 1: the ticket is waiting for members 
--- to join it, and it has not started matching. If the ticket is cancelled at this 
--- stage, it will never match. 2: the ticket is matching. If the ticket is cancelled, 
--- it will stop matching. 3: the ticket is matched. A matched ticket cannot be 
--- cancelled. 4: the ticket is already cancelled and nothing happens. 5: the ticket 
--- is waiting for a server. If the ticket is cancelled, server allocation will 
--- be stopped. A server may still be allocated due to a race condition, but that 
--- will not be reflected in the ticket. There may be race conditions between the 
--- ticket getting matched and the client making a cancellation request. The client 
--- must handle the possibility that the cancel request fails if a match is found 
--- before the cancellation request is processed. We do not allow resubmitting a 
--- cancelled ticket because players must consent to enter matchmaking again. Create 
--- a new ticket instead. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelmatchmakingticket
function MultiplayerApi.CancelMatchmakingTicketAsync(
	entityToken: string, 
	request: CancelMatchmakingTicketRequest
): CancelMatchmakingTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CancelMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Only servers can cancel a backfill ticket. The ticket can be in three different 
--- states when it is cancelled. 1: the ticket is matching. If the ticket is cancelled, 
--- it will stop matching. 2: the ticket is matched. A matched ticket cannot be 
--- cancelled. 3: the ticket is already cancelled and nothing happens. There may 
--- be race conditions between the ticket getting matched and the server making 
--- a cancellation request. The server must handle the possibility that the cancel 
--- request fails if a match is found before the cancellation request is processed. 
--- We do not allow resubmitting a cancelled ticket. Create a new ticket instead. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/cancelserverbackfillticket
function MultiplayerApi.CancelServerBackfillTicketAsync(
	entityToken: string, 
	request: CancelServerBackfillTicketRequest
): CancelServerBackfillTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CancelServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The client specifies the creator's attributes and optionally a list of other 
--- users to match with. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/creatematchmakingticket
function MultiplayerApi.CreateMatchmakingTicketAsync(
	entityToken: string, 
	request: CreateMatchmakingTicketRequest
): CreateMatchmakingTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The server specifies all the members, their teams and their attributes, and 
--- the server details if applicable. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createserverbackfillticket
function MultiplayerApi.CreateServerBackfillTicketAsync(
	entityToken: string, 
	request: CreateServerBackfillTicketRequest
): CreateServerBackfillTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The server specifies all the members and their attributes. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/createservermatchmakingticket
function MultiplayerApi.CreateServerMatchmakingTicketAsync(
	entityToken: string, 
	request: CreateServerMatchmakingTicketRequest
): CreateMatchmakingTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateServerMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- When matchmaking has successfully matched together a collection of tickets, 
--- it produces a 'match' with an Id. The match contains all of the players that 
--- were matched together, and their team assigments. Only servers and ticket members 
--- can get the match. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatch
function MultiplayerApi.GetMatchAsync(
	entityToken: string, 
	request: GetMatchRequest
): GetMatchResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetMatch",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the current configuration for a queue. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/getmatchmakingqueue
function MultiplayerApi.GetMatchmakingQueueAsync(
	entityToken: string, 
	request: GetMatchmakingQueueRequest
): GetMatchmakingQueueResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The ticket includes the invited players, their attributes if they have joined, 
--- the ticket status, the match Id when applicable, etc. Only servers, the ticket 
--- creator and the invited players can get the ticket. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getmatchmakingticket
function MultiplayerApi.GetMatchmakingTicketAsync(
	entityToken: string, 
	request: GetMatchmakingTicketRequest
): GetMatchmakingTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns the matchmaking statistics for a queue. These include the number of 
--- players matching and the statistics related to the time to match statistics 
--- in seconds (average and percentiles). Statistics are refreshed once every 5 
--- minutes. Servers can access all statistics no matter what the ClientStatisticsVisibility 
--- is configured to. Clients can access statistics according to the ClientStatisticsVisibility. 
--- Client requests are forbidden if all visibility fields are false. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getqueuestatistics
function MultiplayerApi.GetQueueStatisticsAsync(
	entityToken: string, 
	request: GetQueueStatisticsRequest
): GetQueueStatisticsResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetQueueStatistics",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- The ticket includes the players, their attributes, their teams, the ticket status, 
--- the match Id and the server details when applicable, etc. Only servers can get 
--- the ticket. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/getserverbackfillticket
function MultiplayerApi.GetServerBackfillTicketAsync(
	entityToken: string, 
	request: GetServerBackfillTicketRequest
): GetServerBackfillTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetServerBackfillTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Add the player to a matchmaking ticket and specify all of its matchmaking attributes. 
--- Players can join a ticket if and only if their EntityKeys are already listed 
--- in the ticket's Members list. The matchmaking service automatically starts matching 
--- the ticket against other matchmaking tickets once all players have joined the 
--- ticket. It is not possible to join a ticket once it has started matching. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/joinmatchmakingticket
function MultiplayerApi.JoinMatchmakingTicketAsync(
	entityToken: string, 
	request: JoinMatchmakingTicketRequest
): JoinMatchmakingTicketResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/JoinMatchmakingTicket",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a list of all the matchmaking queue configurations for the title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/listmatchmakingqueues
function MultiplayerApi.ListMatchmakingQueuesAsync(
	entityToken: string, 
	request: ListMatchmakingQueuesRequest
): ListMatchmakingQueuesResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListMatchmakingQueues",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- If the caller is a title, the EntityKey in the request is required. If the caller 
--- is a player, then it is optional. If it is provided it must match the caller's 
--- entity. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listmatchmakingticketsforplayer
function MultiplayerApi.ListMatchmakingTicketsForPlayerAsync(
	entityToken: string, 
	request: ListMatchmakingTicketsForPlayerRequest
): ListMatchmakingTicketsForPlayerResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListMatchmakingTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- List all server backfill ticket Ids the user is a member of. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/listserverbackfillticketsforplayer
function MultiplayerApi.ListServerBackfillTicketsForPlayerAsync(
	entityToken: string, 
	request: ListServerBackfillTicketsForPlayerRequest
): ListServerBackfillTicketsForPlayerResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListServerBackfillTicketsForPlayer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes the configuration for a queue. This will permanently delete the configuration 
--- and players will no longer be able to match in the queue. All outstanding matchmaking 
--- tickets will be cancelled. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/removematchmakingqueue
function MultiplayerApi.RemoveMatchmakingQueueAsync(
	entityToken: string, 
	request: RemoveMatchmakingQueueRequest
): RemoveMatchmakingQueueResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/RemoveMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Use this API to create or update matchmaking queue configurations. The queue 
--- configuration defines the matchmaking rules. The matchmaking service will match 
--- tickets together according to the configured rules. Queue resources are not 
--- spun up by calling this API. Queues are created when the first ticket is submitted. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking-admin/setmatchmakingqueue
function MultiplayerApi.SetMatchmakingQueueAsync(
	entityToken: string, 
	request: SetMatchmakingQueueRequest
): SetMatchmakingQueueResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/SetMatchmakingQueue",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Subscribe to match resource notifications. Match subscriptions have two types; 
--- MatchInvite and MatchTicketStatusChange 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/subscribetomatchmakingresource
function MultiplayerApi.SubscribeToMatchmakingResourceAsync(
	entityToken: string, 
	request: SubscribeToMatchResourceRequest
): SubscribeToMatchResourceResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/SubscribeToMatchmakingResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Unsubscribe from a Match resource's notifications. For MatchInvite, players 
--- are expected to unsubscribe once they can no longer accept invites. For MatchTicketStatusChange, 
--- players are expected to unsusbcribe once the ticket has reached a canceled or 
--- matched state. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/unsubscribefrommatchmakingresource
function MultiplayerApi.UnsubscribeFromMatchmakingResourceAsync(
	entityToken: string, 
	request: UnsubscribeFromMatchResourceRequest
): UnsubscribeFromMatchResourceResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UnsubscribeFromMatchmakingResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build alias and returns the created alias. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildalias
function MultiplayerApi.CreateBuildAliasAsync(
	entityToken: string, 
	request: CreateBuildAliasRequest
): BuildAliasDetailsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build with a custom container and returns information 
--- about the build creation request. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithcustomcontainer
function MultiplayerApi.CreateBuildWithCustomContainerAsync(
	entityToken: string, 
	request: CreateBuildWithCustomContainerRequest
): CreateBuildWithCustomContainerResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateBuildWithCustomContainer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build with a managed container and returns information 
--- about the build creation request. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithmanagedcontainer
function MultiplayerApi.CreateBuildWithManagedContainerAsync(
	entityToken: string, 
	request: CreateBuildWithManagedContainerRequest
): CreateBuildWithManagedContainerResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateBuildWithManagedContainer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build with the game server running as a process 
--- and returns information about the build creation request. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createbuildwithprocessbasedserver
function MultiplayerApi.CreateBuildWithProcessBasedServerAsync(
	entityToken: string, 
	request: CreateBuildWithProcessBasedServerRequest
): CreateBuildWithProcessBasedServerResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateBuildWithProcessBasedServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a remote user to log on to a VM for a multiplayer server build in a 
--- specific region. Returns user credential information necessary to log on. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createremoteuser
function MultiplayerApi.CreateRemoteUserAsync(
	entityToken: string, 
	request: CreateRemoteUserRequest
): CreateRemoteUserResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateRemoteUser",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a request to change a title's multiplayer server quotas. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/createtitlemultiplayerserversquotachange
function MultiplayerApi.CreateTitleMultiplayerServersQuotaChangeAsync(
	entityToken: string, 
	request: CreateTitleMultiplayerServersQuotaChangeRequest
): CreateTitleMultiplayerServersQuotaChangeResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/CreateTitleMultiplayerServersQuotaChange",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a multiplayer server game asset for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deleteasset
function MultiplayerApi.DeleteAssetAsync(
	entityToken: string, 
	request: DeleteAssetRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/DeleteAsset",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a multiplayer server build. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuild
function MultiplayerApi.DeleteBuildAsync(
	entityToken: string, 
	request: DeleteBuildRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/DeleteBuild",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a multiplayer server build alias. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuildalias
function MultiplayerApi.DeleteBuildAliasAsync(
	entityToken: string, 
	request: DeleteBuildAliasRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/DeleteBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes a multiplayer server build's region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletebuildregion
function MultiplayerApi.DeleteBuildRegionAsync(
	entityToken: string, 
	request: DeleteBuildRegionRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/DeleteBuildRegion",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a multiplayer server game certificate. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletecertificate
function MultiplayerApi.DeleteCertificateAsync(
	entityToken: string, 
	request: DeleteCertificateRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/DeleteCertificate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes the specified container image repository. After this operation, a 'docker 
--- pull' will fail for all the tags of the specified image. Morever, ListContainerImages 
--- will not return the specified image. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deletecontainerimagerepository
function MultiplayerApi.DeleteContainerImageRepositoryAsync(
	entityToken: string, 
	request: DeleteContainerImageRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/DeleteContainerImageRepository",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Deletes a remote user to log on to a VM for a multiplayer server build in a 
--- specific region. Returns user credential information necessary to log on. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/deleteremoteuser
function MultiplayerApi.DeleteRemoteUserAsync(
	entityToken: string, 
	request: DeleteRemoteUserRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/DeleteRemoteUser",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Enables the multiplayer server feature for a title and returns the enabled status. 
--- The enabled status can be Initializing, Enabled, and Disabled. It can up to 
--- 20 minutes or more for the title to be enabled for the feature. On average, 
--- it can take up to 20 minutes for the title to be enabled for the feature. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/enablemultiplayerserversfortitle
function MultiplayerApi.EnableMultiplayerServersForTitleAsync(
	entityToken: string, 
	request: EnableMultiplayerServersForTitleRequest
): EnableMultiplayerServersForTitleResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/EnableMultiplayerServersForTitle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a URL that can be used to download the specified asset. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getassetdownloadurl
function MultiplayerApi.GetAssetDownloadUrlAsync(
	entityToken: string, 
	request: GetAssetDownloadUrlRequest
): GetAssetDownloadUrlResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetAssetDownloadUrl",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the URL to upload assets to. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getassetuploadurl
function MultiplayerApi.GetAssetUploadUrlAsync(
	entityToken: string, 
	request: GetAssetUploadUrlRequest
): GetAssetUploadUrlResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetAssetUploadUrl",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns the details about a multiplayer server build. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getbuild
function MultiplayerApi.GetBuildAsync(
	entityToken: string, 
	request: GetBuildRequest
): GetBuildResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetBuild",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns the details about a multiplayer server build alias. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getbuildalias
function MultiplayerApi.GetBuildAliasAsync(
	entityToken: string, 
	request: GetBuildAliasRequest
): BuildAliasDetailsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets credentials to the container registry where game developers can upload 
--- custom container images to before creating a new build. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getcontainerregistrycredentials
function MultiplayerApi.GetContainerRegistryCredentialsAsync(
	entityToken: string, 
	request: GetContainerRegistryCredentialsRequest
): GetContainerRegistryCredentialsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetContainerRegistryCredentials",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets multiplayer server session details for a build in a specific region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayerserverdetails
function MultiplayerApi.GetMultiplayerServerDetailsAsync(
	entityToken: string, 
	request: GetMultiplayerServerDetailsRequest
): GetMultiplayerServerDetailsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetMultiplayerServerDetails",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets multiplayer server logs for a specific server id in a region. The logs 
--- are available only after a server has terminated. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayerserverlogs
function MultiplayerApi.GetMultiplayerServerLogsAsync(
	entityToken: string, 
	request: GetMultiplayerServerLogsRequest
): GetMultiplayerServerLogsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetMultiplayerServerLogs",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets multiplayer server logs for a specific server id in a region. The logs 
--- are available only after a server has terminated. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getmultiplayersessionlogsbysessionid
function MultiplayerApi.GetMultiplayerSessionLogsBySessionIdAsync(
	entityToken: string, 
	request: GetMultiplayerSessionLogsBySessionIdRequest
): GetMultiplayerServerLogsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetMultiplayerSessionLogsBySessionId",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a remote login endpoint to a VM that is hosting a multiplayer server build 
--- in a specific region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/getremoteloginendpoint
function MultiplayerApi.GetRemoteLoginEndpointAsync(
	entityToken: string, 
	request: GetRemoteLoginEndpointRequest
): GetRemoteLoginEndpointResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetRemoteLoginEndpoint",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the status of whether a title is enabled for the multiplayer server feature. 
--- The enabled status can be Initializing, Enabled, and Disabled. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitleenabledformultiplayerserversstatus
function MultiplayerApi.GetTitleEnabledForMultiplayerServersStatusAsync(
	entityToken: string, 
	request: GetTitleEnabledForMultiplayerServersStatusRequest
): GetTitleEnabledForMultiplayerServersStatusResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetTitleEnabledForMultiplayerServersStatus",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets a title's server quota change request. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitlemultiplayerserversquotachange
function MultiplayerApi.GetTitleMultiplayerServersQuotaChangeAsync(
	entityToken: string, 
	request: GetTitleMultiplayerServersQuotaChangeRequest
): GetTitleMultiplayerServersQuotaChangeResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetTitleMultiplayerServersQuotaChange",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets the quotas for a title in relation to multiplayer servers. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/gettitlemultiplayerserversquotas
function MultiplayerApi.GetTitleMultiplayerServersQuotasAsync(
	entityToken: string, 
	request: GetTitleMultiplayerServersQuotasRequest
): GetTitleMultiplayerServersQuotasResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/GetTitleMultiplayerServersQuotas",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of archived multiplayer servers for a build in a specific region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listarchivedmultiplayerservers
function MultiplayerApi.ListArchivedMultiplayerServersAsync(
	entityToken: string, 
	request: ListMultiplayerServersRequest
): ListMultiplayerServersResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListArchivedMultiplayerServers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of multiplayer server game asset summaries for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listassetsummaries
function MultiplayerApi.ListAssetSummariesAsync(
	entityToken: string, 
	request: ListAssetSummariesRequest
): ListAssetSummariesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListAssetSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of summarized details of all multiplayer server builds for a 
--- title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listbuildaliases
function MultiplayerApi.ListBuildAliasesAsync(
	entityToken: string, 
	request: ListBuildAliasesRequest
): ListBuildAliasesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListBuildAliases",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of summarized details of all multiplayer server builds for a 
--- title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listbuildsummariesv2
function MultiplayerApi.ListBuildSummariesV2Async(
	entityToken: string, 
	request: ListBuildSummariesRequest
): ListBuildSummariesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListBuildSummariesV2",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of multiplayer server game certificates for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcertificatesummaries
function MultiplayerApi.ListCertificateSummariesAsync(
	entityToken: string, 
	request: ListCertificateSummariesRequest
): ListCertificateSummariesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListCertificateSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of the tags for a particular container image that exists in the 
--- container registry for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimagetags
function MultiplayerApi.ListContainerImageTagsAsync(
	entityToken: string, 
	request: ListContainerImageTagsRequest
): ListContainerImageTagsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListContainerImageTags",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of the container images that have been uploaded to the container 
--- registry for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listcontainerimages
function MultiplayerApi.ListContainerImagesAsync(
	entityToken: string, 
	request: ListContainerImagesRequest
): ListContainerImagesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListContainerImages",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of multiplayer servers for a build in a specific region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listmultiplayerservers
function MultiplayerApi.ListMultiplayerServersAsync(
	entityToken: string, 
	request: ListMultiplayerServersRequest
): ListMultiplayerServersResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListMultiplayerServers",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of quality of service servers for party. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listpartyqosservers
function MultiplayerApi.ListPartyQosServersAsync(
	request: ListPartyQosServersRequest
): ListPartyQosServersResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListPartyQosServers",
		request,
		nil,
		nil
	)
end

--- Returns a list of quality of service servers for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listqosserversfortitle
function MultiplayerApi.ListQosServersForTitleAsync(
	entityToken: string, 
	request: ListQosServersForTitleRequest
): ListQosServersForTitleResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListQosServersForTitle",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- List all server quota change requests for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listtitlemultiplayerserversquotachanges
function MultiplayerApi.ListTitleMultiplayerServersQuotaChangesAsync(
	entityToken: string, 
	request: ListTitleMultiplayerServersQuotaChangesRequest
): ListTitleMultiplayerServersQuotaChangesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListTitleMultiplayerServersQuotaChanges",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Returns a list of virtual machines for a title. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/listvirtualmachinesummaries
function MultiplayerApi.ListVirtualMachineSummariesAsync(
	entityToken: string, 
	request: ListVirtualMachineSummariesRequest
): ListVirtualMachineSummariesResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ListVirtualMachineSummaries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Requests a multiplayer server session from a particular build in any of the 
--- given preferred regions. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/requestmultiplayerserver
function MultiplayerApi.RequestMultiplayerServerAsync(
	entityToken: string, 
	request: RequestMultiplayerServerRequest
): RequestMultiplayerServerResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/RequestMultiplayerServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Gets new credentials to the container registry where game developers can upload 
--- custom container images to before creating a new build. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/rollovercontainerregistrycredentials
function MultiplayerApi.RolloverContainerRegistryCredentialsAsync(
	entityToken: string, 
	request: RolloverContainerRegistryCredentialsRequest
): RolloverContainerRegistryCredentialsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/RolloverContainerRegistryCredentials",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Executes the shutdown callback from the GSDK and terminates the multiplayer 
--- server session. The callback in the GSDK will allow for graceful shutdown with 
--- a 15 minute timeoutIf graceful shutdown has not been completed before 15 minutes 
--- have elapsed, the multiplayer server session will be forcefully terminated on 
--- it's own. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/shutdownmultiplayerserver
function MultiplayerApi.ShutdownMultiplayerServerAsync(
	entityToken: string, 
	request: ShutdownMultiplayerServerRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/ShutdownMultiplayerServer",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Removes the specified tag from the image. After this operation, a 'docker pull' 
--- will fail for the specified image and tag combination. Morever, ListContainerImageTags 
--- will not return the specified tag. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/untagcontainerimage
function MultiplayerApi.UntagContainerImageAsync(
	entityToken: string, 
	request: UntagContainerImageRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UntagContainerImage",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Creates a multiplayer server build alias and returns the created alias. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildalias
function MultiplayerApi.UpdateBuildAliasAsync(
	entityToken: string, 
	request: UpdateBuildAliasRequest
): BuildAliasDetailsResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UpdateBuildAlias",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates a multiplayer server build's name. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildname
function MultiplayerApi.UpdateBuildNameAsync(
	entityToken: string, 
	request: UpdateBuildNameRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UpdateBuildName",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates a multiplayer server build's region. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregion
function MultiplayerApi.UpdateBuildRegionAsync(
	entityToken: string, 
	request: UpdateBuildRegionRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UpdateBuildRegion",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Updates a multiplayer server build's regions. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/updatebuildregions
function MultiplayerApi.UpdateBuildRegionsAsync(
	entityToken: string, 
	request: UpdateBuildRegionsRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UpdateBuildRegions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- Uploads a multiplayer server game certificate. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/multiplayerserver/uploadcertificate
function MultiplayerApi.UploadCertificateAsync(
	entityToken: string, 
	request: UploadCertificateRequest
): EmptyResponse | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/UploadCertificate",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- SignalR clients make this request to initiate their connection to the PubSubHub 
--- SignalR service. Clients will interpret the response and make a persistent websocket 
--- connection to the service with the details. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/pubsub/negotiate
function MultiplayerApi.NegotiateAsync(
	entityToken: string, 
	request: PubSubNegotiateRequest
): PubSubNegotiateResult | ApiErrorWrapper
	return PlayFabInternal.MakeApiCall(
		"/Multiplayer/Negotiate",
		request,
		"X-EntityToken",
		entityToken
	)
end

return MultiplayerApi

