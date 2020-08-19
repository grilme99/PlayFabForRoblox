/// <reference path="PlayFab.d.ts" />

type AnalysisTaskState = "Waiting"
    | "ReadyForSubmission"
    | "SubmittingToPipeline"
    | "Running"
    | "Completed"
    | "Failed"
    | "Canceled";

interface CreateExperimentRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Description of the experiment.
    Description?: string;
    // The duration of the experiment, in days.
    Duration: number;
    // Type of experiment.
    ExperimentType?: string;
    // Friendly name of the experiment.
    Name: string;
    // Id of the segment to which this experiment applies. Defaults to the 'All Players' segment.
    SegmentId?: string;
    // When experiment should start.
    StartDate: string;
    // List of title player account IDs that automatically receive treatments in the experiment, but are not included when
    // calculating experiment metrics.
    TitlePlayerAccountTestIds?: string[];
    // List of variants for the experiment.
    Variants: Variant[];
}

interface CreateExperimentResult extends PlayFabModule.IPlayFabResultCommon {
    // The ID of the new experiment.
    ExperimentId?: string;
}

interface DeleteExperimentRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The ID of the experiment to delete.
    ExperimentId: string;
}

interface EmptyResponse extends PlayFabModule.IPlayFabResultCommon {}

interface EntityKey {
    // Unique ID of the entity.
    Id: string;
    // Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types
    Type?: string;
}

interface Experiment {
    // Description of the experiment.
    Description?: string;
    // The duration of the experiment, in days.
    Duration: number;
    // Type of experiment.
    ExperimentType?: string;
    // Id of the experiment.
    Id?: string;
    // Friendly name of the experiment.
    Name?: string;
    // Id of the segment to which this experiment applies. Defaults to the 'All Players' segment.
    SegmentId?: string;
    // When experiment should start/was started.
    StartDate: string;
    // State experiment is currently in.
    State?: string;
    // List of title player account IDs that automatically receive treatments in the experiment, but are not included when
    // calculating experiment metrics.
    TitlePlayerAccountTestIds?: string[];
    // List of variants for the experiment.
    Variants?: Variant[];
}

type ExperimentState = "New"
    | "Started"
    | "Stopped"
    | "Deleted";

type ExperimentType = "Active"
    | "Snapshot";

interface GetExperimentsRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
}

interface GetExperimentsResult extends PlayFabModule.IPlayFabResultCommon {
    // List of experiments for the title.
    Experiments?: Experiment[];
}

interface GetLatestScorecardRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The ID of the experiment.
    ExperimentId?: string;
}

interface GetLatestScorecardResult extends PlayFabModule.IPlayFabResultCommon {
    // Scorecard for the experiment of the title.
    Scorecard?: Scorecard;
}

interface GetTreatmentAssignmentRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The entity to perform this action on.
    Entity?: EntityKey;
}

interface GetTreatmentAssignmentResult extends PlayFabModule.IPlayFabResultCommon {
    // Treatment assignment for the entity.
    TreatmentAssignment?: TreatmentAssignment;
}

interface MetricData {
    // The upper bound of the confidence interval for the relative delta (Delta.RelativeValue).
    ConfidenceIntervalEnd: number;
    // The lower bound of the confidence interval for the relative delta (Delta.RelativeValue).
    ConfidenceIntervalStart: number;
    // The absolute delta between TreatmentStats.Average and ControlStats.Average.
    DeltaAbsoluteChange: number;
    // The relative delta ratio between TreatmentStats.Average and ControlStats.Average.
    DeltaRelativeChange: number;
    // The machine name of the metric.
    InternalName?: string;
    // Indicates if a movement was detected on that metric.
    Movement?: string;
    // The readable name of the metric.
    Name?: string;
    // The expectation that a movement is real
    PMove: number;
    // The p-value resulting from the statistical test run for this metric
    PValue: number;
    // The threshold for observing sample ratio mismatch.
    PValueThreshold: number;
    // Indicates if the movement is statistically significant.
    StatSigLevel?: string;
    // Observed standard deviation value of the metric.
    StdDev: number;
    // Observed average value of the metric.
    Value: number;
}

interface Scorecard {
    // Represents the date the scorecard was generated.
    DateGenerated?: string;
    // Represents the duration of scorecard analysis.
    Duration?: string;
    // Represents the number of events processed for the generation of this scorecard
    EventsProcessed: number;
    // Id of the experiment.
    ExperimentId?: string;
    // Friendly name of the experiment.
    ExperimentName?: string;
    // Represents the latest compute job status.
    LatestJobStatus?: string;
    // Represents the presence of a sample ratio mismatch in the scorecard data.
    SampleRatioMismatch: boolean;
    // Scorecard containing list of analysis.
    ScorecardDataRows?: ScorecardDataRow[];
}

interface ScorecardDataRow {
    // Represents whether the variant is control or not.
    IsControl: boolean;
    // Data of the analysis with the internal name of the metric as the key and an object of metric data as value.
    MetricDataRows?: { [key: string]: MetricData };
    // Represents the player count in the variant.
    PlayerCount: number;
    // Name of the variant of analysis.
    VariantName?: string;
}

interface StartExperimentRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The ID of the experiment to start.
    ExperimentId: string;
}

interface StopExperimentRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // The ID of the experiment to stop.
    ExperimentId: string;
}

interface TreatmentAssignment {
    // List of the experiment variables.
    Variables?: Variable[];
    // List of the experiment variants.
    Variants?: string[];
}

interface UpdateExperimentRequest extends PlayFabModule.IPlayFabRequestCommon {
    // The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
    CustomTags?: { [key: string]: string | null };
    // Description of the experiment.
    Description?: string;
    // The duration of the experiment, in days.
    Duration: number;
    // Type of experiment.
    ExperimentType?: string;
    // Id of the experiment.
    Id: string;
    // Friendly name of the experiment.
    Name: string;
    // Id of the segment to which this experiment applies. Defaults to the 'All Players' segment.
    SegmentId?: string;
    // When experiment should start.
    StartDate: string;
    // List of title player account IDs that automatically receive treatments in the experiment, but are not included when
    // calculating experiment metrics.
    TitlePlayerAccountTestIds?: string[];
    // List of variants for the experiment.
    Variants: Variant[];
}

interface Variable {
    // Name of the variable.
    Name: string;
    // Value of the variable.
    Value?: string;
}

interface Variant {
    // Description of the variant.
    Description?: string;
    // Id of the variant.
    Id?: string;
    // Specifies if variant is control for experiment.
    IsControl: boolean;
    // Name of the variant.
    Name: string;
    // Id of the TitleDataOverride to use with this variant.
    TitleDataOverrideLabel?: string;
    // Percentage of target audience traffic that will see this variant.
    TrafficPercentage: number;
    // Variables returned by this variant.
    Variables?: Variable[];
}