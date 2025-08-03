--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

local Types = require(script.Parent.Types)

local Common = require(script.Parent.Parent.PlayFabCommon)
local makeApiCall = Common.makeApiCall
type Result<T, E> = Common.Result<T, E>

local Apis = {}

--[[
	Gets the specified leaderboard definition.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/getleaderboarddefinition).

	### Errors
	- ApiNotEnabledForTitle
	- LeaderboardColumnLengthMismatchWithStatDefinition
	- LeaderboardNotFound

]]
function Apis.GetLeaderboardDefinition(request: Types.GetLeaderboardDefinitionRequest, entityToken: string): Result<Types.GetLeaderboardDefinitionResponse, string>
	return makeApiCall(
		"/Leaderboard/GetLeaderboardDefinition",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Creates a new leaderboard definition.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/createleaderboarddefinition).

	### Errors
	- ApiNotEnabledForTitle
	- DuplicateColumnNameFound
	- DuplicateLinkedStatisticColumnNameFound
	- EntityTypeMismatchWithStatDefinition
	- ExternalEntityNotAllowedForTier
	- InvalidBaseTimeForInterval
	- LeaderboardCountLimitExceeded
	- LeaderboardNameConflict
	- LeaderboardSizeLimitExceeded
	- LinkedStatisticColumnMismatch
	- LinkedStatisticColumnNotFound
	- LinkedStatisticColumnRequired
	- LinkingStatsNotAllowedForEntityType
	- MaxQueryableVersionsValueNotAllowedForTier
	- MultipleLinkedStatisticsNotAllowed
	- StatDefinitionAlreadyLinkedToLeaderboard
	- StatisticNotFound

]]
function Apis.CreateLeaderboardDefinition(request: Types.CreateLeaderboardDefinitionRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Leaderboard/CreateLeaderboardDefinition",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets statistics for the specified collection of entities.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/getstatisticsforentities).

	### Errors
	- InvalidEntityType
	- NotAuthorized
	- StatisticNotFound

]]
function Apis.GetStatisticsForEntities(request: Types.GetStatisticsForEntitiesRequest, entityToken: string): Result<Types.GetStatisticsForEntitiesResponse, string>
	return makeApiCall(
		"/Statistic/GetStatisticsForEntities",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Updates a leaderboard definition.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/updateleaderboarddefinition).

	### Errors
	- LeaderboardSizeLimitExceeded
	- MaxQueryableVersionsValueNotAllowedForTier
	- ResetIntervalCannotBeModified

]]
function Apis.UpdateLeaderboardDefinition(request: Types.UpdateLeaderboardDefinitionRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Leaderboard/UpdateLeaderboardDefinition",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Lists the leaderboard definitions defined for the Title.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/listleaderboarddefinitions).

]]
function Apis.ListLeaderboardDefinitions(request: Types.ListLeaderboardDefinitionsRequest, entityToken: string): Result<Types.ListLeaderboardDefinitionsResponse, string>
	return makeApiCall(
		"/Leaderboard/ListLeaderboardDefinitions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Update statistics on an entity profile. Depending on the statistic
	definition, this may result in entity being ranked on various leaderboards.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/updatestatistics).

	### Errors
	- APINotEnabledForGameClientAccess
	- EntityTypeMismatchWithStatDefinition
	- InvalidEntityType
	- InvalidExternalEntityId
	- NotAuthorized
	- StatisticColumnLengthMismatch
	- StatisticNotFound
	- TransactionAlreadyApplied
	- UpdatingStatisticsUsingTransactionIdNotAvailableForFreeTier

]]
function Apis.UpdateStatistics(request: Types.UpdateStatisticsRequest, entityToken: string): Result<Types.UpdateStatisticsResponse, string>
	return makeApiCall(
		"/Statistic/UpdateStatistics",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Increment an entity statistic definition version.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/incrementstatisticversion).

	### Errors
	- StatisticNotFound
	- StatisticUpdateInProgress
	- StatisticVersionIncrementRateExceeded
	- VersionIncrementRateExceeded

]]
function Apis.IncrementStatisticVersion(request: Types.IncrementStatisticVersionRequest, entityToken: string): Result<Types.IncrementStatisticVersionResponse, string>
	return makeApiCall(
		"/Statistic/IncrementStatisticVersion",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get the leaderboard for a specific entity type and statistic.

	Request to load a leaderboard.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/getleaderboard).

	### Errors
	- LeaderboardNotFound
	- NoLeaderboardForStatistic
	- SpecifiedVersionLeaderboardNotFound
	- StatisticNotFound

]]
function Apis.GetLeaderboard(request: Types.GetEntityLeaderboardRequest, entityToken: string): Result<Types.GetEntityLeaderboardResponse, string>
	return makeApiCall(
		"/Leaderboard/GetLeaderboard",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes the specified entries from the given leaderboard.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/deleteleaderboardentries).

	### Errors
	- ApiNotEnabledForTitle
	- LeaderboardNotFound
	- LeaderboardUpdateNotAllowedWhileLinked

]]
function Apis.DeleteLeaderboardEntries(request: Types.DeleteLeaderboardEntriesRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Leaderboard/DeleteLeaderboardEntries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Update an existing entity statistic definition.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/updatestatisticdefinition).

	### Errors
	- ApiNotEnabledForTitle
	- InvalidBaseTimeForInterval
	- MaxQueryableVersionsValueNotAllowedForTier
	- ResetIntervalCannotBeModified
	- StatisticNotFound

]]
function Apis.UpdateStatisticDefinition(request: Types.UpdateStatisticDefinitionRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Statistic/UpdateStatisticDefinition",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get all current statistic definitions information



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/liststatisticdefinitions).

	### Errors
	- StatisticCountLimitExceeded

]]
function Apis.ListStatisticDefinitions(request: Types.ListStatisticDefinitionsRequest, entityToken: string): Result<Types.ListStatisticDefinitionsResponse, string>
	return makeApiCall(
		"/Statistic/ListStatisticDefinitions",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Create a new entity statistic definition.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/createstatisticdefinition).

	### Errors
	- AggregationTypeNotAllowedForMultiColumnStatistic
	- ApiNotEnabledForTitle
	- DuplicateColumnNameFound
	- DuplicateStatisticName
	- ExternalEntityNotAllowedForTier
	- InvalidBaseTimeForInterval
	- MaxQueryableVersionsValueNotAllowedForTier
	- StatisticCountLimitExceeded
	- StatisticDefinitionHasNullOrEmptyVersionConfiguration
	- StatisticNameConflict
	- VersionConfigurationIsRequired

]]
function Apis.CreateStatisticDefinition(request: Types.CreateStatisticDefinitionRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Statistic/CreateStatisticDefinition",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Unlinks a leaderboard definition from it's linked statistic definition.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/unlinkleaderboardfromstatistic).

	### Errors
	- LeaderboardNotFound
	- NoLinkedStatisticToLeaderboard

]]
function Apis.UnlinkLeaderboardFromStatistic(request: Types.UnlinkLeaderboardFromStatisticRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Leaderboard/UnlinkLeaderboardFromStatistic",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Adds or updates entries on the specified leaderboard.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/updateleaderboardentries).

	### Errors
	- APINotEnabledForGameClientAccess
	- LeaderboardColumnLengthMismatch
	- LeaderboardNotFound
	- LeaderboardUpdateNotAllowedWhileLinked

]]
function Apis.UpdateLeaderboardEntries(request: Types.UpdateLeaderboardEntriesRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Leaderboard/UpdateLeaderboardEntries",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get the leaderboard limited to a set of entities.

	Request a leaderboard limited to a collection of entities.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/getleaderboardforentities).

	### Errors
	- ApiNotEnabledForTitle
	- LeaderboardNotFound
	- NoLeaderboardForStatistic
	- SpecifiedVersionLeaderboardNotFound
	- StatisticNotFound

]]
function Apis.GetLeaderboardForEntities(request: Types.GetLeaderboardForEntitiesRequest, entityToken: string): Result<Types.GetEntityLeaderboardResponse, string>
	return makeApiCall(
		"/Leaderboard/GetLeaderboardForEntities",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Delete an entity statistic definition. Will delete all statistics on entity
	profiles and leaderboards.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/deletestatisticdefinition).

	### Errors
	- StatisticDefinitionModificationNotAllowedWhileLinked
	- StatisticNotFound
	- StatisticUpdateInProgress

]]
function Apis.DeleteStatisticDefinition(request: Types.DeleteStatisticDefinitionRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Statistic/DeleteStatisticDefinition",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Delete statistics on an entity profile. This will remove all rankings from
	associated leaderboards.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/deletestatistics).

]]
function Apis.DeleteStatistics(request: Types.DeleteStatisticsRequest, entityToken: string): Result<Types.DeleteStatisticsResponse, string>
	return makeApiCall(
		"/Statistic/DeleteStatistics",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get the leaderboard around a specific entity.

	Request to load a section of a leaderboard centered on a specific entity.

	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/getleaderboardaroundentity).

	### Errors
	- LeaderboardNotFound
	- NoLeaderboardForStatistic
	- SpecifiedVersionLeaderboardNotFound
	- StatisticNotFound

]]
function Apis.GetLeaderboardAroundEntity(request: Types.GetLeaderboardAroundEntityRequest, entityToken: string): Result<Types.GetEntityLeaderboardResponse, string>
	return makeApiCall(
		"/Leaderboard/GetLeaderboardAroundEntity",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get the friend leaderboard for the specified entity. A maximum of 25 friend
	entries are listed in the leaderboard.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/getfriendleaderboardforentity).

	### Errors
	- AccountNotFound
	- ApiNotEnabledForTitle
	- DownstreamServiceUnavailable
	- ExpiredXboxLiveToken
	- FacebookAPIError
	- InvalidEntityType
	- InvalidSignature
	- InvalidSignatureTime
	- InvalidXboxLiveToken
	- LeaderboardNotFound
	- NoLeaderboardForStatistic
	- PlayerSecretNotConfigured
	- StatisticNotFound
	- XboxInaccessible
	- XboxServiceTooManyRequests
	- XboxXASSExchangeFailure

]]
function Apis.GetFriendLeaderboardForEntity(request: Types.GetFriendLeaderboardForEntityRequest, entityToken: string): Result<Types.GetEntityLeaderboardResponse, string>
	return makeApiCall(
		"/Leaderboard/GetFriendLeaderboardForEntity",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Deletes a leaderboard definition.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/deleteleaderboarddefinition).

	### Errors
	- LeaderboardDefinitionModificationNotAllowedWhileLinked
	- LeaderboardNotFound

]]
function Apis.DeleteLeaderboardDefinition(request: Types.DeleteLeaderboardDefinitionRequest, entityToken: string): Result<Types.EmptyResponse, string>
	return makeApiCall(
		"/Leaderboard/DeleteLeaderboardDefinition",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Get current statistic definition information



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/getstatisticdefinition).

	### Errors
	- StatisticNotFound

]]
function Apis.GetStatisticDefinition(request: Types.GetStatisticDefinitionRequest, entityToken: string): Result<Types.GetStatisticDefinitionResponse, string>
	return makeApiCall(
		"/Statistic/GetStatisticDefinition",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Gets statistics for the specified entity.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/statistics/getstatistics).

	### Errors
	- APINotEnabledForGameClientAccess
	- InvalidEntityType
	- NotAuthorized
	- StatisticNotFound

]]
function Apis.GetStatistics(request: Types.GetStatisticsRequest, entityToken: string): Result<Types.GetStatisticsResponse, string>
	return makeApiCall(
		"/Statistic/GetStatistics",
		request,
		"X-EntityToken",
		entityToken
	)
end

--[[
	Increment a leaderboard version.



	For more information, see the [External
	Documentation](https://docs.microsoft.com/rest/api/playfab/progression/leaderboards/incrementleaderboardversion).

	### Errors
	- ConcurrentEditError
	- InvalidVersionResetForLinkedLeaderboard
	- LeaderboardDefinitionModificationNotAllowedWhileLinked
	- LeaderboardNotFound
	- VersionIncrementRateExceeded

]]
function Apis.IncrementLeaderboardVersion(request: Types.IncrementLeaderboardVersionRequest, entityToken: string): Result<Types.IncrementLeaderboardVersionResponse, string>
	return makeApiCall(
		"/Leaderboard/IncrementLeaderboardVersion",
		request,
		"X-EntityToken",
		entityToken
	)
end

return Apis
