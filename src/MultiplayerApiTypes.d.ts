/// <reference path="PlayFabTypes.d.ts" />

interface AssetReference {
    // The asset's file name. This is a filename with the .zip, .tar, or .tar.gz extension.
    FileName?: string;
    // The asset's mount path.
    MountPath?: string;
}

interface AssetReferenceParams {
    // The asset's file name.
    FileName: string;
    // The asset's mount path.
    MountPath?: string;
}

interface AssetSummary {
    // The asset's file name. This is a filename with the .zip, .tar, or .tar.gz extension.
    FileName?: string;
    // The metadata associated with the asset.
    Metadata?: { [key: string]: string | null };
}

type AttributeMergeFunction = "Min"
    | "Max"
    | "Average";

type AttributeNotSpecifiedBehavior = "UseDefault"
    | "MatchAny";

type AttributeSource = "User"
    | "PlayerEntity";

type AzureRegion = "AustraliaEast"
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
    | "ChinaEast2"
    | "ChinaNorth2"
    | "SouthAfricaNorth"
    | "CentralUsEuap"
    | "WestCentralUs";

type AzureVmFamily = "A"
    | "Av2"
    | "Dv2"
    | "Dv3"
    | "F"
    | "Fsv2"
    | "Dasv4";

type AzureVmSize = "Standard_A1"
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
    | "Standard_D16as_v4";

interface BuildAliasDetailsResponse extends PlayFabModule.IPlayFabResultCommon {
    // The guid string alias Id of the alias to be created or updated.
    AliasId?: string;
    // The alias name.
    AliasName?: string;
    // Array of build selection criteria.
    BuildSelectionCriteria?: BuildSelectionCriterion[];
    // The page size on the response.
    PageSize: number;
    // The skip token for the paged response.
    SkipToken?: string;
}

interface BuildAliasParams {
    // The guid string alias ID to use for the request.
    AliasId: string;
}

interface BuildRegion {
    // The current multiplayer server stats for the region.
    CurrentServerStats?: CurrentServerStats;
    // Optional settings to control dynamic adjustment of standby target
    DynamicStandbySettings?: DynamicStandbySettings;
    // The maximum number of multiplayer servers for the region.
    MaxServers: number;
    // The build region.
    Region?: string;
    // The target number of standby multiplayer servers for the region.
    StandbyServers: number;
    // The status of multiplayer servers in the build region. Valid values are - Unknown, Initialized, Deploying, Deployed,
    // Unhealthy, Deleting, Deleted.
    Status?: string;
}

interface BuildRegionParams {
    // Optional settings to control dynamic adjustment of standby target. If not specified, dynamic standby is disabled
    DynamicStandbySettings?: DynamicStandbySettings;
    // The maximum number of multiplayer servers for the region.
    MaxServers: number;
    // The build region.
    Region: string;
    // The number of standby multiplayer servers for the region.
    StandbyServers: number;
}

interface BuildSelectionCriterion {
    // Dictionary of build ids and their respective weights for distribution of allocation requests.
    BuildWeightDistribution?: { [key: string]: number };
}

interface BuildSummary {
    // The guid string build ID of the build.
    BuildId?: string;
    // The build name.
    BuildName?: string;
    // The time the build was created in UTC.
    CreationTime?: string;
    // The metadata of the build.
    Metadata?: { [key: string]: string | null };
    // The configuration and status for each region in the build.
    RegionConfigurations?: BuildRegion[];
}

interface CancelAllMatchmakingTicketsForPlayerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity key of the player whose tickets should be canceled.
    Entity?: EntityKey;
    // The name of the queue from which a player's tickets should be canceled.
    QueueName: string;
}

interface CancelAllMatchmakingTicketsForPlayerResult extends PlayFabModule.IPlayFabResultCommon {}

interface CancelAllServerBackfillTicketsForPlayerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity key of the player whose backfill tickets should be canceled.
    Entity: EntityKey;
    // The name of the queue from which a player's backfill tickets should be canceled.
    QueueName: string;
}

interface CancelAllServerBackfillTicketsForPlayerResult extends PlayFabModule.IPlayFabResultCommon {}

type CancellationReason = "Requested"
    | "Internal"
    | "Timeout";

interface CancelMatchmakingTicketRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The name of the queue the ticket is in.
    QueueName: string;
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface CancelMatchmakingTicketResult extends PlayFabModule.IPlayFabResultCommon {}

interface CancelServerBackfillTicketRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The name of the queue the ticket is in.
    QueueName: string;
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface CancelServerBackfillTicketResult extends PlayFabModule.IPlayFabResultCommon {}

interface Certificate {
    // Base64 encoded string contents of the certificate.
    Base64EncodedValue: string;
    // A name for the certificate. This is used to reference certificates in build configurations.
    Name: string;
    // If required for your PFX certificate, use this field to provide a password that will be used to install the certificate
    // on the container.
    Password?: string;
}

interface CertificateSummary {
    // The name of the certificate.
    Name?: string;
    // The thumbprint for the certificate.
    Thumbprint?: string;
}

interface ConnectedPlayer {
    // The player ID of the player connected to the multiplayer server.
    PlayerId?: string;
}

type ContainerFlavor = "ManagedWindowsServerCore"
    | "CustomLinux"
    | "ManagedWindowsServerCorePreview"
    | "Invalid";

interface ContainerImageReference {
    // The container image name.
    ImageName: string;
    // The container tag.
    Tag?: string;
}

interface CoreCapacity {
    // The available core capacity for the (Region, VmFamily)
    Available: number;
    // The AzureRegion
    Region?: string;
    // The total core capacity for the (Region, VmFamily)
    Total: number;
    // The AzureVmFamily
    VmFamily?: string;
}

interface CreateBuildAliasRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The alias name.
    AliasName: string;
    // Array of build selection criteria.
    BuildSelectionCriteria?: BuildSelectionCriterion[];
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface CreateBuildWithCustomContainerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or
    // will have the same assets mounted in the container.
    AreAssetsReadonly?: boolean;
    // The build name.
    BuildName: string;
    // The flavor of container to create a build from.
    ContainerFlavor?: string;
    // The container reference, consisting of the image name and tag.
    ContainerImageReference?: ContainerImageReference;
    // The container command to run when the multiplayer server has been allocated, including any arguments.
    ContainerRunCommand?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The list of game assets related to the build.
    GameAssetReferences?: AssetReferenceParams[];
    // The game certificates for the build.
    GameCertificateReferences?: GameCertificateReferenceParams[];
    // The Linux instrumentation configuration for the build.
    LinuxInstrumentationConfiguration?: LinuxInstrumentationConfiguration;
    // Metadata to tag the build. The keys are case insensitive. The build metadata is made available to the server through
    // Game Server SDK (GSDK).Constraints: Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100
    Metadata?: { [key: string]: string | null };
    // The number of multiplayer servers to host on a single VM.
    MultiplayerServerCountPerVm: number;
    // The ports to map the build on.
    Ports: Port[];
    // The region configurations for the build.
    RegionConfigurations: BuildRegionParams[];
    // When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to
    // disc.
    UseStreamingForAssetDownloads?: boolean;
    // The VM size to create the build on.
    VmSize?: string;
}

interface CreateBuildWithCustomContainerResponse extends PlayFabModule.IPlayFabResultCommon {
    // When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or
    // will have the same assets mounted in the container.
    AreAssetsReadonly?: boolean;
    // The guid string build ID. Must be unique for every build.
    BuildId?: string;
    // The build name.
    BuildName?: string;
    // The flavor of container of the build.
    ContainerFlavor?: string;
    // The container command to run when the multiplayer server has been allocated, including any arguments.
    ContainerRunCommand?: string;
    // The time the build was created in UTC.
    CreationTime?: string;
    // The custom game container image reference information.
    CustomGameContainerImage?: ContainerImageReference;
    // The game assets for the build.
    GameAssetReferences?: AssetReference[];
    // The game certificates for the build.
    GameCertificateReferences?: GameCertificateReference[];
    // The Linux instrumentation configuration for this build.
    LinuxInstrumentationConfiguration?: LinuxInstrumentationConfiguration;
    // The metadata of the build.
    Metadata?: { [key: string]: string | null };
    // The number of multiplayer servers to host on a single VM of the build.
    MultiplayerServerCountPerVm: number;
    // The OS platform used for running the game process.
    OsPlatform?: string;
    // The ports the build is mapped on.
    Ports?: Port[];
    // The region configuration for the build.
    RegionConfigurations?: BuildRegion[];
    // The type of game server being hosted.
    ServerType?: string;
    // When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to
    // disc.
    UseStreamingForAssetDownloads?: boolean;
    // The VM size the build was created on.
    VmSize?: string;
}

interface CreateBuildWithManagedContainerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or
    // will have the same assets mounted in the container.
    AreAssetsReadonly?: boolean;
    // The build name.
    BuildName: string;
    // The flavor of container to create a build from.
    ContainerFlavor?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The list of game assets related to the build.
    GameAssetReferences: AssetReferenceParams[];
    // The game certificates for the build.
    GameCertificateReferences?: GameCertificateReferenceParams[];
    // The directory containing the game executable. This would be the start path of the game assets that contain the main game
    // server executable. If not provided, a best effort will be made to extract it from the start game command.
    GameWorkingDirectory?: string;
    // The instrumentation configuration for the build.
    InstrumentationConfiguration?: InstrumentationConfiguration;
    // Metadata to tag the build. The keys are case insensitive. The build metadata is made available to the server through
    // Game Server SDK (GSDK).Constraints: Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100
    Metadata?: { [key: string]: string | null };
    // The number of multiplayer servers to host on a single VM.
    MultiplayerServerCountPerVm: number;
    // The ports to map the build on.
    Ports: Port[];
    // The region configurations for the build.
    RegionConfigurations: BuildRegionParams[];
    // The command to run when the multiplayer server is started, including any arguments.
    StartMultiplayerServerCommand: string;
    // When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to
    // disc.
    UseStreamingForAssetDownloads?: boolean;
    // The VM size to create the build on.
    VmSize?: string;
}

interface CreateBuildWithManagedContainerResponse extends PlayFabModule.IPlayFabResultCommon {
    // When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or
    // will have the same assets mounted in the container.
    AreAssetsReadonly?: boolean;
    // The guid string build ID. Must be unique for every build.
    BuildId?: string;
    // The build name.
    BuildName?: string;
    // The flavor of container of the build.
    ContainerFlavor?: string;
    // The time the build was created in UTC.
    CreationTime?: string;
    // The game assets for the build.
    GameAssetReferences?: AssetReference[];
    // The game certificates for the build.
    GameCertificateReferences?: GameCertificateReference[];
    // The directory containing the game executable. This would be the start path of the game assets that contain the main game
    // server executable. If not provided, a best effort will be made to extract it from the start game command.
    GameWorkingDirectory?: string;
    // The instrumentation configuration for this build.
    InstrumentationConfiguration?: InstrumentationConfiguration;
    // The metadata of the build.
    Metadata?: { [key: string]: string | null };
    // The number of multiplayer servers to host on a single VM of the build.
    MultiplayerServerCountPerVm: number;
    // The OS platform used for running the game process.
    OsPlatform?: string;
    // The ports the build is mapped on.
    Ports?: Port[];
    // The region configuration for the build.
    RegionConfigurations?: BuildRegion[];
    // The type of game server being hosted.
    ServerType?: string;
    // The command to run when the multiplayer server has been allocated, including any arguments.
    StartMultiplayerServerCommand?: string;
    // When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to
    // disc.
    UseStreamingForAssetDownloads?: boolean;
    // The VM size the build was created on.
    VmSize?: string;
}

interface CreateBuildWithProcessBasedServerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or
    // will have the same assets mounted in the container.
    AreAssetsReadonly?: boolean;
    // The build name.
    BuildName: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The list of game assets related to the build.
    GameAssetReferences: AssetReferenceParams[];
    // The game certificates for the build.
    GameCertificateReferences?: GameCertificateReferenceParams[];
    // The working directory for the game process. If this is not provided, the working directory will be set based on the
    // mount path of the game server executable.
    GameWorkingDirectory?: string;
    // The instrumentation configuration for the build.
    InstrumentationConfiguration?: InstrumentationConfiguration;
    // Metadata to tag the build. The keys are case insensitive. The build metadata is made available to the server through
    // Game Server SDK (GSDK).Constraints: Maximum number of keys: 30, Maximum key length: 50, Maximum value length: 100
    Metadata?: { [key: string]: string | null };
    // The number of multiplayer servers to host on a single VM.
    MultiplayerServerCountPerVm: number;
    // The OS platform used for running the game process.
    OsPlatform?: string;
    // The ports to map the build on.
    Ports: Port[];
    // The region configurations for the build.
    RegionConfigurations: BuildRegionParams[];
    // The command to run when the multiplayer server is started, including any arguments. The path to any executable should be
    // relative to the root asset folder when unzipped.
    StartMultiplayerServerCommand: string;
    // When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to
    // disc.
    UseStreamingForAssetDownloads?: boolean;
    // The VM size to create the build on.
    VmSize?: string;
}

interface CreateBuildWithProcessBasedServerResponse extends PlayFabModule.IPlayFabResultCommon {
    // When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or
    // will have the same assets mounted in the container.
    AreAssetsReadonly?: boolean;
    // The guid string build ID. Must be unique for every build.
    BuildId?: string;
    // The build name.
    BuildName?: string;
    // The flavor of container of the build.
    ContainerFlavor?: string;
    // The time the build was created in UTC.
    CreationTime?: string;
    // The game assets for the build.
    GameAssetReferences?: AssetReference[];
    // The game certificates for the build.
    GameCertificateReferences?: GameCertificateReference[];
    // The working directory for the game process. If this is not provided, the working directory will be set based on the
    // mount path of the game server executable.
    GameWorkingDirectory?: string;
    // The instrumentation configuration for this build.
    InstrumentationConfiguration?: InstrumentationConfiguration;
    // The metadata of the build.
    Metadata?: { [key: string]: string | null };
    // The number of multiplayer servers to host on a single VM of the build.
    MultiplayerServerCountPerVm: number;
    // The OS platform used for running the game process.
    OsPlatform?: string;
    // The ports the build is mapped on.
    Ports?: Port[];
    // The region configuration for the build.
    RegionConfigurations?: BuildRegion[];
    // The type of game server being hosted.
    ServerType?: string;
    // The command to run when the multiplayer server is started, including any arguments. The path to any executable is
    // relative to the root asset folder when unzipped.
    StartMultiplayerServerCommand?: string;
    // When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to
    // disc.
    UseStreamingForAssetDownloads?: boolean;
    // The VM size the build was created on.
    VmSize?: string;
}

interface CreateMatchmakingTicketRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The User who created this ticket.
    Creator: MatchmakingPlayer;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // How long to attempt matching this ticket in seconds.
    GiveUpAfterSeconds: number;
    // A list of Entity Keys of other users to match with.
    MembersToMatchWith?: EntityKey[];
    // The Id of a match queue.
    QueueName: string;
}

interface CreateMatchmakingTicketResult extends PlayFabModule.IPlayFabResultCommon {
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface CreateRemoteUserRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of to create the remote user for.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The expiration time for the remote user created. Defaults to expiring in one day if not specified.
    ExpirationTime?: string;
    // The region of virtual machine to create the remote user for.
    Region: string;
    // The username to create the remote user with.
    Username: string;
    // The virtual machine ID the multiplayer server is located on.
    VmId: string;
}

interface CreateRemoteUserResponse extends PlayFabModule.IPlayFabResultCommon {
    // The expiration time for the remote user created.
    ExpirationTime?: string;
    // The generated password for the remote user that was created.
    Password?: string;
    // The username for the remote user that was created.
    Username?: string;
}

interface CreateServerBackfillTicketRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // How long to attempt matching this ticket in seconds.
    GiveUpAfterSeconds: number;
    // The users who will be part of this ticket, along with their team assignments.
    Members: MatchmakingPlayerWithTeamAssignment[];
    // The Id of a match queue.
    QueueName: string;
    // The details of the server the members are connected to.
    ServerDetails?: ServerDetails;
}

interface CreateServerBackfillTicketResult extends PlayFabModule.IPlayFabResultCommon {
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface CreateServerMatchmakingTicketRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // How long to attempt matching this ticket in seconds.
    GiveUpAfterSeconds: number;
    // The users who will be part of this ticket.
    Members: MatchmakingPlayer[];
    // The Id of a match queue.
    QueueName: string;
}

interface CurrentServerStats {
    // The number of active multiplayer servers.
    Active: number;
    // The number of multiplayer servers still downloading game resources (such as assets).
    Propping: number;
    // The number of standingby multiplayer servers.
    StandingBy: number;
    // The total number of multiplayer servers.
    Total: number;
}

interface CustomDifferenceRuleExpansion {
    // Manually specify the values to use for each expansion interval (this overrides Difference, Delta, and MaxDifference).
    DifferenceOverrides: OverrideDouble[];
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface CustomRegionSelectionRuleExpansion {
    // Manually specify the maximum latency to use for each expansion interval.
    MaxLatencyOverrides: OverrideUnsignedInt[];
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface CustomSetIntersectionRuleExpansion {
    // Manually specify the values to use for each expansion interval.
    MinIntersectionSizeOverrides: OverrideUnsignedInt[];
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface CustomTeamDifferenceRuleExpansion {
    // Manually specify the team difference value to use for each expansion interval.
    DifferenceOverrides: OverrideDouble[];
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface CustomTeamSizeBalanceRuleExpansion {
    // Manually specify the team size difference to use for each expansion interval.
    DifferenceOverrides: OverrideUnsignedInt[];
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface DeleteAssetRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The filename of the asset to delete.
    FileName: string;
}

interface DeleteBuildAliasRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string alias ID of the alias to perform the action on.
    AliasId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface DeleteBuildRegionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string ID of the build we want to update regions for.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The build region to delete.
    Region: string;
}

interface DeleteBuildRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of the build to delete.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface DeleteCertificateRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The name of the certificate.
    Name: string;
}

interface DeleteContainerImageRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The container image repository we want to delete.
    ImageName?: string;
}

interface DeleteRemoteUserRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of the multiplayer server where the remote user is to delete.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The region of the multiplayer server where the remote user is to delete.
    Region: string;
    // The username of the remote user to delete.
    Username: string;
    // The virtual machine ID the multiplayer server is located on.
    VmId: string;
}

interface DifferenceRule {
    // Description of the attribute used by this rule to match tickets.
    Attribute: QueueRuleAttribute;
    // Describes the behavior when an attribute is not specified in the ticket creation request or in the user's entity
    // profile.
    AttributeNotSpecifiedBehavior: string;
    // Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule. When this
    // is set, Difference is ignored.
    CustomExpansion?: CustomDifferenceRuleExpansion;
    // The default value assigned to tickets that are missing the attribute specified by AttributePath (assuming that
    // AttributeNotSpecifiedBehavior is false). Optional.
    DefaultAttributeValue?: number;
    // The allowed difference between any two tickets at the start of matchmaking.
    Difference: number;
    // Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule.
    LinearExpansion?: LinearDifferenceRuleExpansion;
    // How values are treated when there are multiple players in a single ticket.
    MergeFunction: string;
    // Friendly name chosen by developer.
    Name: string;
    // How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be
    // prioritized over those that don't). Leave blank if this rule is always enforced.
    SecondsUntilOptional?: number;
    // The relative weight of this rule compared to others.
    Weight: number;
}

interface DynamicStandbySettings {
    // List of auto standing by trigger values and corresponding standing by multiplier. Defaults to 1.5X at 50%, 3X at 25%,
    // and 4X at 5%
    DynamicFloorMultiplierThresholds?: DynamicStandbyThreshold[];
    // When true, dynamic standby will be enabled
    IsEnabled: boolean;
    // The time it takes to reduce target standing by to configured floor value after an increase. Defaults to 30 minutes
    RampDownSeconds?: number;
}

interface DynamicStandbyThreshold {
    // When the trigger threshold is reached, multiply by this value
    Multiplier: number;
    // The multiplier will be applied when the actual standby divided by target standby floor is less than this value
    TriggerThresholdPercentage: number;
}

interface EmptyResponse extends PlayFabModule.IPlayFabResultCommon {}

interface EnableMultiplayerServersForTitleRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface EnableMultiplayerServersForTitleResponse extends PlayFabModule.IPlayFabResultCommon {
    // The enabled status for the multiplayer server features for the title.
    Status?: string;
}

interface EntityKey {
    // Unique ID of the entity.
    Id: string;
    // Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
    Type?: string;
}

interface GameCertificateReference {
    // An alias for the game certificate. The game server will reference this alias via GSDK config to retrieve the game
    // certificate. This alias is used as an identifier in game server code to allow a new certificate with different Name
    // field to be uploaded without the need to change any game server code to reference the new Name.
    GsdkAlias?: string;
    // The name of the game certificate. This name should match the name of a certificate that was previously uploaded to this
    // title.
    Name?: string;
}

interface GameCertificateReferenceParams {
    // An alias for the game certificate. The game server will reference this alias via GSDK config to retrieve the game
    // certificate. This alias is used as an identifier in game server code to allow a new certificate with different Name
    // field to be uploaded without the need to change any game server code to reference the new Name.
    GsdkAlias: string;
    // The name of the game certificate. This name should match the name of a certificate that was previously uploaded to this
    // title.
    Name: string;
}

interface GetAssetUploadUrlRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The asset's file name to get the upload URL for.
    FileName: string;
}

interface GetAssetUploadUrlResponse extends PlayFabModule.IPlayFabResultCommon {
    // The asset's upload URL.
    AssetUploadUrl?: string;
    // The asset's file name to get the upload URL for.
    FileName?: string;
}

interface GetBuildAliasRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string alias ID of the alias to perform the action on.
    AliasId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface GetBuildRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of the build to get.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface GetBuildResponse extends PlayFabModule.IPlayFabResultCommon {
    // When true, assets will not be copied for each server inside the VM. All serverswill run from the same set of assets, or
    // will have the same assets mounted in the container.
    AreAssetsReadonly?: boolean;
    // The guid string build ID of the build.
    BuildId?: string;
    // The build name.
    BuildName?: string;
    // The current build status. Valid values are - Deploying, Deployed, DeletingRegion, Unhealthy.
    BuildStatus?: string;
    // The flavor of container of he build.
    ContainerFlavor?: string;
    // The container command to run when the multiplayer server has been allocated, including any arguments. This only applies
    // to custom builds. If the build is a managed build, this field will be null.
    ContainerRunCommand?: string;
    // The time the build was created in UTC.
    CreationTime?: string;
    // The custom game container image for a custom build.
    CustomGameContainerImage?: ContainerImageReference;
    // The game assets for the build.
    GameAssetReferences?: AssetReference[];
    // The game certificates for the build.
    GameCertificateReferences?: GameCertificateReference[];
    // The instrumentation configuration of the build.
    InstrumentationConfiguration?: InstrumentationConfiguration;
    // Metadata of the build. The keys are case insensitive. The build metadata is made available to the server through Game
    // Server SDK (GSDK).
    Metadata?: { [key: string]: string | null };
    // The number of multiplayer servers to hosted on a single VM of the build.
    MultiplayerServerCountPerVm: number;
    // The OS platform used for running the game process.
    OsPlatform?: string;
    // The ports the build is mapped on.
    Ports?: Port[];
    // The region configuration for the build.
    RegionConfigurations?: BuildRegion[];
    // The type of game server being hosted.
    ServerType?: string;
    // The command to run when the multiplayer server has been allocated, including any arguments. This only applies to managed
    // builds. If the build is a custom build, this field will be null.
    StartMultiplayerServerCommand?: string;
    // When true, assets will be downloaded and uncompressed in memory, without the compressedversion being written first to
    // disc.
    UseStreamingForAssetDownloads?: boolean;
    // The VM size the build was created on.
    VmSize?: string;
}

interface GetContainerRegistryCredentialsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface GetContainerRegistryCredentialsResponse extends PlayFabModule.IPlayFabResultCommon {
    // The url of the container registry.
    DnsName?: string;
    // The password for accessing the container registry.
    Password?: string;
    // The username for accessing the container registry.
    Username?: string;
}

interface GetMatchmakingQueueRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The Id of the matchmaking queue to retrieve.
    QueueName?: string;
}

interface GetMatchmakingQueueResult extends PlayFabModule.IPlayFabResultCommon {
    // The matchmaking queue config.
    MatchmakingQueue?: MatchmakingQueueConfig;
}

interface GetMatchmakingTicketRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Determines whether the matchmaking attributes will be returned as an escaped JSON string or as an un-escaped JSON
    // object.
    EscapeObject: boolean;
    // The name of the queue to find a match for.
    QueueName: string;
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface GetMatchmakingTicketResult extends PlayFabModule.IPlayFabResultCommon {
    // The reason why the current ticket was canceled. This field is only set if the ticket is in canceled state.
    CancellationReasonString?: string;
    // The server date and time at which ticket was created.
    Created: string;
    // The Creator's entity key.
    Creator: EntityKey;
    // How long to attempt matching this ticket in seconds.
    GiveUpAfterSeconds: number;
    // The Id of a match.
    MatchId?: string;
    // A list of Users that have joined this ticket.
    Members: MatchmakingPlayer[];
    // A list of PlayFab Ids of Users to match with.
    MembersToMatchWith?: EntityKey[];
    // The Id of a match queue.
    QueueName: string;
    // The current ticket status. Possible values are: WaitingForPlayers, WaitingForMatch, WaitingForServer, Canceled and
    // Matched.
    Status: 'WaitingForPlayers' | 'WaitingForMatch' | 'WaitingForServer' | 'Canceled' | 'Matched';
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface GetMatchRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Determines whether the matchmaking attributes will be returned as an escaped JSON string or as an un-escaped JSON
    // object.
    EscapeObject: boolean;
    // The Id of a match.
    MatchId: string;
    // The name of the queue to join.
    QueueName: string;
    // Determines whether the matchmaking attributes for each user should be returned in the response for match request.
    ReturnMemberAttributes: boolean;
}

interface GetMatchResult extends PlayFabModule.IPlayFabResultCommon {
    // The Id of a match.
    MatchId: string;
    // A list of Users that are matched together, along with their team assignments.
    Members: MatchmakingPlayerWithTeamAssignment[];
    // A list of regions that the match could be played in sorted by preference. This value is only set if the queue has a
    // region selection rule.
    RegionPreferences?: string[];
    // The details of the server that the match has been allocated to.
    ServerDetails?: ServerDetails;
}

interface GetMultiplayerServerDetailsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of the multiplayer server to get details for.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The region the multiplayer server is located in to get details for.
    Region: string;
    // The title generated guid string session ID of the multiplayer server to get details for. This is to keep track of
    // multiplayer server sessions.
    SessionId: string;
}

interface GetMultiplayerServerDetailsResponse extends PlayFabModule.IPlayFabResultCommon {
    // The connected players in the multiplayer server.
    ConnectedPlayers?: ConnectedPlayer[];
    // The fully qualified domain name of the virtual machine that is hosting this multiplayer server.
    FQDN?: string;
    // The IPv4 address of the virtual machine that is hosting this multiplayer server.
    IPV4Address?: string;
    // The time (UTC) at which a change in the multiplayer server state was observed.
    LastStateTransitionTime?: string;
    // The ports the multiplayer server uses.
    Ports?: Port[];
    // The region the multiplayer server is located in.
    Region?: string;
    // The string server ID of the multiplayer server generated by PlayFab.
    ServerId?: string;
    // The guid string session ID of the multiplayer server.
    SessionId?: string;
    // The state of the multiplayer server.
    State?: string;
    // The virtual machine ID that the multiplayer server is located on.
    VmId?: string;
}

interface GetMultiplayerServerLogsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The server ID of multiplayer server to get logs for.
    ServerId: string;
}

interface GetMultiplayerServerLogsResponse extends PlayFabModule.IPlayFabResultCommon {
    // URL for logs download.
    LogDownloadUrl?: string;
}

interface GetMultiplayerSessionLogsBySessionIdRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The server ID of multiplayer server to get logs for.
    SessionId: string;
}

interface GetQueueStatisticsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The name of the queue.
    QueueName: string;
}

interface GetQueueStatisticsResult extends PlayFabModule.IPlayFabResultCommon {
    // The current number of players in the matchmaking queue, who are waiting to be matched.
    NumberOfPlayersMatching?: number;
    // Statistics representing the time (in seconds) it takes for tickets to find a match.
    TimeToMatchStatisticsInSeconds?: Statistics;
}

interface GetRemoteLoginEndpointRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of the multiplayer server to get remote login information for.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The region of the multiplayer server to get remote login information for.
    Region: string;
    // The virtual machine ID the multiplayer server is located on.
    VmId: string;
}

interface GetRemoteLoginEndpointResponse extends PlayFabModule.IPlayFabResultCommon {
    // The remote login IPV4 address of multiplayer server.
    IPV4Address?: string;
    // The remote login port of multiplayer server.
    Port: number;
}

interface GetServerBackfillTicketRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Determines whether the matchmaking attributes will be returned as an escaped JSON string or as an un-escaped JSON
    // object.
    EscapeObject: boolean;
    // The name of the queue to find a match for.
    QueueName: string;
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface GetServerBackfillTicketResult extends PlayFabModule.IPlayFabResultCommon {
    // The reason why the current ticket was canceled. This field is only set if the ticket is in canceled state.
    CancellationReasonString?: string;
    // The server date and time at which ticket was created.
    Created: string;
    // How long to attempt matching this ticket in seconds.
    GiveUpAfterSeconds: number;
    // The Id of a match.
    MatchId?: string;
    // A list of Users that are part of this ticket, along with their team assignments.
    Members: MatchmakingPlayerWithTeamAssignment[];
    // The Id of a match queue.
    QueueName: string;
    // The details of the server the members are connected to.
    ServerDetails: ServerDetails;
    // The current ticket status. Possible values are: WaitingForMatch, Canceled and Matched.
    Status: string;
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface GetTitleEnabledForMultiplayerServersStatusRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface GetTitleEnabledForMultiplayerServersStatusResponse extends PlayFabModule.IPlayFabResultCommon {
    // The enabled status for the multiplayer server features for the title.
    Status?: string;
}

interface GetTitleMultiplayerServersQuotasRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface GetTitleMultiplayerServersQuotasResponse extends PlayFabModule.IPlayFabResultCommon {
    // The various quotas for multiplayer servers for the title.
    Quotas?: TitleMultiplayerServersQuotas;
}

interface InstrumentationConfiguration {
    // The list of processes to be monitored on a VM for this build. Providing processes will turn on performance metrics
    // collection for this build. Process names should not include extensions. If the game server process is: GameServer.exe;
    // then, ProcessesToMonitor = [ GameServer ]
    ProcessesToMonitor?: string[];
}

interface JoinMatchmakingTicketRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The User who wants to join the ticket. Their Id must be listed in PlayFabIdsToMatchWith.
    Member: MatchmakingPlayer;
    // The name of the queue to join.
    QueueName: string;
    // The Id of the ticket to find a match for.
    TicketId: string;
}

interface JoinMatchmakingTicketResult extends PlayFabModule.IPlayFabResultCommon {}

interface LinearDifferenceRuleExpansion {
    // This value gets added to Difference at every expansion interval.
    Delta: number;
    // Once the total difference reaches this value, expansion stops. Optional.
    Limit?: number;
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface LinearRegionSelectionRuleExpansion {
    // This value gets added to MaxLatency at every expansion interval.
    Delta: number;
    // Once the max Latency reaches this value, expansion stops.
    Limit: number;
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface LinearSetIntersectionRuleExpansion {
    // This value gets added to MinIntersectionSize at every expansion interval.
    Delta: number;
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface LinearTeamDifferenceRuleExpansion {
    // This value gets added to Difference at every expansion interval.
    Delta: number;
    // Once the total difference reaches this value, expansion stops. Optional.
    Limit?: number;
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface LinearTeamSizeBalanceRuleExpansion {
    // This value gets added to Difference at every expansion interval.
    Delta: number;
    // Once the total difference reaches this value, expansion stops. Optional.
    Limit?: number;
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface LinuxInstrumentationConfiguration {
    // Designates whether Linux instrumentation configuration will be enabled for this Build
    IsEnabled: boolean;
}

interface ListAssetSummariesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The page size for the request.
    PageSize?: number;
    // The skip token for the paged request.
    SkipToken?: string;
}

interface ListAssetSummariesResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of asset summaries.
    AssetSummaries?: AssetSummary[];
    // The page size on the response.
    PageSize: number;
    // The skip token for the paged response.
    SkipToken?: string;
}

interface ListBuildAliasesForTitleResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of build aliases for the title
    BuildAliases?: BuildAliasDetailsResponse[];
}

interface ListBuildSummariesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The page size for the request.
    PageSize?: number;
    // The skip token for the paged request.
    SkipToken?: string;
}

interface ListBuildSummariesResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of build summaries for a title.
    BuildSummaries?: BuildSummary[];
    // The page size on the response.
    PageSize: number;
    // The skip token for the paged response.
    SkipToken?: string;
}

interface ListCertificateSummariesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The page size for the request.
    PageSize?: number;
    // The skip token for the paged request.
    SkipToken?: string;
}

interface ListCertificateSummariesResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of game certificates.
    CertificateSummaries?: CertificateSummary[];
    // The page size on the response.
    PageSize: number;
    // The skip token for the paged response.
    SkipToken?: string;
}

interface ListContainerImagesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The page size for the request.
    PageSize?: number;
    // The skip token for the paged request.
    SkipToken?: string;
}

interface ListContainerImagesResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of container images.
    Images?: string[];
    // The page size on the response.
    PageSize: number;
    // The skip token for the paged response.
    SkipToken?: string;
}

interface ListContainerImageTagsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The container images we want to list tags for.
    ImageName?: string;
}

interface ListContainerImageTagsResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of tags for a particular container image.
    Tags?: string[];
}

interface ListMatchmakingQueuesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface ListMatchmakingQueuesResult extends PlayFabModule.IPlayFabResultCommon {
    // The list of matchmaking queue configs for this title.
    MatchMakingQueues?: MatchmakingQueueConfig[];
}

interface ListMatchmakingTicketsForPlayerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity key for which to find the ticket Ids.
    Entity?: EntityKey;
    // The name of the queue to find a match for.
    QueueName: string;
}

interface ListMatchmakingTicketsForPlayerResult extends PlayFabModule.IPlayFabResultCommon {
    // The list of ticket Ids the user is a member of.
    TicketIds: string[];
}

interface ListMultiplayerServersRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of the multiplayer servers to list.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The page size for the request.
    PageSize?: number;
    // The region the multiplayer servers to list.
    Region: string;
    // The skip token for the paged request.
    SkipToken?: string;
}

interface ListMultiplayerServersResponse extends PlayFabModule.IPlayFabResultCommon {
    // The list of multiplayer server summary details.
    MultiplayerServerSummaries?: MultiplayerServerSummary[];
    // The page size on the response.
    PageSize: number;
    // The skip token for the paged response.
    SkipToken?: string;
}

interface ListPartyQosServersRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface ListPartyQosServersResponse extends PlayFabModule.IPlayFabResultCommon {
    // The page size on the response.
    PageSize: number;
    // The list of QoS servers.
    QosServers?: QosServer[];
    // The skip token for the paged response.
    SkipToken?: string;
}

interface ListQosServersForTitleRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Indicates that the response should contain Qos servers for all regions, including those where there are no builds
    // deployed for the title.
    IncludeAllRegions: boolean;
}

interface ListQosServersForTitleResponse extends PlayFabModule.IPlayFabResultCommon {
    // The page size on the response.
    PageSize: number;
    // The list of QoS servers.
    QosServers?: QosServer[];
    // The skip token for the paged response.
    SkipToken?: string;
}

interface ListServerBackfillTicketsForPlayerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity key for which to find the ticket Ids.
    Entity: EntityKey;
    // The name of the queue the tickets are in.
    QueueName: string;
}

interface ListServerBackfillTicketsForPlayerResult extends PlayFabModule.IPlayFabResultCommon {
    // The list of backfill ticket Ids the user is a member of.
    TicketIds: string[];
}

interface ListVirtualMachineSummariesRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of the virtual machines to list.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The page size for the request.
    PageSize?: number;
    // The region of the virtual machines to list.
    Region: string;
    // The skip token for the paged request.
    SkipToken?: string;
}

interface ListVirtualMachineSummariesResponse extends PlayFabModule.IPlayFabResultCommon {
    // The page size on the response.
    PageSize: number;
    // The skip token for the paged response.
    SkipToken?: string;
    // The list of virtual machine summaries.
    VirtualMachines?: VirtualMachineSummary[];
}

interface MatchmakingPlayer {
    // The user's attributes custom to the title.
    Attributes?: MatchmakingPlayerAttributes;
    // The entity key of the matchmaking user.
    Entity: EntityKey;
}

interface MatchmakingPlayerAttributes {
    // A data object representing a user's attributes.
    DataObject?: any;
    // An escaped data object representing a user's attributes.
    EscapedDataObject?: string;
}

interface MatchmakingPlayerWithTeamAssignment {
    // The user's attributes custom to the title. These attributes will be null unless the request has ReturnMemberAttributes
    // flag set to true.
    Attributes?: MatchmakingPlayerAttributes;
    // The entity key of the matchmaking user.
    Entity: EntityKey;
    // The Id of the team the User is assigned to.
    TeamId?: string;
}

interface MatchmakingQueueConfig {
    // This is the buildId that will be used to allocate the multiplayer server for the match.
    BuildId?: string;
    // List of difference rules used to find an optimal match.
    DifferenceRules?: DifferenceRule[];
    // List of match total rules used to find an optimal match.
    MatchTotalRules?: MatchTotalRule[];
    // Maximum number of players in a match.
    MaxMatchSize: number;
    // Maximum number of players in a ticket. Optional.
    MaxTicketSize?: number;
    // Minimum number of players in a match.
    MinMatchSize: number;
    // Unique identifier for a Queue. Chosen by the developer.
    Name: string;
    // Region selection rule used to find an optimal match.
    RegionSelectionRule?: RegionSelectionRule;
    // Boolean flag to enable server allocation for the queue.
    ServerAllocationEnabled: boolean;
    // List of set intersection rules used to find an optimal match.
    SetIntersectionRules?: SetIntersectionRule[];
    // Controls which statistics are visible to players.
    StatisticsVisibilityToPlayers?: StatisticsVisibilityToPlayers;
    // List of string equality rules used to find an optimal match.
    StringEqualityRules?: StringEqualityRule[];
    // List of team difference rules used to find an optimal match.
    TeamDifferenceRules?: TeamDifferenceRule[];
    // The team configuration for a match. This may be null if there are no teams.
    Teams?: MatchmakingQueueTeam[];
    // Team size balance rule used to find an optimal match.
    TeamSizeBalanceRule?: TeamSizeBalanceRule;
    // Team ticket size similarity rule used to find an optimal match.
    TeamTicketSizeSimilarityRule?: TeamTicketSizeSimilarityRule;
}

interface MatchmakingQueueTeam {
    // The maximum number of players required for the team.
    MaxTeamSize: number;
    // The minimum number of players required for the team.
    MinTeamSize: number;
    // A name to identify the team. This is case insensitive.
    Name: string;
}

interface MatchTotalRule {
    // Description of the attribute used by this rule to match tickets.
    Attribute: QueueRuleAttribute;
    // Collection of fields relating to expanding this rule at set intervals.
    Expansion?: MatchTotalRuleExpansion;
    // The maximum total value for a group. Must be >= Min.
    Max: number;
    // The minimum total value for a group. Must be >=2.
    Min: number;
    // Friendly name chosen by developer.
    Name: string;
    // How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be
    // prioritized over those that don't). Leave blank if this rule is always enforced.
    SecondsUntilOptional?: number;
    // The relative weight of this rule compared to others.
    Weight: number;
}

interface MatchTotalRuleExpansion {
    // Manually specify the values to use for each expansion interval. When this is set, Max is ignored.
    MaxOverrides?: OverrideDouble[];
    // Manually specify the values to use for each expansion interval. When this is set, Min is ignored.
    MinOverrides?: OverrideDouble[];
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface MultiplayerEmptyRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface MultiplayerServerSummary {
    // The connected players in the multiplayer server.
    ConnectedPlayers?: ConnectedPlayer[];
    // The time (UTC) at which a change in the multiplayer server state was observed.
    LastStateTransitionTime?: string;
    // The region the multiplayer server is located in.
    Region?: string;
    // The string server ID of the multiplayer server generated by PlayFab.
    ServerId?: string;
    // The title generated guid string session ID of the multiplayer server.
    SessionId?: string;
    // The state of the multiplayer server.
    State?: string;
    // The virtual machine ID that the multiplayer server is located on.
    VmId?: string;
}

type OsPlatform = "Windows"
    | "Linux";

interface OverrideDouble {
    // The custom expansion value.
    Value: number;
}

interface OverrideUnsignedInt {
    // The custom expansion value.
    Value: number;
}

interface Port {
    // The name for the port.
    Name: string;
    // The number for the port.
    Num: number;
    // The protocol for the port.
    Protocol: string;
}

type ProtocolType = "TCP"
    | "UDP";

interface QosServer {
    // The region the QoS server is located in.
    Region?: string;
    // The QoS server URL.
    ServerUrl?: string;
}

interface QueueRuleAttribute {
    // Specifies which attribute in a ticket to use.
    Path: string;
    // Specifies which source the attribute comes from.
    Source: string;
}

interface RegionSelectionRule {
    // Controls how the Max Latency parameter expands over time. Only one expansion can be set per rule. When this is set,
    // MaxLatency is ignored.
    CustomExpansion?: CustomRegionSelectionRuleExpansion;
    // Controls how the Max Latency parameter expands over time. Only one expansion can be set per rule.
    LinearExpansion?: LinearRegionSelectionRuleExpansion;
    // Specifies the maximum latency that is allowed between the client and the selected server. The value is in milliseconds.
    MaxLatency: number;
    // Friendly name chosen by developer.
    Name: string;
    // Specifies which attribute in a ticket to use.
    Path: string;
    // How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be
    // prioritized over those that don't). Leave blank if this rule is always enforced.
    SecondsUntilOptional?: number;
    // The relative weight of this rule compared to others.
    Weight: number;
}

interface RemoveMatchmakingQueueRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The Id of the matchmaking queue to remove.
    QueueName?: string;
}

interface RemoveMatchmakingQueueResult extends PlayFabModule.IPlayFabResultCommon {}

interface RequestMultiplayerServerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The identifiers of the build alias to use for the request.
    BuildAliasParams?: BuildAliasParams;
    // The guid string build ID of the multiplayer server to request.
    BuildId?: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Initial list of players (potentially matchmade) allowed to connect to the game. This list is passed to the game server
    // when requested (via GSDK) and can be used to validate players connecting to it.
    InitialPlayers?: string[];
    // The preferred regions to request a multiplayer server from. The Multiplayer Service will iterate through the regions in
    // the specified order and allocate a server from the first one that has servers available.
    PreferredRegions: string[];
    // Data encoded as a string that is passed to the game server when requested. This can be used to to communicate
    // information such as game mode or map through the request flow.
    SessionCookie?: string;
    // A guid string session ID created track the multiplayer server session over its life.
    SessionId: string;
}

interface RequestMultiplayerServerResponse extends PlayFabModule.IPlayFabResultCommon {
    // The connected players in the multiplayer server.
    ConnectedPlayers?: ConnectedPlayer[];
    // The fully qualified domain name of the virtual machine that is hosting this multiplayer server.
    FQDN?: string;
    // The IPv4 address of the virtual machine that is hosting this multiplayer server.
    IPV4Address?: string;
    // The time (UTC) at which a change in the multiplayer server state was observed.
    LastStateTransitionTime?: string;
    // The ports the multiplayer server uses.
    Ports?: Port[];
    // The region the multiplayer server is located in.
    Region?: string;
    // The string server ID of the multiplayer server generated by PlayFab.
    ServerId?: string;
    // The guid string session ID of the multiplayer server.
    SessionId?: string;
    // The state of the multiplayer server.
    State?: string;
    // The virtual machine ID that the multiplayer server is located on.
    VmId?: string;
}

interface RolloverContainerRegistryCredentialsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface RolloverContainerRegistryCredentialsResponse extends PlayFabModule.IPlayFabResultCommon {
    // The url of the container registry.
    DnsName?: string;
    // The password for accessing the container registry.
    Password?: string;
    // The username for accessing the container registry.
    Username?: string;
}

interface ServerDetails {
    // The IPv4 address of the virtual machine that is hosting this multiplayer server.
    IPV4Address?: string;
    // The ports the multiplayer server uses.
    Ports?: Port[];
    // The server's region.
    Region?: string;
}

type ServerType = "Container"
    | "Process";

interface SetIntersectionRule {
    // Description of the attribute used by this rule to match tickets.
    Attribute: QueueRuleAttribute;
    // Describes the behavior when an attribute is not specified in the ticket creation request or in the user's entity
    // profile.
    AttributeNotSpecifiedBehavior: string;
    // Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule. When this
    // is set, MinIntersectionSize is ignored.
    CustomExpansion?: CustomSetIntersectionRuleExpansion;
    // The default value assigned to tickets that are missing the attribute specified by AttributePath (assuming that
    // AttributeNotSpecifiedBehavior is UseDefault). Values must be unique.
    DefaultAttributeValue?: string[];
    // Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule.
    LinearExpansion?: LinearSetIntersectionRuleExpansion;
    // The minimum number of values that must match between sets.
    MinIntersectionSize: number;
    // Friendly name chosen by developer.
    Name: string;
    // How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be
    // prioritized over those that don't). Leave blank if this rule is always enforced.
    SecondsUntilOptional?: number;
    // The relative weight of this rule compared to others.
    Weight: number;
}

interface SetMatchmakingQueueRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The matchmaking queue config.
    MatchmakingQueue?: MatchmakingQueueConfig;
}

interface SetMatchmakingQueueResult extends PlayFabModule.IPlayFabResultCommon {}

interface ShutdownMultiplayerServerRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string build ID of the multiplayer server to delete.
    BuildId: string;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The region of the multiplayer server to shut down.
    Region: string;
    // A guid string session ID of the multiplayer server to shut down.
    SessionId: string;
}

interface Statistics {
    // The average.
    Average: number;
    // The 50th percentile.
    Percentile50: number;
    // The 90th percentile.
    Percentile90: number;
    // The 99th percentile.
    Percentile99: number;
}

interface StatisticsVisibilityToPlayers {
    // Whether to allow players to view the current number of players in the matchmaking queue.
    ShowNumberOfPlayersMatching: boolean;
    // Whether to allow players to view statistics representing the time it takes for tickets to find a match.
    ShowTimeToMatch: boolean;
}

interface StringEqualityRule {
    // Description of the attribute used by this rule to match tickets.
    Attribute: QueueRuleAttribute;
    // Describes the behavior when an attribute is not specified in the ticket creation request or in the user's entity
    // profile.
    AttributeNotSpecifiedBehavior: string;
    // The default value assigned to tickets that are missing the attribute specified by AttributePath (assuming that
    // AttributeNotSpecifiedBehavior is false).
    DefaultAttributeValue?: string;
    // Collection of fields relating to expanding this rule at set intervals. For StringEqualityRules, this is limited to
    // turning the rule off or on during different intervals.
    Expansion?: StringEqualityRuleExpansion;
    // Friendly name chosen by developer.
    Name: string;
    // How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be
    // prioritized over those that don't). Leave blank if this rule is always enforced.
    SecondsUntilOptional?: number;
    // The relative weight of this rule compared to others.
    Weight: number;
}

interface StringEqualityRuleExpansion {
    // List of bools specifying whether the rule is applied during this expansion.
    EnabledOverrides: boolean[];
    // How many seconds before this rule is expanded.
    SecondsBetweenExpansions: number;
}

interface TeamDifferenceRule {
    // Description of the attribute used by this rule to match teams.
    Attribute: QueueRuleAttribute;
    // Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule. When this
    // is set, Difference is ignored.
    CustomExpansion?: CustomTeamDifferenceRuleExpansion;
    // The default value assigned to tickets that are missing the attribute specified by AttributePath (assuming that
    // AttributeNotSpecifiedBehavior is false).
    DefaultAttributeValue: number;
    // The allowed difference between any two teams at the start of matchmaking.
    Difference: number;
    // Collection of fields relating to expanding this rule at set intervals. Only one expansion can be set per rule.
    LinearExpansion?: LinearTeamDifferenceRuleExpansion;
    // Friendly name chosen by developer.
    Name: string;
    // How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be
    // prioritized over those that don't). Leave blank if this rule is always enforced.
    SecondsUntilOptional?: number;
}

interface TeamSizeBalanceRule {
    // Controls how the Difference parameter expands over time. Only one expansion can be set per rule. When this is set,
    // Difference is ignored.
    CustomExpansion?: CustomTeamSizeBalanceRuleExpansion;
    // The allowed difference in team size between any two teams.
    Difference: number;
    // Controls how the Difference parameter expands over time. Only one expansion can be set per rule.
    LinearExpansion?: LinearTeamSizeBalanceRuleExpansion;
    // Friendly name chosen by developer.
    Name: string;
    // How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be
    // prioritized over those that don't). Leave blank if this rule is always enforced.
    SecondsUntilOptional?: number;
}

interface TeamTicketSizeSimilarityRule {
    // Friendly name chosen by developer.
    Name: string;
    // How many seconds before this rule is no longer enforced (but tickets that comply with this rule will still be
    // prioritized over those that don't). Leave blank if this rule is always enforced.
    SecondsUntilOptional?: number;
}

type TitleMultiplayerServerEnabledStatus = "Initializing"
    | "Enabled"
    | "Disabled";

interface TitleMultiplayerServersQuotas {
    // The core capacity for the various regions and VM Family
    CoreCapacities?: CoreCapacity[];
}

interface UntagContainerImageRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The container image which tag we want to remove.
    ImageName?: string;
    // The tag we want to remove.
    Tag?: string;
}

interface UpdateBuildAliasRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string alias Id of the alias to be updated.
    AliasId: string;
    // The alias name.
    AliasName?: string;
    // Array of build selection criteria.
    BuildSelectionCriteria?: BuildSelectionCriterion[];
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface UpdateBuildRegionRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string ID of the build we want to update regions for.
    BuildId: string;
    // The updated region configuration that should be applied to the specified build.
    BuildRegion: BuildRegionParams;
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface UpdateBuildRegionsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The guid string ID of the build we want to update regions for.
    BuildId: string;
    // The updated region configuration that should be applied to the specified build.
    BuildRegions: BuildRegionParams[];
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface UploadCertificateRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The game certificate to upload.
    GameCertificate: Certificate;
}

interface VirtualMachineSummary {
    // The virtual machine health status.
    HealthStatus?: string;
    // The virtual machine state.
    State?: string;
    // The virtual machine ID.
    VmId?: string;
}