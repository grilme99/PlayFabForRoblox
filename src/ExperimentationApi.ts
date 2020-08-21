/// <reference path="ExperimentationApiTypes.d.ts" />

import MakeRequest from './HTTP'
import Settings from './Settings'

/**
 * Creates a new experiment for a title.
 * https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/createexperiment
 */
export const CreateExperiment = async (request: CreateExperimentRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<CreateExperimentResult>('/Experimentation/CreateExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Deletes an existing experiment for a title.
 * https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/deleteexperiment
 */
export const DeleteExperiment = async (request: DeleteExperimentRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Experimentation/DeleteExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Gets the details of all experiments for a title.
 * https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getexperiments
 */
export const GetExperiments = async (request: GetExperimentsRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<GetExperimentsResult>('/Experimentation/GetExperiments', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Gets the latest scorecard of the experiment for the title.
 * https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/getlatestscorecard
 */
export const GetLatestScorecard = async (request: GetLatestScorecardRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<GetLatestScorecardResult>('/Experimentation/GetLatestScorecard', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Gets the treatment assignments for a player for every running experiment in the title.
 * https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/gettreatmentassignment
 */
export const GetTreatmentAssignment = async (request: GetTreatmentAssignmentRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<GetTreatmentAssignmentResult>('/Experimentation/GetTreatmentAssignment', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Starts an existing experiment for a title.
 * https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/startexperiment
 */
export const StartExperiment = async (request: StartExperimentRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Experimentation/StartExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Stops an existing experiment for a title.
 * https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/stopexperiment
 */
export const StopExperiment = async (request: StopExperimentRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Experimentation/StopExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}

/**
 * Updates an existing experiment for a title.
 * https://docs.microsoft.com/rest/api/playfab/experimentation/experimentation/updateexperiment
 */
export const UpdateExperiment = async (request: UpdateExperimentRequest) => {
    if (Settings._internalSettings.entityToken === '') throw 'Must have Settings._internalSettings.entityToken set to call this method'
    const result = await MakeRequest<EmptyResponse>('/Experimentation/UpdateExperiment', request, 'X-EntityToken', Settings._internalSettings.entityToken)
    return result
}