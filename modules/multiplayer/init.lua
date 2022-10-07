--!strict
--[=[
	# MultiplayerApi

	API methods for managing multiplayer servers. API methods for managing parties. 
	The lobby service helps players group together to play multiplayer games. It 
	is often used as a rendezvous point for players to share connection information. 

	API Version: 1.220926.6
]=]

local PlayFabInternal = require(script.Parent.PlayFabInternal)

local MultiplayerApi = {}

function MultiplayerApi.SetSettings(settings: PlayFabInternal.ISettings)
	PlayFabInternal.SetSettings(settings)
end

export type AccessPolicy = 
	"Public"
	| "Friends"
	| "Private"

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

export type AssetReference = {
	--- The asset's file name. This is a filename with the .zip, .tar, or .tar.gz extension. 
	FileName: string?,
	--- The asset's mount path. 
	MountPath: string?,
}

export type AssetReferenceParams = {
	--- The asset's file name. 
	FileName: string,
	--- The asset's mount path. 
	MountPath: string?,
}

export type AssetSummary = {
	--- The asset's file name. This is a filename with the .zip, .tar, or .tar.gz extension. 
	FileName: string?,
	--- The metadata associated with the asset. 
	Metadata: {[any]: any}?,
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
	--- The guid string alias Id of the alias to be created or updated. 
	AliasId: string?,
	--- The alias name. 
	AliasName: string?,
	--- Array of build selection criteria. 
	BuildSelectionCriteria: {BuildSelectionCriterion}?,
}

export type BuildAliasParams = {
	--- The guid string alias ID to use for the request. 
	AliasId: string,
}

export type BuildRegion = {
	--- The current multiplayer server stats for the region. 
	CurrentServerStats: CurrentServerStats?,
	--- Optional settings to control dynamic adjustment of standby target 
	DynamicStandbySettings: DynamicStandbySettings?,
	--- Whether the game assets provided for the build have been replicated to this 
	--- region. 
	IsAssetReplicationComplete: boolean,
	--- The maximum number of multiplayer servers for the region. 
	MaxServers: number,
	--- Regional override for the number of multiplayer servers to host on a single 
	--- VM of the build. 
	MultiplayerServerCountPerVm: number?,
	--- The build region. 
	Region: string?,
	--- Optional settings to set the standby target to specified values during the supplied 
	--- schedules 
	ScheduledStandbySettings: ScheduledStandbySettings?,
	--- The target number of standby multiplayer servers for the region. 
	StandbyServers: number,
	--- The status of multiplayer servers in the build region. Valid values are - Unknown, 
	--- Initialized, Deploying, Deployed, Unhealthy, Deleting, Deleted. 
	Status: string?,
	--- Regional override for the VM size the build was created on. 
	VmSize: string?,
}

export type BuildRegionParams = {
	--- Optional settings to control dynamic adjustment of standby target. If not specified, 
	--- dynamic standby is disabled 
	DynamicStandbySettings: DynamicStandbySettings?,
	--- The maximum number of multiplayer servers for the region. 
	MaxServers: number,
	--- Regional override for the number of multiplayer servers to host on a single 
	--- VM of the build. 
	MultiplayerServerCountPerVm: number?,
	--- The build region. 
	Region: string,
	--- Optional settings to set the standby target to specified values during the supplied 
	--- schedules 
	ScheduledStandbySettings: ScheduledStandbySettings?,
	--- The number of standby multiplayer servers for the region. 
	StandbyServers: number,
	--- Regional override for the VM size the build was created on. 
	VmSize: string?,
}

export type BuildSelectionCriterion = {
	--- Dictionary of build ids and their respective weights for distribution of allocation 
	--- requests. 
	BuildWeightDistribution: {[any]: any}?,
}

export type BuildSummary = {
	--- The guid string build ID of the build. 
	BuildId: string?,
	--- The build name. 
	BuildName: string?,
	--- The time the build was created in UTC. 
	CreationTime: string?,
	--- The metadata of the build. 
	Metadata: {[any]: any}?,
	--- The configuration and status for each region in the build. 
	RegionConfigurations: {BuildRegion}?,
}

--- Cancels all tickets of which the player is a member in a given queue that are 
--- not cancelled or matched. This API is useful if you lose track of what tickets 
--- the player is a member of (if the title crashes for instance) and want to "reset". 
--- The Entity field is optional if the caller is a player and defaults to that 
--- player. Players may not cancel tickets for other people. The Entity field is 
--- required if the caller is a server (authenticated as the title). 
export type CancelAllMatchmakingTicketsForPlayerRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity key of the player whose tickets should be canceled. 
	Entity: EntityKey?,
	--- The name of the queue from which a player's tickets should be canceled. 
	QueueName: string,
}

export type CancelAllMatchmakingTicketsForPlayerResult = {
}

--- Cancels all backfill tickets of which the player is a member in a given queue 
--- that are not cancelled or matched. This API is useful if you lose track of what 
--- tickets the player is a member of (if the server crashes for instance) and want 
--- to "reset". 
export type CancelAllServerBackfillTicketsForPlayerRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity key of the player whose backfill tickets should be canceled. 
	Entity: EntityKey,
	--- The name of the queue from which a player's backfill tickets should be canceled. 
	QueueName: string,
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
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the queue the ticket is in. 
	QueueName: string,
	--- The Id of the ticket to find a match for. 
	TicketId: string,
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
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the queue the ticket is in. 
	QueueName: string,
	--- The Id of the ticket to find a match for. 
	TicketId: string,
}

export type CancelServerBackfillTicketResult = {
}

export type CancellationReason = 
	"Requested"
	| "Internal"
	| "Timeout"

export type Certificate = {
	--- Base64 encoded string contents of the certificate. 
	Base64EncodedValue: string,
	--- A name for the certificate. This is used to reference certificates in build 
	--- configurations. 
	Name: string,
	--- If required for your PFX certificate, use this field to provide a password that 
	--- will be used to install the certificate on the container. 
	Password: string?,
}

export type CertificateSummary = {
	--- The name of the certificate. 
	Name: string?,
	--- The thumbprint for the certificate. 
	Thumbprint: string?,
}

export type ConnectedPlayer = {
	--- The player ID of the player connected to the multiplayer server. 
	PlayerId: string?,
}

export type ContainerFlavor = 
	"ManagedWindowsServerCore"
	| "CustomLinux"
	| "ManagedWindowsServerCorePreview"
	| "Invalid"

export type ContainerImageReference = {
	--- The container image name. 
	ImageName: string,
	--- The container tag. 
	Tag: string?,
}

export type CoreCapacity = {
	--- The available core capacity for the (Region, VmFamily) 
	Available: number,
	--- The AzureRegion 
	Region: string?,
	--- The total core capacity for the (Region, VmFamily) 
	Total: number,
	--- The AzureVmFamily 
	VmFamily: string?,
}

export type CoreCapacityChange = {
	--- New quota core limit for the given vm family/region. 
	NewCoreLimit: number,
	--- Region to change. 
	Region: string,
	--- Virtual machine family to change. 
	VmFamily: string,
}

--- Creates a multiplayer server build alias and returns the created alias. 
export type CreateBuildAliasRequest = {
	--- The alias name. 
	AliasName: string,
	--- Array of build selection criteria. 
	BuildSelectionCriteria: {BuildSelectionCriterion}?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

--- Creates a multiplayer server build with a custom container and returns information 
--- about the build creation request. 
export type CreateBuildWithCustomContainerRequest = {
	--- When true, assets will not be copied for each server inside the VM. All serverswill 
	--- run from the same set of assets, or will have the same assets mounted in the 
	--- container. 
	AreAssetsReadonly: boolean?,
	--- The build name. 
	BuildName: string,
	--- The flavor of container to create a build from. 
	ContainerFlavor: string?,
	--- The container reference, consisting of the image name and tag. 
	ContainerImageReference: ContainerImageReference?,
	--- The container command to run when the multiplayer server has been allocated, 
	--- including any arguments. 
	ContainerRunCommand: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The list of game assets related to the build. 
	GameAssetReferences: {AssetReferenceParams}?,
	--- The game certificates for the build. 
	GameCertificateReferences: {GameCertificateReferenceParams}?,
	--- The Linux instrumentation configuration for the build. 
	LinuxInstrumentationConfiguration: LinuxInstrumentationConfiguration?,
	--- Metadata to tag the build. The keys are case insensitive. The build metadata 
	--- is made available to the server through Game Server SDK (GSDK).Constraints: 
	--- Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100 
	Metadata: {[any]: any}?,
	--- The configuration for the monitoring application on the build 
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?,
	--- The number of multiplayer servers to host on a single VM. 
	MultiplayerServerCountPerVm: number,
	--- The ports to map the build on. 
	Ports: {Port},
	--- The region configurations for the build. 
	RegionConfigurations: {BuildRegionParams},
	--- The resource constraints to apply to each server on the VM (EXPERIMENTAL API) 
	ServerResourceConstraints: ServerResourceConstraintParams?,
	--- When true, assets will be downloaded and uncompressed in memory, without the 
	--- compressedversion being written first to disc. 
	UseStreamingForAssetDownloads: boolean?,
	--- The VM size to create the build on. 
	VmSize: string?,
}

export type CreateBuildWithCustomContainerResponse = {
	--- When true, assets will not be copied for each server inside the VM. All serverswill 
	--- run from the same set of assets, or will have the same assets mounted in the 
	--- container. 
	AreAssetsReadonly: boolean?,
	--- The guid string build ID. Must be unique for every build. 
	BuildId: string?,
	--- The build name. 
	BuildName: string?,
	--- The flavor of container of the build. 
	ContainerFlavor: string?,
	--- The container command to run when the multiplayer server has been allocated, 
	--- including any arguments. 
	ContainerRunCommand: string?,
	--- The time the build was created in UTC. 
	CreationTime: string?,
	--- The custom game container image reference information. 
	CustomGameContainerImage: ContainerImageReference?,
	--- The game assets for the build. 
	GameAssetReferences: {AssetReference}?,
	--- The game certificates for the build. 
	GameCertificateReferences: {GameCertificateReference}?,
	--- The Linux instrumentation configuration for this build. 
	LinuxInstrumentationConfiguration: LinuxInstrumentationConfiguration?,
	--- The metadata of the build. 
	Metadata: {[any]: any}?,
	--- The configuration for the monitoring application for the build 
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?,
	--- The number of multiplayer servers to host on a single VM of the build. 
	MultiplayerServerCountPerVm: number,
	--- The OS platform used for running the game process. 
	OsPlatform: string?,
	--- The ports the build is mapped on. 
	Ports: {Port}?,
	--- The region configuration for the build. 
	RegionConfigurations: {BuildRegion}?,
	--- The resource constraints to apply to each server on the VM (EXPERIMENTAL API) 
	ServerResourceConstraints: ServerResourceConstraintParams?,
	--- The type of game server being hosted. 
	ServerType: string?,
	--- When true, assets will be downloaded and uncompressed in memory, without the 
	--- compressedversion being written first to disc. 
	UseStreamingForAssetDownloads: boolean?,
	--- The VM size the build was created on. 
	VmSize: string?,
}

--- Creates a multiplayer server build with a managed container and returns information 
--- about the build creation request. 
export type CreateBuildWithManagedContainerRequest = {
	--- When true, assets will not be copied for each server inside the VM. All serverswill 
	--- run from the same set of assets, or will have the same assets mounted in the 
	--- container. 
	AreAssetsReadonly: boolean?,
	--- The build name. 
	BuildName: string,
	--- The flavor of container to create a build from. 
	ContainerFlavor: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The list of game assets related to the build. 
	GameAssetReferences: {AssetReferenceParams},
	--- The game certificates for the build. 
	GameCertificateReferences: {GameCertificateReferenceParams}?,
	--- The directory containing the game executable. This would be the start path of 
	--- the game assets that contain the main game server executable. If not provided, 
	--- a best effort will be made to extract it from the start game command. 
	GameWorkingDirectory: string?,
	--- The instrumentation configuration for the build. 
	InstrumentationConfiguration: InstrumentationConfiguration?,
	--- Metadata to tag the build. The keys are case insensitive. The build metadata 
	--- is made available to the server through Game Server SDK (GSDK).Constraints: 
	--- Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100 
	Metadata: {[any]: any}?,
	--- The configuration for the monitoring application on the build 
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?,
	--- The number of multiplayer servers to host on a single VM. 
	MultiplayerServerCountPerVm: number,
	--- The ports to map the build on. 
	Ports: {Port},
	--- The region configurations for the build. 
	RegionConfigurations: {BuildRegionParams},
	--- The resource constraints to apply to each server on the VM (EXPERIMENTAL API) 
	ServerResourceConstraints: ServerResourceConstraintParams?,
	--- The command to run when the multiplayer server is started, including any arguments. 
	StartMultiplayerServerCommand: string,
	--- When true, assets will be downloaded and uncompressed in memory, without the 
	--- compressedversion being written first to disc. 
	UseStreamingForAssetDownloads: boolean?,
	--- The VM size to create the build on. 
	VmSize: string?,
	--- The crash dump configuration for the build. 
	WindowsCrashDumpConfiguration: WindowsCrashDumpConfiguration?,
}

export type CreateBuildWithManagedContainerResponse = {
	--- When true, assets will not be copied for each server inside the VM. All serverswill 
	--- run from the same set of assets, or will have the same assets mounted in the 
	--- container. 
	AreAssetsReadonly: boolean?,
	--- The guid string build ID. Must be unique for every build. 
	BuildId: string?,
	--- The build name. 
	BuildName: string?,
	--- The flavor of container of the build. 
	ContainerFlavor: string?,
	--- The time the build was created in UTC. 
	CreationTime: string?,
	--- The game assets for the build. 
	GameAssetReferences: {AssetReference}?,
	--- The game certificates for the build. 
	GameCertificateReferences: {GameCertificateReference}?,
	--- The directory containing the game executable. This would be the start path of 
	--- the game assets that contain the main game server executable. If not provided, 
	--- a best effort will be made to extract it from the start game command. 
	GameWorkingDirectory: string?,
	--- The instrumentation configuration for this build. 
	InstrumentationConfiguration: InstrumentationConfiguration?,
	--- The metadata of the build. 
	Metadata: {[any]: any}?,
	--- The configuration for the monitoring application for the build 
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?,
	--- The number of multiplayer servers to host on a single VM of the build. 
	MultiplayerServerCountPerVm: number,
	--- The OS platform used for running the game process. 
	OsPlatform: string?,
	--- The ports the build is mapped on. 
	Ports: {Port}?,
	--- The region configuration for the build. 
	RegionConfigurations: {BuildRegion}?,
	--- The resource constraints to apply to each server on the VM (EXPERIMENTAL API) 
	ServerResourceConstraints: ServerResourceConstraintParams?,
	--- The type of game server being hosted. 
	ServerType: string?,
	--- The command to run when the multiplayer server has been allocated, including 
	--- any arguments. 
	StartMultiplayerServerCommand: string?,
	--- When true, assets will be downloaded and uncompressed in memory, without the 
	--- compressedversion being written first to disc. 
	UseStreamingForAssetDownloads: boolean?,
	--- The VM size the build was created on. 
	VmSize: string?,
}

--- Creates a multiplayer server build with the game server running as a process 
--- and returns information about the build creation request. 
export type CreateBuildWithProcessBasedServerRequest = {
	--- When true, assets will not be copied for each server inside the VM. All serverswill 
	--- run from the same set of assets, or will have the same assets mounted in the 
	--- container. 
	AreAssetsReadonly: boolean?,
	--- The build name. 
	BuildName: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The list of game assets related to the build. 
	GameAssetReferences: {AssetReferenceParams},
	--- The game certificates for the build. 
	GameCertificateReferences: {GameCertificateReferenceParams}?,
	--- The working directory for the game process. If this is not provided, the working 
	--- directory will be set based on the mount path of the game server executable. 
	GameWorkingDirectory: string?,
	--- The instrumentation configuration for the build. 
	InstrumentationConfiguration: InstrumentationConfiguration?,
	--- Indicates whether this build will be created using the OS Preview versionPreview 
	--- OS is recommended for dev builds to detect any breaking changes before they 
	--- are released to retail. Retail builds should set this value to false. 
	IsOSPreview: boolean?,
	--- Metadata to tag the build. The keys are case insensitive. The build metadata 
	--- is made available to the server through Game Server SDK (GSDK).Constraints: 
	--- Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100 
	Metadata: {[any]: any}?,
	--- The configuration for the monitoring application on the build 
	MonitoringApplicationConfiguration: MonitoringApplicationConfigurationParams?,
	--- The number of multiplayer servers to host on a single VM. 
	MultiplayerServerCountPerVm: number,
	--- The OS platform used for running the game process. 
	OsPlatform: string?,
	--- The ports to map the build on. 
	Ports: {Port},
	--- The region configurations for the build. 
	RegionConfigurations: {BuildRegionParams},
	--- The command to run when the multiplayer server is started, including any arguments. 
	--- The path to any executable should be relative to the root asset folder when 
	--- unzipped. 
	StartMultiplayerServerCommand: string,
	--- When true, assets will be downloaded and uncompressed in memory, without the 
	--- compressedversion being written first to disc. 
	UseStreamingForAssetDownloads: boolean?,
	--- The VM size to create the build on. 
	VmSize: string?,
}

export type CreateBuildWithProcessBasedServerResponse = {
	--- When true, assets will not be copied for each server inside the VM. All serverswill 
	--- run from the same set of assets, or will have the same assets mounted in the 
	--- container. 
	AreAssetsReadonly: boolean?,
	--- The guid string build ID. Must be unique for every build. 
	BuildId: string?,
	--- The build name. 
	BuildName: string?,
	--- The flavor of container of the build. 
	ContainerFlavor: string?,
	--- The time the build was created in UTC. 
	CreationTime: string?,
	--- The game assets for the build. 
	GameAssetReferences: {AssetReference}?,
	--- The game certificates for the build. 
	GameCertificateReferences: {GameCertificateReference}?,
	--- The working directory for the game process. If this is not provided, the working 
	--- directory will be set based on the mount path of the game server executable. 
	GameWorkingDirectory: string?,
	--- The instrumentation configuration for this build. 
	InstrumentationConfiguration: InstrumentationConfiguration?,
	--- Indicates whether this build will be created using the OS Preview versionPreview 
	--- OS is recommended for dev builds to detect any breaking changes before they 
	--- are released to retail. Retail builds should set this value to false. 
	IsOSPreview: boolean?,
	--- The metadata of the build. 
	Metadata: {[any]: any}?,
	--- The configuration for the monitoring application for the build 
	MonitoringApplicationConfiguration: MonitoringApplicationConfiguration?,
	--- The number of multiplayer servers to host on a single VM of the build. 
	MultiplayerServerCountPerVm: number,
	--- The OS platform used for running the game process. 
	OsPlatform: string?,
	--- The ports the build is mapped on. 
	Ports: {Port}?,
	--- The region configuration for the build. 
	RegionConfigurations: {BuildRegion}?,
	--- The type of game server being hosted. 
	ServerType: string?,
	--- The command to run when the multiplayer server is started, including any arguments. 
	--- The path to any executable is relative to the root asset folder when unzipped. 
	StartMultiplayerServerCommand: string?,
	--- When true, assets will be downloaded and uncompressed in memory, without the 
	--- compressedversion being written first to disc. 
	UseStreamingForAssetDownloads: boolean?,
	--- The VM size the build was created on. 
	VmSize: string?,
}

--- Request to create a lobby. A Server or client can create a lobby. 
export type CreateLobbyRequest = {
	--- The policy indicating who is allowed to join the lobby, and the visibility to 
	--- queries. May be 'Public', 'Friends' or 'Private'. Public means the lobby is 
	--- both visible in queries and any player may join, including invited players. 
	--- Friends means that users who are bidirectional friends of members in the lobby 
	--- may search to find friend lobbies, to retrieve its connection string. Private 
	--- means the lobby is not visible in queries, and a player must receive an invitation 
	--- to join. Defaults to 'Public' on creation. Can only be changed by the lobby 
	--- owner. 
	AccessPolicy: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The private key-value pairs which are only visible to members of the lobby. 
	--- At most 30 key-value pairs may be stored here, keys are limited to 30 characters 
	--- and values to 1000. The total size of all lobbyData values may not exceed 4096 
	--- bytes. Keys are case sensitive. 
	LobbyData: {[any]: any}?,
	--- The maximum number of players allowed in the lobby. The value must be between 
	--- 2 and 128. 
	MaxPlayers: number,
	--- The member initially added to the lobby. Client must specify exactly one member, 
	--- which is the creator's entity and member data. Member PubSubConnectionHandle 
	--- must be null or empty. Game servers must not specify any members. 
	Members: {Member}?,
	--- The lobby owner. Must be the calling entity. 
	Owner: EntityKey,
	--- The policy for how a new owner is chosen. May be 'Automatic', 'Manual' or 'None'. 
	--- Can only be specified by clients. If client-owned and 'Automatic' - The Lobby 
	--- service will automatically assign another connected owner when the current owner 
	--- leaves or disconnects. The useConnections property must be true. If client - 
	--- owned and 'Manual' - Ownership is protected as long as the current owner is 
	--- connected. If the current owner leaves or disconnects any member may set themselves 
	--- as the current owner. The useConnections property must be true. If client-owned 
	--- and 'None' - Any member can set ownership. The useConnections property can be 
	--- either true or false. 
	OwnerMigrationPolicy: string?,
	--- The public key-value pairs which allow queries to differentiate between lobbies. 
	--- Queries will refer to these key-value pairs in their filter and order by clauses 
	--- to retrieve lobbies fitting the specified criteria. At most 30 key-value pairs 
	--- may be stored here. Keys are of the format string_key1, string_key2 ... string_key30 
	--- for string values, or number_key1, number_key2, ... number_key30 for numeric 
	--- values.Numeric values are floats. Values can be at most 256 characters long. 
	--- The total size of all searchData values may not exceed 1024 bytes. 
	SearchData: {[any]: any}?,
	--- A setting to control whether connections are used. Defaults to true. When true, 
	--- notifications are sent to subscribed players, disconnect detection removes connectionHandles, 
	--- only owner migration policies using connections are allowed, and lobbies must 
	--- have at least one connected member to be searchable or be a server hosted lobby 
	--- with a connected server. If false, then notifications are not sent, connections 
	--- are not allowed, and lobbies do not need connections to be searchable. 
	UseConnections: boolean,
}

export type CreateLobbyResult = {
	--- A field which indicates which lobby the user will be joining. 
	ConnectionString: string,
	--- Id to uniquely identify a lobby. 
	LobbyId: string,
}

--- The client specifies the creator's attributes and optionally a list of other 
--- users to match with. 
export type CreateMatchmakingTicketRequest = {
	--- The User who created this ticket. 
	Creator: MatchmakingPlayer,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- How long to attempt matching this ticket in seconds. 
	GiveUpAfterSeconds: number,
	--- A list of Entity Keys of other users to match with. 
	MembersToMatchWith: {EntityKey}?,
	--- The Id of a match queue. 
	QueueName: string,
}

export type CreateMatchmakingTicketResult = {
	--- The Id of the ticket to find a match for. 
	TicketId: string,
}

--- Creates a remote user to log on to a VM for a multiplayer server build in a 
--- specific region. Returns user credential information necessary to log on. 
export type CreateRemoteUserRequest = {
	--- The guid string build ID of to create the remote user for. 
	BuildId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The expiration time for the remote user created. Defaults to expiring in one 
	--- day if not specified. 
	ExpirationTime: string?,
	--- The region of virtual machine to create the remote user for. 
	Region: string,
	--- The username to create the remote user with. 
	Username: string,
	--- The virtual machine ID the multiplayer server is located on. 
	VmId: string,
}

export type CreateRemoteUserResponse = {
	--- The expiration time for the remote user created. 
	ExpirationTime: string?,
	--- The generated password for the remote user that was created. 
	Password: string?,
	--- The username for the remote user that was created. 
	Username: string?,
}

--- The server specifies all the members, their teams and their attributes, and 
--- the server details if applicable. 
export type CreateServerBackfillTicketRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- How long to attempt matching this ticket in seconds. 
	GiveUpAfterSeconds: number,
	--- The users who will be part of this ticket, along with their team assignments. 
	Members: {MatchmakingPlayerWithTeamAssignment},
	--- The Id of a match queue. 
	QueueName: string,
	--- The details of the server the members are connected to. 
	ServerDetails: ServerDetails?,
}

export type CreateServerBackfillTicketResult = {
	--- The Id of the ticket to find a match for. 
	TicketId: string,
}

--- The server specifies all the members and their attributes. 
export type CreateServerMatchmakingTicketRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- How long to attempt matching this ticket in seconds. 
	GiveUpAfterSeconds: number,
	--- The users who will be part of this ticket. 
	Members: {MatchmakingPlayer},
	--- The Id of a match queue. 
	QueueName: string,
}

--- Creates a request to change a title's multiplayer server quotas. 
export type CreateTitleMultiplayerServersQuotaChangeRequest = {
	--- A brief description of the requested changes. 
	ChangeDescription: string?,
	--- Changes to make to the titles cores quota. 
	Changes: {CoreCapacityChange},
	--- Email to be contacted by our team about this request. Only required when a request 
	--- is not approved. 
	ContactEmail: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Additional information about this request that our team can use to better understand 
	--- the requirements. 
	Notes: string?,
	--- When these changes would need to be in effect. Only required when a request 
	--- is not approved. 
	StartDate: string?,
}

export type CreateTitleMultiplayerServersQuotaChangeResponse = {
	--- Id of the change request that was created. 
	RequestId: string?,
	--- Determines if the request was approved or not. When false, our team is reviewing 
	--- and may respond within 2 business days. 
	WasApproved: boolean,
}

export type CurrentServerStats = {
	--- The number of active multiplayer servers. 
	Active: number,
	--- The number of multiplayer servers still downloading game resources (such as 
	--- assets). 
	Propping: number,
	--- The number of standingby multiplayer servers. 
	StandingBy: number,
	--- The total number of multiplayer servers. 
	Total: number,
}

export type CustomDifferenceRuleExpansion = {
	--- Manually specify the values to use for each expansion interval (this overrides 
	--- Difference, Delta, and MaxDifference). 
	DifferenceOverrides: {OverrideDouble},
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type CustomRegionSelectionRuleExpansion = {
	--- Manually specify the maximum latency to use for each expansion interval. 
	MaxLatencyOverrides: {OverrideUnsignedInt},
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type CustomSetIntersectionRuleExpansion = {
	--- Manually specify the values to use for each expansion interval. 
	MinIntersectionSizeOverrides: {OverrideUnsignedInt},
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type CustomTeamDifferenceRuleExpansion = {
	--- Manually specify the team difference value to use for each expansion interval. 
	DifferenceOverrides: {OverrideDouble},
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type CustomTeamSizeBalanceRuleExpansion = {
	--- Manually specify the team size difference to use for each expansion interval. 
	DifferenceOverrides: {OverrideUnsignedInt},
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

--- Deletes a multiplayer server game asset for a title. 
export type DeleteAssetRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The filename of the asset to delete. 
	FileName: string,
}

--- Deletes a multiplayer server build alias. 
export type DeleteBuildAliasRequest = {
	--- The guid string alias ID of the alias to perform the action on. 
	AliasId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

--- Removes a multiplayer server build's region. 
export type DeleteBuildRegionRequest = {
	--- The guid string ID of the build we want to update regions for. 
	BuildId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The build region to delete. 
	Region: string,
}

--- Deletes a multiplayer server build. 
export type DeleteBuildRequest = {
	--- The guid string build ID of the build to delete. 
	BuildId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

--- Deletes a multiplayer server game certificate. 
export type DeleteCertificateRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the certificate. 
	Name: string,
}

--- Removes the specified container image repository. After this operation, a 'docker 
--- pull' will fail for all the tags of the specified image. Morever, ListContainerImages 
--- will not return the specified image. 
export type DeleteContainerImageRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The container image repository we want to delete. 
	ImageName: string?,
}

--- Request to delete a lobby. Only servers can delete lobbies. 
export type DeleteLobbyRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The id of the lobby. 
	LobbyId: string?,
}

--- Deletes a remote user to log on to a VM for a multiplayer server build in a 
--- specific region. Returns user credential information necessary to log on. 
export type DeleteRemoteUserRequest = {
	--- The guid string build ID of the multiplayer server where the remote user is 
	--- to delete. 
	BuildId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The region of the multiplayer server where the remote user is to delete. 
	Region: string,
	--- The username of the remote user to delete. 
	Username: string,
	--- The virtual machine ID the multiplayer server is located on. 
	VmId: string,
}

export type DifferenceRule = {
	--- Description of the attribute used by this rule to match tickets. 
	Attribute: QueueRuleAttribute,
	--- Describes the behavior when an attribute is not specified in the ticket creation 
	--- request or in the user's entity profile. 
	AttributeNotSpecifiedBehavior: string,
	--- Collection of fields relating to expanding this rule at set intervals. Only 
	--- one expansion can be set per rule. When this is set, Difference is ignored. 
	CustomExpansion: CustomDifferenceRuleExpansion?,
	--- The default value assigned to tickets that are missing the attribute specified 
	--- by AttributePath (assuming that AttributeNotSpecifiedBehavior is false). Optional. 
	DefaultAttributeValue: number?,
	--- The allowed difference between any two tickets at the start of matchmaking. 
	Difference: number,
	--- Collection of fields relating to expanding this rule at set intervals. Only 
	--- one expansion can be set per rule. 
	LinearExpansion: LinearDifferenceRuleExpansion?,
	--- How values are treated when there are multiple players in a single ticket. 
	MergeFunction: string,
	--- Friendly name chosen by developer. 
	Name: string,
	--- How many seconds before this rule is no longer enforced (but tickets that comply 
	--- with this rule will still be prioritized over those that don't). Leave blank 
	--- if this rule is always enforced. 
	SecondsUntilOptional: number?,
	--- The relative weight of this rule compared to others. 
	Weight: number,
}

export type DynamicStandbySettings = {
	--- List of auto standing by trigger values and corresponding standing by multiplier. 
	--- Defaults to 1.5X at 50%, 3X at 25%, and 4X at 5% 
	DynamicFloorMultiplierThresholds: {DynamicStandbyThreshold}?,
	--- When true, dynamic standby will be enabled 
	IsEnabled: boolean,
	--- The time it takes to reduce target standing by to configured floor value after 
	--- an increase. Defaults to 30 minutes 
	RampDownSeconds: number?,
}

export type DynamicStandbyThreshold = {
	--- When the trigger threshold is reached, multiply by this value 
	Multiplier: number,
	--- The multiplier will be applied when the actual standby divided by target standby 
	--- floor is less than this value 
	TriggerThresholdPercentage: number,
}

export type EmptyResponse = {
}

--- Enables the multiplayer server feature for a title and returns the enabled status. 
--- The enabled status can be Initializing, Enabled, and Disabled. It can up to 
--- 20 minutes or more for the title to be enabled for the feature. On average, 
--- it can take up to 20 minutes for the title to be enabled for the feature. 
export type EnableMultiplayerServersForTitleRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type EnableMultiplayerServersForTitleResponse = {
	--- The enabled status for the multiplayer server features for the title. 
	Status: string?,
}

--- Combined entity type and ID structure which uniquely identifies a single entity. 
export type EntityKey = {
	--- Unique ID of the entity. 
	Id: string,
	--- Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types 
	Type: string?,
}

--- Request to find friends lobbies. Only a client can find friend lobbies. 
export type FindFriendLobbiesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Controls whether this query should link to friends made on the Facebook network. 
	--- Defaults to false 
	ExcludeFacebookFriends: boolean,
	--- Controls whether this query should link to friends made on the Steam network. 
	--- Defaults to false 
	ExcludeSteamFriends: boolean,
	--- OData style string that contains one or more filters. Only the following operators 
	--- are supported: "and" (logical and), "eq" (equal), "ne" (not equals), "ge" (greater 
	--- than or equal), "gt" (greater than), "le" (less than or equal), and "lt" (less 
	--- than). The left-hand side of each OData logical expression should be either 
	--- a search property key (e.g. string_key1, number_key3, etc) or one of the pre-defined 
	--- search keys all of which must be prefixed by "lobby/": lobby/memberCount (number 
	--- of players in a lobby), lobby/maxMemberCount (maximum number of players allowed 
	--- in a lobby), lobby/membershipLock (must equal 'Unlocked' or 'Locked'), lobby/amOwner 
	--- (required to equal "true"), lobby/amMember (required to equal "true"). 
	Filter: string?,
	--- OData style string that contains sorting for this query in either ascending 
	--- ("asc") or descending ("desc") order. OrderBy clauses are of the form "number_key1 
	--- asc" or the pre-defined search key "lobby/memberCount asc" and "lobby/maxMemberCount 
	--- desc". To sort by closest, a moniker `distance{number_key1 = 5}` can be used 
	--- to sort by distance from the given number. This field only supports either one 
	--- sort clause or one distance clause. 
	OrderBy: string?,
	--- Request pagination information. 
	Pagination: PaginationRequest?,
	--- Xbox token if Xbox friends should be included. Requires Xbox be configured on 
	--- PlayFab. 
	XboxToken: string?,
}

export type FindFriendLobbiesResult = {
	--- Array of lobbies found that matched FindFriendLobbies request. 
	Lobbies: {FriendLobbySummary},
	--- Pagination response for FindFriendLobbies request. 
	Pagination: PaginationResponse,
}

--- Request to find lobbies. 
export type FindLobbiesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- OData style string that contains one or more filters. Only the following operators 
	--- are supported: "and" (logical and), "eq" (equal), "ne" (not equals), "ge" (greater 
	--- than or equal), "gt" (greater than), "le" (less than or equal), and "lt" (less 
	--- than). The left-hand side of each OData logical expression should be either 
	--- a search property key (e.g. string_key1, number_key3, etc) or one of the pre-defined 
	--- search keys all of which must be prefixed by "lobby/": lobby/memberCount (number 
	--- of players in a lobby), lobby/maxMemberCount (maximum number of players allowed 
	--- in a lobby), lobby/membershipLock (must equal 'Unlocked' or 'Locked'), lobby/amOwner 
	--- (required to equal "true"), lobby/amMember (required to equal "true"). 
	Filter: string?,
	--- OData style string that contains sorting for this query in either ascending 
	--- ("asc") or descending ("desc") order. OrderBy clauses are of the form "number_key1 
	--- asc" or the pre-defined search key "lobby/memberCount asc" and "lobby/maxMemberCount 
	--- desc". To sort by closest, a moniker `distance{number_key1 = 5}` can be used 
	--- to sort by distance from the given number. This field only supports either one 
	--- sort clause or one distance clause. 
	OrderBy: string?,
	--- Request pagination information. 
	Pagination: PaginationRequest?,
}

export type FindLobbiesResult = {
	--- Array of lobbies found that matched FindLobbies request. 
	Lobbies: {LobbySummary},
	--- Pagination response for FindLobbies request. 
	Pagination: PaginationResponse,
}

export type FriendLobbySummary = {
	--- A string used to join the lobby.This field is populated by the Lobby service.Invites 
	--- are performed by communicating this connectionString to other players. 
	ConnectionString: string,
	--- The current number of players in the lobby. 
	CurrentPlayers: number,
	--- Friends in Lobby. 
	Friends: {EntityKey}?,
	--- Id to uniquely identify a lobby. 
	LobbyId: string,
	--- The maximum number of players allowed in the lobby. 
	MaxPlayers: number,
	--- A setting indicating whether members are allowed to join this lobby. When Locked 
	--- new members are prevented from joining. 
	MembershipLock: string?,
	--- The client or server entity which owns this lobby. 
	Owner: EntityKey,
	--- Search data. 
	SearchData: {[any]: any}?,
}

export type GameCertificateReference = {
	--- An alias for the game certificate. The game server will reference this alias 
	--- via GSDK config to retrieve the game certificate. This alias is used as an identifier 
	--- in game server code to allow a new certificate with different Name field to 
	--- be uploaded without the need to change any game server code to reference the 
	--- new Name. 
	GsdkAlias: string?,
	--- The name of the game certificate. This name should match the name of a certificate 
	--- that was previously uploaded to this title. 
	Name: string?,
}

export type GameCertificateReferenceParams = {
	--- An alias for the game certificate. The game server will reference this alias 
	--- via GSDK config to retrieve the game certificate. This alias is used as an identifier 
	--- in game server code to allow a new certificate with different Name field to 
	--- be uploaded without the need to change any game server code to reference the 
	--- new Name. 
	GsdkAlias: string,
	--- The name of the game certificate. This name should match the name of a certificate 
	--- that was previously uploaded to this title. 
	Name: string,
}

--- Gets a URL that can be used to download the specified asset. 
export type GetAssetDownloadUrlRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The asset's file name to get the download URL for. 
	FileName: string,
}

export type GetAssetDownloadUrlResponse = {
	--- The asset's download URL. 
	AssetDownloadUrl: string?,
	--- The asset's file name to get the download URL for. 
	FileName: string?,
}

--- Gets the URL to upload assets to. 
export type GetAssetUploadUrlRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The asset's file name to get the upload URL for. 
	FileName: string,
}

export type GetAssetUploadUrlResponse = {
	--- The asset's upload URL. 
	AssetUploadUrl: string?,
	--- The asset's file name to get the upload URL for. 
	FileName: string?,
}

--- Returns the details about a multiplayer server build alias. 
export type GetBuildAliasRequest = {
	--- The guid string alias ID of the alias to perform the action on. 
	AliasId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

--- Returns the details about a multiplayer server build. 
export type GetBuildRequest = {
	--- The guid string build ID of the build to get. 
	BuildId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetBuildResponse = {
	--- When true, assets will not be copied for each server inside the VM. All serverswill 
	--- run from the same set of assets, or will have the same assets mounted in the 
	--- container. 
	AreAssetsReadonly: boolean?,
	--- The guid string build ID of the build. 
	BuildId: string?,
	--- The build name. 
	BuildName: string?,
	--- The current build status. Valid values are - Deploying, Deployed, DeletingRegion, 
	--- Unhealthy. 
	BuildStatus: string?,
	--- The flavor of container of he build. 
	ContainerFlavor: string?,
	--- The container command to run when the multiplayer server has been allocated, 
	--- including any arguments. This only applies to custom builds. If the build is 
	--- a managed build, this field will be null. 
	ContainerRunCommand: string?,
	--- The time the build was created in UTC. 
	CreationTime: string?,
	--- The custom game container image for a custom build. 
	CustomGameContainerImage: ContainerImageReference?,
	--- The game assets for the build. 
	GameAssetReferences: {AssetReference}?,
	--- The game certificates for the build. 
	GameCertificateReferences: {GameCertificateReference}?,
	--- The instrumentation configuration of the build. 
	InstrumentationConfiguration: InstrumentationConfiguration?,
	--- Metadata of the build. The keys are case insensitive. The build metadata is 
	--- made available to the server through Game Server SDK (GSDK). 
	Metadata: {[any]: any}?,
	--- The number of multiplayer servers to hosted on a single VM of the build. 
	MultiplayerServerCountPerVm: number,
	--- The OS platform used for running the game process. 
	OsPlatform: string?,
	--- The ports the build is mapped on. 
	Ports: {Port}?,
	--- The region configuration for the build. 
	RegionConfigurations: {BuildRegion}?,
	--- The resource constraints to apply to each server on the VM. 
	ServerResourceConstraints: ServerResourceConstraintParams?,
	--- The type of game server being hosted. 
	ServerType: string?,
	--- The command to run when the multiplayer server has been allocated, including 
	--- any arguments. This only applies to managed builds. If the build is a custom 
	--- build, this field will be null. 
	StartMultiplayerServerCommand: string?,
	--- The VM size the build was created on. 
	VmSize: string?,
}

--- Gets credentials to the container registry where game developers can upload 
--- custom container images to before creating a new build. 
export type GetContainerRegistryCredentialsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetContainerRegistryCredentialsResponse = {
	--- The url of the container registry. 
	DnsName: string?,
	--- The password for accessing the container registry. 
	Password: string?,
	--- The username for accessing the container registry. 
	Username: string?,
}

--- Request to get a lobby. 
export type GetLobbyRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The id of the lobby. 
	LobbyId: string?,
}

export type GetLobbyResult = {
	--- The information pertaining to the requested lobby. 
	Lobby: Lobby,
}

--- When matchmaking has successfully matched together a collection of tickets, 
--- it produces a 'match' with an Id. The match contains all of the players that 
--- were matched together, and their team assigments. Only servers and ticket members 
--- can get the match. 
export type GetMatchRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Determines whether the matchmaking attributes will be returned as an escaped 
	--- JSON string or as an un-escaped JSON object. 
	EscapeObject: boolean,
	--- The Id of a match. 
	MatchId: string,
	--- The name of the queue to join. 
	QueueName: string,
	--- Determines whether the matchmaking attributes for each user should be returned 
	--- in the response for match request. 
	ReturnMemberAttributes: boolean,
}

export type GetMatchResult = {
	--- A string that is used by players that are matched together to join an arranged 
	--- lobby. 
	ArrangementString: string?,
	--- The Id of a match. 
	MatchId: string,
	--- A list of Users that are matched together, along with their team assignments. 
	Members: {MatchmakingPlayerWithTeamAssignment},
	--- A list of regions that the match could be played in sorted by preference. This 
	--- value is only set if the queue has a region selection rule. 
	RegionPreferences: {any}?,
	--- The details of the server that the match has been allocated to. 
	ServerDetails: ServerDetails?,
}

--- Gets the current configuration for a queue. 
export type GetMatchmakingQueueRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The Id of the matchmaking queue to retrieve. 
	QueueName: string?,
}

export type GetMatchmakingQueueResult = {
	--- The matchmaking queue config. 
	MatchmakingQueue: MatchmakingQueueConfig?,
}

--- The ticket includes the invited players, their attributes if they have joined, 
--- the ticket status, the match Id when applicable, etc. Only servers, the ticket 
--- creator and the invited players can get the ticket. 
export type GetMatchmakingTicketRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Determines whether the matchmaking attributes will be returned as an escaped 
	--- JSON string or as an un-escaped JSON object. 
	EscapeObject: boolean,
	--- The name of the queue to find a match for. 
	QueueName: string,
	--- The Id of the ticket to find a match for. 
	TicketId: string,
}

export type GetMatchmakingTicketResult = {
	--- The reason why the current ticket was canceled. This field is only set if the 
	--- ticket is in canceled state. 
	CancellationReasonString: string?,
	--- Change number used for differentiating older matchmaking status updates from 
	--- newer ones. 
	ChangeNumber: number?,
	--- The server date and time at which ticket was created. 
	Created: string,
	--- The Creator's entity key. 
	Creator: EntityKey,
	--- How long to attempt matching this ticket in seconds. 
	GiveUpAfterSeconds: number,
	--- The Id of a match. 
	MatchId: string?,
	--- A list of Users that have joined this ticket. 
	Members: {MatchmakingPlayer},
	--- A list of PlayFab Ids of Users to match with. 
	MembersToMatchWith: {EntityKey}?,
	--- The Id of a match queue. 
	QueueName: string,
	--- The current ticket status. Possible values are: WaitingForPlayers, WaitingForMatch, 
	--- WaitingForServer, Canceled and Matched. 
	Status: string,
	--- The Id of the ticket to find a match for. 
	TicketId: string,
}

--- Gets multiplayer server session details for a build in a specific region. 
export type GetMultiplayerServerDetailsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The title generated guid string session ID of the multiplayer server to get 
	--- details for. This is to keep track of multiplayer server sessions. 
	SessionId: string,
}

export type GetMultiplayerServerDetailsResponse = {
	--- The identity of the build in which the server was allocated. 
	BuildId: string?,
	--- The connected players in the multiplayer server. 
	ConnectedPlayers: {ConnectedPlayer}?,
	--- The fully qualified domain name of the virtual machine that is hosting this 
	--- multiplayer server. 
	FQDN: string?,
	--- The IPv4 address of the virtual machine that is hosting this multiplayer server. 
	IPV4Address: string?,
	--- The time (UTC) at which a change in the multiplayer server state was observed. 
	LastStateTransitionTime: string?,
	--- The ports the multiplayer server uses. 
	Ports: {Port}?,
	--- The region the multiplayer server is located in. 
	Region: string?,
	--- The string server ID of the multiplayer server generated by PlayFab. 
	ServerId: string?,
	--- The guid string session ID of the multiplayer server. 
	SessionId: string?,
	--- The state of the multiplayer server. 
	State: string?,
	--- The virtual machine ID that the multiplayer server is located on. 
	VmId: string?,
}

--- Gets multiplayer server logs for a specific server id in a region. The logs 
--- are available only after a server has terminated. 
export type GetMultiplayerServerLogsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The server ID of multiplayer server to get logs for. 
	ServerId: string,
}

export type GetMultiplayerServerLogsResponse = {
	--- URL for logs download. 
	LogDownloadUrl: string?,
}

--- Gets multiplayer server logs for a specific server id in a region. The logs 
--- are available only after a server has terminated. 
export type GetMultiplayerSessionLogsBySessionIdRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The server ID of multiplayer server to get logs for. 
	SessionId: string,
}

--- Returns the matchmaking statistics for a queue. These include the number of 
--- players matching and the statistics related to the time to match statistics 
--- in seconds (average and percentiles). Statistics are refreshed once every 5 
--- minutes. Servers can access all statistics no matter what the ClientStatisticsVisibility 
--- is configured to. Clients can access statistics according to the ClientStatisticsVisibility. 
--- Client requests are forbidden if all visibility fields are false. 
export type GetQueueStatisticsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The name of the queue. 
	QueueName: string,
}

export type GetQueueStatisticsResult = {
	--- The current number of players in the matchmaking queue, who are waiting to be 
	--- matched. 
	NumberOfPlayersMatching: number?,
	--- Statistics representing the time (in seconds) it takes for tickets to find a 
	--- match. 
	TimeToMatchStatisticsInSeconds: Statistics?,
}

--- Gets a remote login endpoint to a VM that is hosting a multiplayer server build 
--- in a specific region. 
export type GetRemoteLoginEndpointRequest = {
	--- The guid string build ID of the multiplayer server to get remote login information 
	--- for. 
	BuildId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The region of the multiplayer server to get remote login information for. 
	Region: string,
	--- The virtual machine ID the multiplayer server is located on. 
	VmId: string,
}

export type GetRemoteLoginEndpointResponse = {
	--- The remote login IPV4 address of multiplayer server. 
	IPV4Address: string?,
	--- The remote login port of multiplayer server. 
	Port: number,
}

--- The ticket includes the players, their attributes, their teams, the ticket status, 
--- the match Id and the server details when applicable, etc. Only servers can get 
--- the ticket. 
export type GetServerBackfillTicketRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Determines whether the matchmaking attributes will be returned as an escaped 
	--- JSON string or as an un-escaped JSON object. 
	EscapeObject: boolean,
	--- The name of the queue to find a match for. 
	QueueName: string,
	--- The Id of the ticket to find a match for. 
	TicketId: string,
}

export type GetServerBackfillTicketResult = {
	--- The reason why the current ticket was canceled. This field is only set if the 
	--- ticket is in canceled state. 
	CancellationReasonString: string?,
	--- The server date and time at which ticket was created. 
	Created: string,
	--- How long to attempt matching this ticket in seconds. 
	GiveUpAfterSeconds: number,
	--- The Id of a match. 
	MatchId: string?,
	--- A list of Users that are part of this ticket, along with their team assignments. 
	Members: {MatchmakingPlayerWithTeamAssignment},
	--- The Id of a match queue. 
	QueueName: string,
	--- The details of the server the members are connected to. 
	ServerDetails: ServerDetails,
	--- The current ticket status. Possible values are: WaitingForMatch, Canceled and 
	--- Matched. 
	Status: string,
	--- The Id of the ticket to find a match for. 
	TicketId: string,
}

--- Gets the status of whether a title is enabled for the multiplayer server feature. 
--- The enabled status can be Initializing, Enabled, and Disabled. 
export type GetTitleEnabledForMultiplayerServersStatusRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetTitleEnabledForMultiplayerServersStatusResponse = {
	--- The enabled status for the multiplayer server features for the title. 
	Status: string?,
}

--- Gets a title's server quota change request. 
export type GetTitleMultiplayerServersQuotaChangeRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Id of the change request to get. 
	RequestId: string,
}

export type GetTitleMultiplayerServersQuotaChangeResponse = {
	--- The change request for this title. 
	Change: QuotaChange?,
}

--- Gets the quotas for a title in relation to multiplayer servers. 
export type GetTitleMultiplayerServersQuotasRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type GetTitleMultiplayerServersQuotasResponse = {
	--- The various quotas for multiplayer servers for the title. 
	Quotas: TitleMultiplayerServersQuotas?,
}

export type InstrumentationConfiguration = {
	--- Designates whether windows instrumentation configuration will be enabled for 
	--- this Build 
	IsEnabled: boolean?,
	--- This property is deprecated, use IsEnabled. The list of processes to be monitored 
	--- on a VM for this build. Providing processes will turn on performance metrics 
	--- collection for this build. Process names should not include extensions. If the 
	--- game server process is: GameServer.exe; then, ProcessesToMonitor = [ GameServer 
	--- ]  
	ProcessesToMonitor: {any}?,
}

--- Request to invite a player to a lobby the caller is already a member of. Only 
--- a client can invite another player to a lobby. 
export type InviteToLobbyRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity invited to the lobby. 
	InviteeEntity: EntityKey?,
	--- The id of the lobby. 
	LobbyId: string?,
	--- The member entity sending the invite. Must be a member of the lobby. 
	MemberEntity: EntityKey?,
}

--- Request to join an arranged lobby. Only a client can join an arranged lobby. 
export type JoinArrangedLobbyRequest = {
	--- The policy indicating who is allowed to join the lobby, and the visibility to 
	--- queries. May be 'Public', 'Friends' or 'Private'. Public means the lobby is 
	--- both visible in queries and any player may join, including invited players. 
	--- Friends means that users who are bidirectional friends of members in the lobby 
	--- may search to find friend lobbies, to retrieve its connection string. Private 
	--- means the lobby is not visible in queries, and a player must receive an invitation 
	--- to join. Defaults to 'Public' on creation. Can only be changed by the lobby 
	--- owner. 
	AccessPolicy: string?,
	--- A field which indicates which lobby the user will be joining. This field is 
	--- opaque to everyone except the Lobby service and the creator of the arrangementString 
	--- (Matchmaking). This string defines a unique identifier for the arranged lobby 
	--- as well as the title and member the string is valid for. Arrangement strings 
	--- have an expiration. 
	ArrangementString: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The maximum number of players allowed in the lobby. The value must be between 
	--- 2 and 128. 
	MaxPlayers: number,
	--- The private key-value pairs used by the member to communicate information to 
	--- other members and the owner. Visible to all members of the lobby. At most 30 
	--- key-value pairs may be stored here, keys are limited to 30 characters and values 
	--- to 1000. The total size of all memberData values may not exceed 4096 bytes. 
	--- Keys are case sensitive. 
	MemberData: {[any]: any}?,
	--- The member entity who is joining the lobby. The first member to join will be 
	--- the lobby owner. 
	MemberEntity: EntityKey,
	--- The policy for how a new owner is chosen. May be 'Automatic', 'Manual' or 'None'. 
	--- Can only be specified by clients. If client-owned and 'Automatic' - The Lobby 
	--- service will automatically assign another connected owner when the current owner 
	--- leaves or disconnects. The useConnections property must be true. If client - 
	--- owned and 'Manual' - Ownership is protected as long as the current owner is 
	--- connected. If the current owner leaves or disconnects any member may set themselves 
	--- as the current owner. The useConnections property must be true. If client-owned 
	--- and 'None' - Any member can set ownership. The useConnections property can be 
	--- either true or false. 
	OwnerMigrationPolicy: string?,
	--- A setting to control whether connections are used. Defaults to true. When true, 
	--- notifications are sent to subscribed players, disconnect detection removes connectionHandles, 
	--- only owner migration policies using connections are allowed, and lobbies must 
	--- have at least one connected member to be searchable or be a server hosted lobby 
	--- with a connected server. If false, then notifications are not sent, connections 
	--- are not allowed, and lobbies do not need connections to be searchable. 
	UseConnections: boolean,
}

--- Request to join a lobby. Only a client can join a lobby. 
export type JoinLobbyRequest = {
	--- A field which indicates which lobby the user will be joining. This field is 
	--- opaque to everyone except the Lobby service. 
	ConnectionString: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The private key-value pairs used by the member to communicate information to 
	--- other members and the owner. Visible to all members of the lobby. At most 30 
	--- key-value pairs may be stored here, keys are limited to 30 characters and values 
	--- to 1000. The total size of all memberData values may not exceed 4096 bytes.Keys 
	--- are case sensitive. 
	MemberData: {[any]: any}?,
	--- The member entity who is joining the lobby. 
	MemberEntity: EntityKey?,
}

export type JoinLobbyResult = {
	--- Successfully joined lobby's id. 
	LobbyId: string,
}

--- Add the player to a matchmaking ticket and specify all of its matchmaking attributes. 
--- Players can join a ticket if and only if their EntityKeys are already listed 
--- in the ticket's Members list. The matchmaking service automatically starts matching 
--- the ticket against other matchmaking tickets once all players have joined the 
--- ticket. It is not possible to join a ticket once it has started matching. 
export type JoinMatchmakingTicketRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The User who wants to join the ticket. Their Id must be listed in PlayFabIdsToMatchWith. 
	Member: MatchmakingPlayer,
	--- The name of the queue to join. 
	QueueName: string,
	--- The Id of the ticket to find a match for. 
	TicketId: string,
}

export type JoinMatchmakingTicketResult = {
}

--- Request to leave a lobby. Only a client can leave a lobby. 
export type LeaveLobbyRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The id of the lobby. 
	LobbyId: string?,
	--- The member entity leaving the lobby. 
	MemberEntity: EntityKey?,
}

export type LinearDifferenceRuleExpansion = {
	--- This value gets added to Difference at every expansion interval. 
	Delta: number,
	--- Once the total difference reaches this value, expansion stops. Optional. 
	Limit: number?,
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type LinearRegionSelectionRuleExpansion = {
	--- This value gets added to MaxLatency at every expansion interval. 
	Delta: number,
	--- Once the max Latency reaches this value, expansion stops. 
	Limit: number,
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type LinearSetIntersectionRuleExpansion = {
	--- This value gets added to MinIntersectionSize at every expansion interval. 
	Delta: number,
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type LinearTeamDifferenceRuleExpansion = {
	--- This value gets added to Difference at every expansion interval. 
	Delta: number,
	--- Once the total difference reaches this value, expansion stops. Optional. 
	Limit: number?,
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type LinearTeamSizeBalanceRuleExpansion = {
	--- This value gets added to Difference at every expansion interval. 
	Delta: number,
	--- Once the total difference reaches this value, expansion stops. Optional. 
	Limit: number?,
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

export type LinuxInstrumentationConfiguration = {
	--- Designates whether Linux instrumentation configuration will be enabled for this 
	--- Build 
	IsEnabled: boolean,
}

--- Returns a list of multiplayer server game asset summaries for a title. 
export type ListAssetSummariesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The page size for the request. 
	PageSize: number?,
	--- The skip token for the paged request. 
	SkipToken: string?,
}

export type ListAssetSummariesResponse = {
	--- The list of asset summaries. 
	AssetSummaries: {AssetSummary}?,
	--- The page size on the response. 
	PageSize: number,
	--- The skip token for the paged response. 
	SkipToken: string?,
}

--- Returns a list of summarized details of all multiplayer server builds for a 
--- title. 
export type ListBuildAliasesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The page size for the request. 
	PageSize: number?,
	--- The skip token for the paged request. 
	SkipToken: string?,
}

export type ListBuildAliasesResponse = {
	--- The list of build aliases for the title 
	BuildAliases: {BuildAliasDetailsResponse}?,
	--- The page size on the response. 
	PageSize: number,
	--- The skip token for the paged response. 
	SkipToken: string?,
}

--- Returns a list of summarized details of all multiplayer server builds for a 
--- title. 
export type ListBuildSummariesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The page size for the request. 
	PageSize: number?,
	--- The skip token for the paged request. 
	SkipToken: string?,
}

export type ListBuildSummariesResponse = {
	--- The list of build summaries for a title. 
	BuildSummaries: {BuildSummary}?,
	--- The page size on the response. 
	PageSize: number,
	--- The skip token for the paged response. 
	SkipToken: string?,
}

--- Returns a list of multiplayer server game certificates for a title. 
export type ListCertificateSummariesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The page size for the request. 
	PageSize: number?,
	--- The skip token for the paged request. 
	SkipToken: string?,
}

export type ListCertificateSummariesResponse = {
	--- The list of game certificates. 
	CertificateSummaries: {CertificateSummary}?,
	--- The page size on the response. 
	PageSize: number,
	--- The skip token for the paged response. 
	SkipToken: string?,
}

--- Returns a list of the tags for a particular container image that exists in the 
--- container registry for a title. 
export type ListContainerImageTagsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The container images we want to list tags for. 
	ImageName: string?,
}

export type ListContainerImageTagsResponse = {
	--- The list of tags for a particular container image. 
	Tags: {any}?,
}

--- Returns a list of the container images that have been uploaded to the container 
--- registry for a title. 
export type ListContainerImagesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The page size for the request. 
	PageSize: number?,
	--- The skip token for the paged request. 
	SkipToken: string?,
}

export type ListContainerImagesResponse = {
	--- The list of container images. 
	Images: {any}?,
	--- The page size on the response. 
	PageSize: number,
	--- The skip token for the paged response. 
	SkipToken: string?,
}

--- Gets a list of all the matchmaking queue configurations for the title. 
export type ListMatchmakingQueuesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type ListMatchmakingQueuesResult = {
	--- The list of matchmaking queue configs for this title. 
	MatchMakingQueues: {MatchmakingQueueConfig}?,
}

--- If the caller is a title, the EntityKey in the request is required. If the caller 
--- is a player, then it is optional. If it is provided it must match the caller's 
--- entity. 
export type ListMatchmakingTicketsForPlayerRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity key for which to find the ticket Ids. 
	Entity: EntityKey?,
	--- The name of the queue to find a match for. 
	QueueName: string,
}

export type ListMatchmakingTicketsForPlayerResult = {
	--- The list of ticket Ids the user is a member of. 
	TicketIds: {any},
}

--- Returns a list of multiplayer servers for a build in a specific region. 
export type ListMultiplayerServersRequest = {
	--- The guid string build ID of the multiplayer servers to list. 
	BuildId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The page size for the request. 
	PageSize: number?,
	--- The region the multiplayer servers to list. 
	Region: string,
	--- The skip token for the paged request. 
	SkipToken: string?,
}

export type ListMultiplayerServersResponse = {
	--- The list of multiplayer server summary details. 
	MultiplayerServerSummaries: {MultiplayerServerSummary}?,
	--- The page size on the response. 
	PageSize: number,
	--- The skip token for the paged response. 
	SkipToken: string?,
}

--- Returns a list of quality of service servers for party. 
export type ListPartyQosServersRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type ListPartyQosServersResponse = {
	--- The page size on the response. 
	PageSize: number,
	--- The list of QoS servers. 
	QosServers: {QosServer}?,
	--- The skip token for the paged response. 
	SkipToken: string?,
}

--- Returns a list of quality of service servers for a title. 
export type ListQosServersForTitleRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Indicates that the response should contain Qos servers for all regions, including 
	--- those where there are no builds deployed for the title. 
	IncludeAllRegions: boolean?,
}

export type ListQosServersForTitleResponse = {
	--- The page size on the response. 
	PageSize: number,
	--- The list of QoS servers. 
	QosServers: {QosServer}?,
	--- The skip token for the paged response. 
	SkipToken: string?,
}

--- List all server backfill ticket Ids the user is a member of. 
export type ListServerBackfillTicketsForPlayerRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity key for which to find the ticket Ids. 
	Entity: EntityKey,
	--- The name of the queue the tickets are in. 
	QueueName: string,
}

export type ListServerBackfillTicketsForPlayerResult = {
	--- The list of backfill ticket Ids the user is a member of. 
	TicketIds: {any},
}

--- List all server quota change requests for a title. 
export type ListTitleMultiplayerServersQuotaChangesRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type ListTitleMultiplayerServersQuotaChangesResponse = {
	--- All change requests for this title. 
	Changes: {QuotaChange}?,
}

--- Returns a list of virtual machines for a title. 
export type ListVirtualMachineSummariesRequest = {
	--- The guid string build ID of the virtual machines to list. 
	BuildId: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The page size for the request. 
	PageSize: number?,
	--- The region of the virtual machines to list. 
	Region: string,
	--- The skip token for the paged request. 
	SkipToken: string?,
}

export type ListVirtualMachineSummariesResponse = {
	--- The page size on the response. 
	PageSize: number,
	--- The skip token for the paged response. 
	SkipToken: string?,
	--- The list of virtual machine summaries. 
	VirtualMachines: {VirtualMachineSummary}?,
}

export type Lobby = {
	--- A setting indicating who is allowed to join this lobby, as well as see it in 
	--- queries. 
	AccessPolicy: string,
	--- A number that increments once for each request that modifies the lobby. 
	ChangeNumber: number,
	--- A string used to join the lobby. This field is populated by the Lobby service. 
	--- Invites are performed by communicating this connectionString to other players. 
	ConnectionString: string,
	--- Lobby data. 
	LobbyData: {[any]: any}?,
	--- Id to uniquely identify a lobby. 
	LobbyId: string,
	--- The maximum number of players allowed in the lobby. 
	MaxPlayers: number,
	--- Array of all lobby members. 
	Members: {Member}?,
	--- A setting indicating whether members are allowed to join this lobby. When Locked 
	--- new members are prevented from joining. 
	MembershipLock: string,
	--- The client or server entity which owns this lobby. 
	Owner: EntityKey?,
	--- A setting indicating the owner migration policy. If server owned, this field 
	--- is not present. 
	OwnerMigrationPolicy: string?,
	--- An opaque string stored on a SubscribeToLobbyResource call, which indicates 
	--- the connection an owner or member has with PubSub. 
	PubSubConnectionHandle: string?,
	--- Search data. 
	SearchData: {[any]: any}?,
	--- A flag which determines if connections are used. Defaults to true. Only set 
	--- on create. 
	UseConnections: boolean,
}

export type LobbyEmptyResult = {
}

export type LobbySummary = {
	--- A string used to join the lobby.This field is populated by the Lobby service.Invites 
	--- are performed by communicating this connectionString to other players. 
	ConnectionString: string,
	--- The current number of players in the lobby. 
	CurrentPlayers: number,
	--- Id to uniquely identify a lobby. 
	LobbyId: string,
	--- The maximum number of players allowed in the lobby. 
	MaxPlayers: number,
	--- A setting indicating whether members are allowed to join this lobby. When Locked 
	--- new members are prevented from joining. 
	MembershipLock: string?,
	--- The client or server entity which owns this lobby. 
	Owner: EntityKey,
	--- Search data. 
	SearchData: {[any]: any}?,
}

export type MatchTotalRule = {
	--- Description of the attribute used by this rule to match tickets. 
	Attribute: QueueRuleAttribute,
	--- Collection of fields relating to expanding this rule at set intervals. 
	Expansion: MatchTotalRuleExpansion?,
	--- The maximum total value for a group. Must be >= Min. 
	Max: number,
	--- The minimum total value for a group. Must be >=2. 
	Min: number,
	--- Friendly name chosen by developer. 
	Name: string,
	--- How many seconds before this rule is no longer enforced (but tickets that comply 
	--- with this rule will still be prioritized over those that don't). Leave blank 
	--- if this rule is always enforced. 
	SecondsUntilOptional: number?,
	--- The relative weight of this rule compared to others. 
	Weight: number,
}

export type MatchTotalRuleExpansion = {
	--- Manually specify the values to use for each expansion interval. When this is 
	--- set, Max is ignored. 
	MaxOverrides: {OverrideDouble}?,
	--- Manually specify the values to use for each expansion interval. When this is 
	--- set, Min is ignored. 
	MinOverrides: {OverrideDouble}?,
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

--- A user in a matchmaking ticket. 
export type MatchmakingPlayer = {
	--- The user's attributes custom to the title. 
	Attributes: MatchmakingPlayerAttributes?,
	--- The entity key of the matchmaking user. 
	Entity: EntityKey,
}

--- The matchmaking attributes for a user. 
export type MatchmakingPlayerAttributes = {
	--- A data object representing a user's attributes. 
	DataObject: {[any]: any}?,
	--- An escaped data object representing a user's attributes. 
	EscapedDataObject: string?,
}

--- A player in a created matchmaking match with a team assignment. 
export type MatchmakingPlayerWithTeamAssignment = {
	--- The user's attributes custom to the title. These attributes will be null unless 
	--- the request has ReturnMemberAttributes flag set to true. 
	Attributes: MatchmakingPlayerAttributes?,
	--- The entity key of the matchmaking user. 
	Entity: EntityKey,
	--- The Id of the team the User is assigned to. 
	TeamId: string?,
}

export type MatchmakingQueueConfig = {
	--- This is the buildAlias that will be used to allocate the multiplayer server 
	--- for the match. 
	BuildAliasParams: BuildAliasParams?,
	--- This is the buildId that will be used to allocate the multiplayer server for 
	--- the match. 
	BuildId: string?,
	--- List of difference rules used to find an optimal match. 
	DifferenceRules: {DifferenceRule}?,
	--- List of match total rules used to find an optimal match. 
	MatchTotalRules: {MatchTotalRule}?,
	--- Maximum number of players in a match. 
	MaxMatchSize: number,
	--- Maximum number of players in a ticket. Optional. 
	MaxTicketSize: number?,
	--- Minimum number of players in a match. 
	MinMatchSize: number,
	--- Unique identifier for a Queue. Chosen by the developer. 
	Name: string,
	--- Region selection rule used to find an optimal match. 
	RegionSelectionRule: RegionSelectionRule?,
	--- Boolean flag to enable server allocation for the queue. 
	ServerAllocationEnabled: boolean,
	--- List of set intersection rules used to find an optimal match. 
	SetIntersectionRules: {SetIntersectionRule}?,
	--- Controls which statistics are visible to players. 
	StatisticsVisibilityToPlayers: StatisticsVisibilityToPlayers?,
	--- List of string equality rules used to find an optimal match. 
	StringEqualityRules: {StringEqualityRule}?,
	--- List of team difference rules used to find an optimal match. 
	TeamDifferenceRules: {TeamDifferenceRule}?,
	--- Team size balance rule used to find an optimal match. 
	TeamSizeBalanceRule: TeamSizeBalanceRule?,
	--- Team ticket size similarity rule used to find an optimal match. 
	TeamTicketSizeSimilarityRule: TeamTicketSizeSimilarityRule?,
	--- The team configuration for a match. This may be null if there are no teams. 
	Teams: {MatchmakingQueueTeam}?,
}

export type MatchmakingQueueTeam = {
	--- The maximum number of players required for the team. 
	MaxTeamSize: number,
	--- The minimum number of players required for the team. 
	MinTeamSize: number,
	--- A name to identify the team. This is case insensitive. 
	Name: string,
}

export type Member = {
	--- Key-value pairs specific to member. 
	MemberData: {[any]: any}?,
	--- The member entity key. 
	MemberEntity: EntityKey?,
	--- Opaque string, stored on a Subscribe call, which indicates the connection an 
	--- owner or member has with PubSub. 
	PubSubConnectionHandle: string?,
}

export type MembershipLock = 
	"Unlocked"
	| "Locked"

export type MonitoringApplicationConfiguration = {
	--- Asset which contains the monitoring application files and scripts. 
	AssetReference: AssetReference,
	--- Execution script name, this will be the main executable for the monitoring application. 
	ExecutionScriptName: string,
	--- Installation script name, this will be run before the ExecutionScript. 
	InstallationScriptName: string?,
	--- Timespan the monitoring application will be kept alive when running from the 
	--- start of the VM 
	OnStartRuntimeInMinutes: number?,
}

export type MonitoringApplicationConfigurationParams = {
	--- Asset which contains the monitoring application files and scripts. 
	AssetReference: AssetReferenceParams,
	--- Execution script name, this will be the main executable for the monitoring application. 
	ExecutionScriptName: string,
	--- Installation script name, this will be run before the ExecutionScript. 
	InstallationScriptName: string?,
	--- Timespan the monitoring application will be kept alive when running from the 
	--- start of the VM 
	OnStartRuntimeInMinutes: number?,
}

export type MultiplayerServerSummary = {
	--- The connected players in the multiplayer server. 
	ConnectedPlayers: {ConnectedPlayer}?,
	--- The time (UTC) at which a change in the multiplayer server state was observed. 
	LastStateTransitionTime: string?,
	--- The region the multiplayer server is located in. 
	Region: string?,
	--- The string server ID of the multiplayer server generated by PlayFab. 
	ServerId: string?,
	--- The title generated guid string session ID of the multiplayer server. 
	SessionId: string?,
	--- The state of the multiplayer server. 
	State: string?,
	--- The virtual machine ID that the multiplayer server is located on. 
	VmId: string?,
}

export type OsPlatform = 
	"Windows"
	| "Linux"

export type OverrideDouble = {
	--- The custom expansion value. 
	Value: number,
}

export type OverrideUnsignedInt = {
	--- The custom expansion value. 
	Value: number,
}

export type OwnerMigrationPolicy = 
	"None"
	| "Automatic"
	| "Manual"
	| "Server"

export type PaginationRequest = {
	--- Continuation token returned as a result in a previous FindLobbies call. Cannot 
	--- be specified by clients. 
	ContinuationToken: string?,
	--- The number of lobbies that should be retrieved. Cannot be specified by servers, 
	--- clients may specify any value up to 50 
	PageSizeRequested: number?,
}

export type PaginationResponse = {
	--- Continuation token returned by server call. Not returned for clients 
	ContinuationToken: string?,
	--- The number of lobbies that matched the search request. 
	TotalMatchedLobbyCount: number?,
}

export type Port = {
	--- The name for the port. 
	Name: string,
	--- The number for the port. 
	Num: number,
	--- The protocol for the port. 
	Protocol: string,
}

export type ProtocolType = 
	"TCP"
	| "UDP"

--- SignalR clients make this request to initiate their connection to the PubSubHub 
--- SignalR service. Clients will interpret the response and make a persistent websocket 
--- connection to the service with the details. 
export type PubSubNegotiateRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type PubSubNegotiateResult = {
	--- The access token for the PubSub Azure SignalR service. 
	AccessToken: string?,
	--- The Url of the PubSub Azure SignalR endpoint. 
	Url: string?,
}

export type QosServer = {
	--- The region the QoS server is located in. 
	Region: string?,
	--- The QoS server URL. 
	ServerUrl: string?,
}

export type QueueRuleAttribute = {
	--- Specifies which attribute in a ticket to use. 
	Path: string,
	--- Specifies which source the attribute comes from. 
	Source: string,
}

export type QuotaChange = {
	--- A brief description of the requested changes. 
	ChangeDescription: string?,
	--- Requested changes to make to the titles cores quota. 
	Changes: {CoreCapacityChange}?,
	--- Whether or not this request is pending a review. 
	IsPendingReview: boolean,
	--- Additional information about this request that our team can use to better understand 
	--- the requirements. 
	Notes: string?,
	--- Id of the change request. 
	RequestId: string?,
	--- Comments by our team when a request is reviewed. 
	ReviewComments: string?,
	--- Whether or not this request was approved. 
	WasApproved: boolean,
}

export type RegionSelectionRule = {
	--- Controls how the Max Latency parameter expands over time. Only one expansion 
	--- can be set per rule. When this is set, MaxLatency is ignored. 
	CustomExpansion: CustomRegionSelectionRuleExpansion?,
	--- Controls how the Max Latency parameter expands over time. Only one expansion 
	--- can be set per rule. 
	LinearExpansion: LinearRegionSelectionRuleExpansion?,
	--- Specifies the maximum latency that is allowed between the client and the selected 
	--- server. The value is in milliseconds. 
	MaxLatency: number,
	--- Friendly name chosen by developer. 
	Name: string,
	--- Specifies which attribute in a ticket to use. 
	Path: string,
	--- How many seconds before this rule is no longer enforced (but tickets that comply 
	--- with this rule will still be prioritized over those that don't). Leave blank 
	--- if this rule is always enforced. 
	SecondsUntilOptional: number?,
	--- The relative weight of this rule compared to others. 
	Weight: number,
}

--- Deletes the configuration for a queue. This will permanently delete the configuration 
--- and players will no longer be able to match in the queue. All outstanding matchmaking 
--- tickets will be cancelled. 
export type RemoveMatchmakingQueueRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The Id of the matchmaking queue to remove. 
	QueueName: string?,
}

export type RemoveMatchmakingQueueResult = {
}

--- Request to remove a member from a lobby. Owners may remove other members from 
--- a lobby. Members cannot remove themselves (use LeaveLobby instead). 
export type RemoveMemberFromLobbyRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The id of the lobby. 
	LobbyId: string?,
	--- The member entity to be removed from the lobby. 
	MemberEntity: EntityKey?,
	--- If true, removed member can never rejoin this lobby. 
	PreventRejoin: boolean,
}

--- Requests a multiplayer server session from a particular build in any of the 
--- given preferred regions. 
export type RequestMultiplayerServerRequest = {
	--- The identifiers of the build alias to use for the request. 
	BuildAliasParams: BuildAliasParams?,
	--- The guid string build ID of the multiplayer server to request. 
	BuildId: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- Initial list of players (potentially matchmade) allowed to connect to the game. 
	--- This list is passed to the game server when requested (via GSDK) and can be 
	--- used to validate players connecting to it. 
	InitialPlayers: {any}?,
	--- The preferred regions to request a multiplayer server from. The Multiplayer 
	--- Service will iterate through the regions in the specified order and allocate 
	--- a server from the first one that has servers available. 
	PreferredRegions: {AzureRegion},
	--- Data encoded as a string that is passed to the game server when requested. This 
	--- can be used to to communicate information such as game mode or map through the 
	--- request flow. 
	SessionCookie: string?,
	--- A guid string session ID created track the multiplayer server session over its 
	--- life. 
	SessionId: string,
}

export type RequestMultiplayerServerResponse = {
	--- The identity of the build in which the server was allocated. 
	BuildId: string?,
	--- The connected players in the multiplayer server. 
	ConnectedPlayers: {ConnectedPlayer}?,
	--- The fully qualified domain name of the virtual machine that is hosting this 
	--- multiplayer server. 
	FQDN: string?,
	--- The IPv4 address of the virtual machine that is hosting this multiplayer server. 
	IPV4Address: string?,
	--- The time (UTC) at which a change in the multiplayer server state was observed. 
	LastStateTransitionTime: string?,
	--- The ports the multiplayer server uses. 
	Ports: {Port}?,
	--- The region the multiplayer server is located in. 
	Region: string?,
	--- The string server ID of the multiplayer server generated by PlayFab. 
	ServerId: string?,
	--- The guid string session ID of the multiplayer server. 
	SessionId: string?,
	--- The state of the multiplayer server. 
	State: string?,
	--- The virtual machine ID that the multiplayer server is located on. 
	VmId: string?,
}

--- Gets new credentials to the container registry where game developers can upload 
--- custom container images to before creating a new build. 
export type RolloverContainerRegistryCredentialsRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

export type RolloverContainerRegistryCredentialsResponse = {
	--- The url of the container registry. 
	DnsName: string?,
	--- The password for accessing the container registry. 
	Password: string?,
	--- The username for accessing the container registry. 
	Username: string?,
}

export type Schedule = {
	--- A short description about this schedule. For example, "Game launch on July 15th". 
	Description: string?,
	--- The date and time in UTC at which the schedule ends. If IsRecurringWeekly is 
	--- true, this schedule will keep renewing for future weeks until disabled or removed. 
	EndTime: string,
	--- Disables the schedule. 
	IsDisabled: boolean,
	--- If true, the StartTime and EndTime will get renewed every week. 
	IsRecurringWeekly: boolean,
	--- The date and time in UTC at which the schedule starts. 
	StartTime: string,
	--- The standby target to maintain for the duration of the schedule. 
	TargetStandby: number,
}

export type ScheduledStandbySettings = {
	--- When true, scheduled standby will be enabled 
	IsEnabled: boolean,
	--- A list of non-overlapping schedules 
	ScheduleList: {Schedule}?,
}

export type ServerDetails = {
	--- The fully qualified domain name of the virtual machine that is hosting this 
	--- multiplayer server. 
	Fqdn: string?,
	--- The IPv4 address of the virtual machine that is hosting this multiplayer server. 
	IPV4Address: string?,
	--- The ports the multiplayer server uses. 
	Ports: {Port}?,
	--- The server's region. 
	Region: string?,
}

export type ServerResourceConstraintParams = {
	--- The maximum number of cores that each server is allowed to use. 
	CpuLimit: number,
	--- The maximum number of GiB of memory that each server is allowed to use. WARNING: 
	--- After exceeding this limit, the server will be killed 
	MemoryLimitGB: number,
}

export type ServerType = 
	"Container"
	| "Process"

export type SetIntersectionRule = {
	--- Description of the attribute used by this rule to match tickets. 
	Attribute: QueueRuleAttribute,
	--- Describes the behavior when an attribute is not specified in the ticket creation 
	--- request or in the user's entity profile. 
	AttributeNotSpecifiedBehavior: string,
	--- Collection of fields relating to expanding this rule at set intervals. Only 
	--- one expansion can be set per rule. When this is set, MinIntersectionSize is 
	--- ignored. 
	CustomExpansion: CustomSetIntersectionRuleExpansion?,
	--- The default value assigned to tickets that are missing the attribute specified 
	--- by AttributePath (assuming that AttributeNotSpecifiedBehavior is UseDefault). 
	--- Values must be unique. 
	DefaultAttributeValue: {any}?,
	--- Collection of fields relating to expanding this rule at set intervals. Only 
	--- one expansion can be set per rule. 
	LinearExpansion: LinearSetIntersectionRuleExpansion?,
	--- The minimum number of values that must match between sets. 
	MinIntersectionSize: number,
	--- Friendly name chosen by developer. 
	Name: string,
	--- How many seconds before this rule is no longer enforced (but tickets that comply 
	--- with this rule will still be prioritized over those that don't). Leave blank 
	--- if this rule is always enforced. 
	SecondsUntilOptional: number?,
	--- The relative weight of this rule compared to others. 
	Weight: number,
}

--- Use this API to create or update matchmaking queue configurations. The queue 
--- configuration defines the matchmaking rules. The matchmaking service will match 
--- tickets together according to the configured rules. Queue resources are not 
--- spun up by calling this API. Queues are created when the first ticket is submitted. 
export type SetMatchmakingQueueRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The matchmaking queue config. 
	MatchmakingQueue: MatchmakingQueueConfig?,
}

export type SetMatchmakingQueueResult = {
}

--- Executes the shutdown callback from the GSDK and terminates the multiplayer 
--- server session. The callback in the GSDK will allow for graceful shutdown with 
--- a 15 minute timeoutIf graceful shutdown has not been completed before 15 minutes 
--- have elapsed, the multiplayer server session will be forcefully terminated on 
--- it's own. 
export type ShutdownMultiplayerServerRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- A guid string session ID of the multiplayer server to shut down. 
	SessionId: string,
}

export type Statistics = {
	--- The average. 
	Average: number,
	--- The 50th percentile. 
	Percentile50: number,
	--- The 90th percentile. 
	Percentile90: number,
	--- The 99th percentile. 
	Percentile99: number,
}

export type StatisticsVisibilityToPlayers = {
	--- Whether to allow players to view the current number of players in the matchmaking 
	--- queue. 
	ShowNumberOfPlayersMatching: boolean,
	--- Whether to allow players to view statistics representing the time it takes for 
	--- tickets to find a match. 
	ShowTimeToMatch: boolean,
}

export type StringEqualityRule = {
	--- Description of the attribute used by this rule to match tickets. 
	Attribute: QueueRuleAttribute,
	--- Describes the behavior when an attribute is not specified in the ticket creation 
	--- request or in the user's entity profile. 
	AttributeNotSpecifiedBehavior: string,
	--- The default value assigned to tickets that are missing the attribute specified 
	--- by AttributePath (assuming that AttributeNotSpecifiedBehavior is false). 
	DefaultAttributeValue: string?,
	--- Collection of fields relating to expanding this rule at set intervals. For StringEqualityRules, 
	--- this is limited to turning the rule off or on during different intervals. 
	Expansion: StringEqualityRuleExpansion?,
	--- Friendly name chosen by developer. 
	Name: string,
	--- How many seconds before this rule is no longer enforced (but tickets that comply 
	--- with this rule will still be prioritized over those that don't). Leave blank 
	--- if this rule is always enforced. 
	SecondsUntilOptional: number?,
	--- The relative weight of this rule compared to others. 
	Weight: number,
}

export type StringEqualityRuleExpansion = {
	--- List of bools specifying whether the rule is applied during this expansion. 
	EnabledOverrides: {any},
	--- How many seconds before this rule is expanded. 
	SecondsBetweenExpansions: number,
}

--- Request to subscribe to lobby resource notifications. 
export type SubscribeToLobbyResourceRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity performing the subscription. 
	EntityKey: EntityKey,
	--- Opaque string, given to a client upon creating a connection with PubSub. 
	PubSubConnectionHandle: string,
	--- The name of the resource to subscribe to. 
	ResourceId: string,
	--- Version number for the subscription of this resource. 
	SubscriptionVersion: number,
	--- Subscription type. 
	Type: string,
}

export type SubscribeToLobbyResourceResult = {
	--- Topic will be returned in all notifications that are the result of this subscription. 
	Topic: string,
}

--- Subscribe to match resource notifications. Match subscriptions have two types; 
--- MatchInvite and MatchTicketStatusChange 
export type SubscribeToMatchResourceRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity performing the subscription. The entity must be authorized to use 
	--- this connectionHandle. 
	EntityKey: EntityKey,
	--- Opaque string, given to a client upon creating a connection with PubSub. Notifications 
	--- will be sent to the connection associated with this handle. 
	PubSubConnectionHandle: string,
	--- The name of the resource to subscribe to. It follows the format {queueName}|{ticketId} 
	--- for MatchTicketStatusChange. For MatchInvite, ResourceId is @me. 
	ResourceId: string,
	--- Version number for the subscription of this resource. Current supported version 
	--- must be 1. 
	SubscriptionVersion: number,
	--- Subscription type. MatchInvite subscriptions are per-player. MatchTicketStatusChange 
	--- subscriptions are per-ticket. Subscribe calls are idempotent. Subscribing on 
	--- the same resource for the same connection results in success. 
	Type: string,
}

export type SubscribeToMatchResourceResult = {
	--- Matchmaking resource 
	Topic: string,
}

export type SubscriptionType = 
	"LobbyChange"
	| "LobbyInvite"

export type TeamDifferenceRule = {
	--- Description of the attribute used by this rule to match teams. 
	Attribute: QueueRuleAttribute,
	--- Collection of fields relating to expanding this rule at set intervals. Only 
	--- one expansion can be set per rule. When this is set, Difference is ignored. 
	CustomExpansion: CustomTeamDifferenceRuleExpansion?,
	--- The default value assigned to tickets that are missing the attribute specified 
	--- by AttributePath (assuming that AttributeNotSpecifiedBehavior is false). 
	DefaultAttributeValue: number,
	--- The allowed difference between any two teams at the start of matchmaking. 
	Difference: number,
	--- Collection of fields relating to expanding this rule at set intervals. Only 
	--- one expansion can be set per rule. 
	LinearExpansion: LinearTeamDifferenceRuleExpansion?,
	--- Friendly name chosen by developer. 
	Name: string,
	--- How many seconds before this rule is no longer enforced (but tickets that comply 
	--- with this rule will still be prioritized over those that don't). Leave blank 
	--- if this rule is always enforced. 
	SecondsUntilOptional: number?,
}

export type TeamSizeBalanceRule = {
	--- Controls how the Difference parameter expands over time. Only one expansion 
	--- can be set per rule. When this is set, Difference is ignored. 
	CustomExpansion: CustomTeamSizeBalanceRuleExpansion?,
	--- The allowed difference in team size between any two teams. 
	Difference: number,
	--- Controls how the Difference parameter expands over time. Only one expansion 
	--- can be set per rule. 
	LinearExpansion: LinearTeamSizeBalanceRuleExpansion?,
	--- Friendly name chosen by developer. 
	Name: string,
	--- How many seconds before this rule is no longer enforced (but tickets that comply 
	--- with this rule will still be prioritized over those that don't). Leave blank 
	--- if this rule is always enforced. 
	SecondsUntilOptional: number?,
}

export type TeamTicketSizeSimilarityRule = {
	--- Friendly name chosen by developer. 
	Name: string,
	--- How many seconds before this rule is no longer enforced (but tickets that comply 
	--- with this rule will still be prioritized over those that don't). Leave blank 
	--- if this rule is always enforced. 
	SecondsUntilOptional: number?,
}

export type TitleMultiplayerServerEnabledStatus = 
	"Initializing"
	| "Enabled"
	| "Disabled"

export type TitleMultiplayerServersQuotas = {
	--- The core capacity for the various regions and VM Family 
	CoreCapacities: {CoreCapacity}?,
}

--- Request to unsubscribe from lobby notifications. 
export type UnsubscribeFromLobbyResourceRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity which performed the subscription. 
	EntityKey: EntityKey,
	--- Opaque string, given to a client upon creating a connection with PubSub. 
	PubSubConnectionHandle: string,
	--- The name of the resource to unsubscribe from. 
	ResourceId: string,
	--- Version number passed for the subscription of this resource. 
	SubscriptionVersion: number,
	--- Subscription type. 
	Type: string,
}

--- Unsubscribe from a Match resource's notifications. For MatchInvite, players 
--- are expected to unsubscribe once they can no longer accept invites. For MatchTicketStatusChange, 
--- players are expected to unsusbcribe once the ticket has reached a canceled or 
--- matched state. 
export type UnsubscribeFromMatchResourceRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The entity performing the unsubscription. The entity must be authorized to use 
	--- this connectionHandle. 
	EntityKey: EntityKey,
	--- Opaque string, given to a client upon creating a connection with PubSub. 
	PubSubConnectionHandle: string,
	--- The name of the resource to unsubscribe from. It follows the format {queueName}|{ticketId} 
	--- for MatchTicketStatusChange. For MatchInvite, ResourceId is @me. 
	ResourceId: string,
	--- Version number for the unsubscription from this resource. 
	SubscriptionVersion: number,
	--- Type of the subscription to be canceled. 
	Type: string,
}

export type UnsubscribeFromMatchResourceResult = {
}

--- Removes the specified tag from the image. After this operation, a 'docker pull' 
--- will fail for the specified image and tag combination. Morever, ListContainerImageTags 
--- will not return the specified tag. 
export type UntagContainerImageRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The container image which tag we want to remove. 
	ImageName: string?,
	--- The tag we want to remove. 
	Tag: string?,
}

--- Creates a multiplayer server build alias and returns the created alias. 
export type UpdateBuildAliasRequest = {
	--- The guid string alias Id of the alias to be updated. 
	AliasId: string,
	--- The alias name. 
	AliasName: string?,
	--- Array of build selection criteria. 
	BuildSelectionCriteria: {BuildSelectionCriterion}?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

--- Updates a multiplayer server build's name. 
export type UpdateBuildNameRequest = {
	--- The guid string ID of the build we want to update the name of. 
	BuildId: string,
	--- The build name. 
	BuildName: string,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

--- Updates a multiplayer server build's region. 
export type UpdateBuildRegionRequest = {
	--- The guid string ID of the build we want to update regions for. 
	BuildId: string,
	--- The updated region configuration that should be applied to the specified build. 
	BuildRegion: BuildRegionParams,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

--- Updates a multiplayer server build's regions. 
export type UpdateBuildRegionsRequest = {
	--- The guid string ID of the build we want to update regions for. 
	BuildId: string,
	--- The updated region configuration that should be applied to the specified build. 
	BuildRegions: {BuildRegionParams},
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
}

--- Request to update a lobby. 
export type UpdateLobbyRequest = {
	--- The policy indicating who is allowed to join the lobby, and the visibility to 
	--- queries. May be 'Public', 'Friends' or 'Private'. Public means the lobby is 
	--- both visible in queries and any player may join, including invited players. 
	--- Friends means that users who are bidirectional friends of members in the lobby 
	--- may search to find friend lobbies, to retrieve its connection string. Private 
	--- means the lobby is not visible in queries, and a player must receive an invitation 
	--- to join. Defaults to 'Public' on creation. Can only be changed by the lobby 
	--- owner. 
	AccessPolicy: string?,
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The private key-value pairs which are only visible to members of the lobby. 
	--- Optional. Sets or updates key-value pairs on the lobby. Only the current lobby 
	--- owner can set lobby data. Keys may be an arbitrary string of at most 30 characters. 
	--- The total size of all lobbyData values may not exceed 4096 bytes. Values are 
	--- not individually limited. There can be up to 30 key-value pairs stored here. 
	--- Keys are case sensitive. 
	LobbyData: {[any]: any}?,
	--- The keys to delete from the lobby LobbyData. Optional. Behaves similar to searchDataToDelete, 
	--- but applies to lobbyData. 
	LobbyDataToDelete: {any}?,
	--- The id of the lobby. 
	LobbyId: string?,
	--- The maximum number of players allowed in the lobby. Updates the maximum allowed 
	--- number of players in the lobby. Only the current lobby owner can set this. If 
	--- set, the value must be greater than or equal to the number of members currently 
	--- in the lobby. 
	MaxPlayers: number?,
	--- The private key-value pairs used by the member to communicate information to 
	--- other members and the owner. Optional. Sets or updates new key-value pairs on 
	--- the caller's member data. New keys will be added with their values and existing 
	--- keys will be updated with the new values. Visible to all members of the lobby. 
	--- At most 30 key-value pairs may be stored here, keys are limited to 30 characters 
	--- and values to 1000. The total size of all memberData values may not exceed 4096 
	--- bytes. Keys are case sensitive. Servers cannot specifiy this. 
	MemberData: {[any]: any}?,
	--- The keys to delete from the lobby MemberData. Optional. Deletes key-value pairs 
	--- on the caller's member data. All the specified keys will be removed from the 
	--- caller's member data. Keys that do not exist are a no-op. If the key to delete 
	--- exists in the memberData (same request) it will result in a bad request. Servers 
	--- cannot specifiy this. 
	MemberDataToDelete: {any}?,
	--- The member entity whose data is being modified. Servers cannot specify this. 
	MemberEntity: EntityKey?,
	--- A setting indicating whether the lobby is locked. May be 'Unlocked' or 'Locked'. 
	--- When Locked new members are not allowed to join. Defaults to 'Unlocked' on creation. 
	--- Can only be changed by the lobby owner. 
	MembershipLock: string?,
	--- The lobby owner. Optional. Set to transfer ownership of the lobby. If client 
	--- - owned and 'Automatic' - The Lobby service will automatically assign another 
	--- connected owner when the current owner leaves or disconnects. useConnections 
	--- must be true. If client - owned and 'Manual' - Ownership is protected as long 
	--- as the current owner is connected. If the current owner leaves or disconnects 
	--- any member may set themselves as the current owner. The useConnections property 
	--- must be true. If client-owned and 'None' - Any member can set ownership. The 
	--- useConnections property can be either true or false. For all client-owned lobbies 
	--- when the owner leaves and a new owner can not be automatically selected - The 
	--- owner field is set to null. For all client-owned lobbies when the owner disconnects 
	--- and a new owner can not be automatically selected - The owner field remains 
	--- unchanged and the current owner retains all owner abilities for the lobby. If 
	--- server-owned (must be 'Server') - Any server can set ownership. The useConnections 
	--- property must be true. 
	Owner: EntityKey?,
	--- The public key-value pairs which allow queries to differentiate between lobbies. 
	--- Optional. Sets or updates key-value pairs on the lobby for use with queries. 
	--- Only the current lobby owner can set search data. New keys will be added with 
	--- their values and existing keys will be updated with the new values. There can 
	--- be up to 30 key-value pairs stored here. Keys are of the format string_key1, 
	--- string_key2... string_key30 for string values, or number_key1, number_key2, 
	--- ... number_key30 for numeric values. Numeric values are floats. Values can be 
	--- at most 256 characters long. The total size of all searchData values may not 
	--- exceed 1024 bytes.Keys are case sensitive. 
	SearchData: {[any]: any}?,
	--- The keys to delete from the lobby SearchData. Optional. Deletes key-value pairs 
	--- on the lobby. Only the current lobby owner can delete search data. All the specified 
	--- keys will be removed from the search data. Keys that do not exist in the lobby 
	--- are a no-op.If the key to delete exists in the searchData (same request) it 
	--- will result in a bad request. 
	SearchDataToDelete: {any}?,
}

--- Uploads a multiplayer server game certificate. 
export type UploadCertificateRequest = {
	--- The optional custom tags associated with the request (e.g. build number, external 
	--- trace identifiers, etc.). 
	CustomTags: {[any]: any}?,
	--- The game certificate to upload. 
	GameCertificate: Certificate,
}

export type VirtualMachineSummary = {
	--- The virtual machine health status. 
	HealthStatus: string?,
	--- The virtual machine state. 
	State: string?,
	--- The virtual machine ID. 
	VmId: string?,
}

export type WindowsCrashDumpConfiguration = {
	--- See https://docs.microsoft.com/en-us/windows/win32/wer/collecting-user-mode-dumps 
	--- for valid values. 
	CustomDumpFlags: number?,
	--- See https://docs.microsoft.com/en-us/windows/win32/wer/collecting-user-mode-dumps 
	--- for valid values. 
	DumpType: number?,
	--- Designates whether automatic crash dump capturing will be enabled for this Build. 
	IsEnabled: boolean,
}


--- Creates a multiplayer lobby. The caller is the lobby creator. Caller may be 
--- a server or player entity. 
---
--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/createlobby
function MultiplayerApi.CreateLobbyAsync(
	entityToken: string, 
	request: CreateLobbyRequest
): CreateLobbyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/CreateLobby",
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
): LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/DeleteLobby",
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
): FindFriendLobbiesResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/FindFriendLobbies",
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
): FindLobbiesResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/FindLobbies",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/getlobby
function MultiplayerApi.GetLobbyAsync(
	entityToken: string, 
	request: GetLobbyRequest
): GetLobbyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/GetLobby",
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
): LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/InviteToLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinarrangedlobby
function MultiplayerApi.JoinArrangedLobbyAsync(
	entityToken: string, 
	request: JoinArrangedLobbyRequest
): JoinLobbyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/JoinArrangedLobby",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/joinlobby
function MultiplayerApi.JoinLobbyAsync(
	entityToken: string, 
	request: JoinLobbyRequest
): JoinLobbyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/JoinLobby",
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
): LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/LeaveLobby",
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
): LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/RemoveMember",
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
): SubscribeToLobbyResourceResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/SubscribeToLobbyResource",
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
): LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/UnsubscribeFromLobbyResource",
		request,
		"X-EntityToken",
		entityToken
	)
end

--- https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/updatelobby
function MultiplayerApi.UpdateLobbyAsync(
	entityToken: string, 
	request: UpdateLobbyRequest
): LobbyEmptyResult
	return PlayFabInternal.MakeApiCall(
		"/Lobby/UpdateLobby",
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
): CancelAllMatchmakingTicketsForPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CancelAllMatchmakingTicketsForPlayer",
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
): CancelAllServerBackfillTicketsForPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CancelAllServerBackfillTicketsForPlayer",
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
): CancelMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CancelMatchmakingTicket",
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
): CancelServerBackfillTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CancelServerBackfillTicket",
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
): CreateMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CreateMatchmakingTicket",
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
): CreateServerBackfillTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CreateServerBackfillTicket",
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
): CreateMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/CreateServerMatchmakingTicket",
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
): GetMatchResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetMatch",
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
): GetMatchmakingQueueResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetMatchmakingQueue",
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
): GetMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetMatchmakingTicket",
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
): GetQueueStatisticsResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetQueueStatistics",
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
): GetServerBackfillTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/GetServerBackfillTicket",
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
): JoinMatchmakingTicketResult
	return PlayFabInternal.MakeApiCall(
		"/Match/JoinMatchmakingTicket",
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
): ListMatchmakingQueuesResult
	return PlayFabInternal.MakeApiCall(
		"/Match/ListMatchmakingQueues",
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
): ListMatchmakingTicketsForPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Match/ListMatchmakingTicketsForPlayer",
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
): ListServerBackfillTicketsForPlayerResult
	return PlayFabInternal.MakeApiCall(
		"/Match/ListServerBackfillTicketsForPlayer",
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
): RemoveMatchmakingQueueResult
	return PlayFabInternal.MakeApiCall(
		"/Match/RemoveMatchmakingQueue",
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
): SetMatchmakingQueueResult
	return PlayFabInternal.MakeApiCall(
		"/Match/SetMatchmakingQueue",
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
): SubscribeToMatchResourceResult
	return PlayFabInternal.MakeApiCall(
		"/Match/SubscribeToMatchmakingResource",
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
): UnsubscribeFromMatchResourceResult
	return PlayFabInternal.MakeApiCall(
		"/Match/UnsubscribeFromMatchmakingResource",
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
): BuildAliasDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateBuildAlias",
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
): CreateBuildWithCustomContainerResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateBuildWithCustomContainer",
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
): CreateBuildWithManagedContainerResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateBuildWithManagedContainer",
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
): CreateBuildWithProcessBasedServerResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateBuildWithProcessBasedServer",
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
): CreateRemoteUserResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateRemoteUser",
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
): CreateTitleMultiplayerServersQuotaChangeResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/CreateTitleMultiplayerServersQuotaChange",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteAsset",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteBuild",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteBuildAlias",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteBuildRegion",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteCertificate",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteContainerImageRepository",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/DeleteRemoteUser",
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
): EnableMultiplayerServersForTitleResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/EnableMultiplayerServersForTitle",
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
): GetAssetDownloadUrlResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetAssetDownloadUrl",
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
): GetAssetUploadUrlResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetAssetUploadUrl",
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
): GetBuildResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetBuild",
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
): BuildAliasDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetBuildAlias",
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
): GetContainerRegistryCredentialsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetContainerRegistryCredentials",
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
): GetMultiplayerServerDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetMultiplayerServerDetails",
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
): GetMultiplayerServerLogsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetMultiplayerServerLogs",
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
): GetMultiplayerServerLogsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetMultiplayerSessionLogsBySessionId",
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
): GetRemoteLoginEndpointResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetRemoteLoginEndpoint",
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
): GetTitleEnabledForMultiplayerServersStatusResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetTitleEnabledForMultiplayerServersStatus",
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
): GetTitleMultiplayerServersQuotaChangeResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetTitleMultiplayerServersQuotaChange",
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
): GetTitleMultiplayerServersQuotasResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/GetTitleMultiplayerServersQuotas",
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
): ListMultiplayerServersResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListArchivedMultiplayerServers",
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
): ListAssetSummariesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListAssetSummaries",
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
): ListBuildAliasesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListBuildAliases",
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
): ListBuildSummariesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListBuildSummariesV2",
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
): ListCertificateSummariesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListCertificateSummaries",
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
): ListContainerImageTagsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListContainerImageTags",
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
): ListContainerImagesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListContainerImages",
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
): ListMultiplayerServersResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListMultiplayerServers",
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
): ListPartyQosServersResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListPartyQosServers",
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
): ListQosServersForTitleResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListQosServersForTitle",
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
): ListTitleMultiplayerServersQuotaChangesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListTitleMultiplayerServersQuotaChanges",
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
): ListVirtualMachineSummariesResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ListVirtualMachineSummaries",
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
): RequestMultiplayerServerResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/RequestMultiplayerServer",
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
): RolloverContainerRegistryCredentialsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/RolloverContainerRegistryCredentials",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/ShutdownMultiplayerServer",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UntagContainerImage",
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
): BuildAliasDetailsResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UpdateBuildAlias",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UpdateBuildName",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UpdateBuildRegion",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UpdateBuildRegions",
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
): EmptyResponse
	return PlayFabInternal.MakeApiCall(
		"/MultiplayerServer/UploadCertificate",
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
): PubSubNegotiateResult
	return PlayFabInternal.MakeApiCall(
		"/PubSub/Negotiate",
		request,
		"X-EntityToken",
		entityToken
	)
end

return MultiplayerApi

