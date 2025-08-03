--[[
	This file was generated on 2025-08-03 at 00:04 UTC. Do not edit directly.

]]

--[[
	Leaderboard response

]]
export type GetEntityLeaderboardResponse = {
	--[[
		The number of entries on the leaderboard.

	]]
	EntryCount: number,
	--[[
		Leaderboard columns describing the sort directions.

	]]
	Columns: { LeaderboardColumn }?,
	--[[
		The time the next scheduled reset will occur. Null if the leaderboard does not
		reset on a schedule.

	]]
	NextReset: string?,
	--[[
		Individual entity rankings in the leaderboard, in sorted order by rank.

	]]
	Rankings: { EntityLeaderboardEntry }?,
	--[[
		Version of the leaderboard being returned.

	]]
	Version: number,
}

export type UpdateStatisticsResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	Statistics: EntityStatisticValue?,
	ColumnDetails: StatisticColumnCollection?,
}

export type DeleteStatisticsResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
}

export type DeleteLeaderboardEntriesRequest = {
	--[[
		The unique Ids of the entries to delete from the leaderboard.

	]]
	EntityIds: { string }?,
	--[[
		The name of the leaderboard.

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

export type StatisticDefinition = {
	--[[
		Created time, in UTC

	]]
	Created: string,
	--[[
		The columns for the statistic defining the aggregation method for each column.

	]]
	Columns: { StatisticColumn }?,
	--[[
		The list of leaderboards that are linked to this statistic definition.

	]]
	LinkedLeaderboardNames: { string }?,
	--[[
		The list of statistic definitions names this definition aggregates to.

	]]
	AggregationDestinations: { string }?,
	--[[
		The list of statistic definitions names whose values must be aggregated
		towards this stat. If AggregationSource is specified, the entityType of this
		definition MUST be Title (making it a CommunityStat). Currently, only one
		aggregation source can be specified.

	]]
	AggregationSources: { string }?,
	--[[
		Statistic version.

	]]
	Version: number,
	--[[
		The entity type that can have this statistic.

	]]
	EntityType: string?,
	--[[
		Name of the statistic.

	]]
	Name: string?,
	VersionConfiguration: VersionConfiguration?,
	--[[
		Last time, in UTC, statistic version was incremented.

	]]
	LastResetTime: string?,
}

export type GetLeaderboardDefinitionResponse = {
	--[[
		Created time, in UTC

	]]
	Created: string,
	--[[
		Latest Leaderboard version.

	]]
	Version: number,
	--[[
		Sort direction of the leaderboard columns, cannot be changed after creation.

	]]
	Columns: { LeaderboardColumn },
	--[[
		The entity type being represented on the leaderboard. If it doesn't correspond
		to the PlayFab entity types, use 'external' as the type.

	]]
	EntityType: string,
	--[[
		A name for the leaderboard, unique per title.

	]]
	Name: string,
	--[[
		Maximum number of entries on this leaderboard

	]]
	SizeLimit: number,
	VersionConfiguration: VersionConfiguration,
	--[[
		Last time, in UTC, leaderboard version was incremented.

	]]
	LastResetTime: string?,
}

--[[
	Request to load a section of a leaderboard centered on a specific entity.

]]
export type GetLeaderboardAroundEntityRequest = {
	--[[
		Optional version of the leaderboard, defaults to current.

	]]
	Version: number?,
	--[[
		Number of surrounding entries to return (in addition to specified entity). In
		general, the number of ranks above and below will be split into half. For
		example, if the specified value is 10, 5 ranks above and 5 ranks below will be
		retrieved. However, the numbers will get skewed in either direction when the
		specified entity is towards the top or bottom of the leaderboard. Also, the
		number of entries returned can be lower than the value specified for entries
		at the bottom of the leaderboard.

	]]
	MaxSurroundingEntries: number,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Name of the leaderboard.

	]]
	LeaderboardName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetStatisticDefinitionRequest = {
	--[[
		Name of the statistic. Must be less than 150 characters.

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

export type IncrementStatisticVersionResponse = {
	--[[
		New statistic version.

	]]
	Version: number,
}

export type IncrementStatisticVersionRequest = {
	--[[
		Name of the statistic to increment the version of.

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

export type GetStatisticsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		The list of statistics to return for the user. If set to null, the current
		version of all statistics are returned.

	]]
	StatisticNames: { string }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type StatisticColumn = {
	--[[
		Name of the statistic column, as originally configured.

	]]
	Name: string,
	AggregationMethod: StatisticAggregationMethod,
}

export type IncrementLeaderboardVersionRequest = {
	--[[
		The name of the leaderboard to increment the version for.

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

export type ListLeaderboardDefinitionsResponse = {
	--[[
		List of leaderboard definitions for the title.

	]]
	LeaderboardDefinitions: { LeaderboardDefinition }?,
}

export type EntityStatisticValue = {
	--[[
		Statistic name

	]]
	Name: string?,
	--[[
		Statistic scores

	]]
	Scores: { string }?,
	--[[
		Statistic version

	]]
	Version: number,
	--[[
		Metadata associated with the Statistic.

	]]
	Metadata: string?,
}

export type EntityStatistics = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	EntityKey: EntityKey?,
	--[[
		The statistics for the given entity key.

	]]
	Statistics: { EntityStatisticValue }?,
}

export type UpdateStatisticsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Collection of statistics to update, maximum 50.

	]]
	Statistics: { StatisticUpdate },
	--[[
		Optional transactionId of this update which can be used to ensure idempotence.
		Using this field is still in testing stage.

	]]
	TransactionId: string?,
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
	Request a leaderboard limited to a collection of entities.

]]
export type GetLeaderboardForEntitiesRequest = {
	--[[
		Name of the leaderboard.

	]]
	LeaderboardName: string,
	--[[
		Collection of Entity IDs to include in the leaderboard.

	]]
	EntityIds: { string },
	--[[
		Optional version of the leaderboard, defaults to current.

	]]
	Version: number?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type ListLeaderboardDefinitionsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LeaderboardEntryUpdate = {
	--[[
		The unique Id for the entry. If using PlayFab Entities, this would be the
		entityId of the entity.

	]]
	EntityId: string,
	--[[
		The scores for the leaderboard. The number of values provided here must match
		the number of columns in the Leaderboard definition.

	]]
	Scores: { string }?,
	--[[
		Arbitrary metadata to store along side the leaderboard entry, will be returned
		by all Leaderboard APIs. Must be less than 50 UTF8 encoded characters.

	]]
	Metadata: string?,
}

export type VersionConfiguration = {
	--[[
		The maximum number of versions of this leaderboard/statistic that can be
		queried.

	]]
	MaxQueryableVersions: number,
	ResetInterval: ResetInterval,
}

--[[
	Individual rank of an entity in a leaderboard

]]
export type EntityLeaderboardEntry = {
	--[[
		Scores for the entry.

	]]
	Scores: { string }?,
	--[[
		The time at which the last update to the entry was recorded on the server.

	]]
	LastUpdated: string,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Entity's display name.

	]]
	DisplayName: string?,
	--[[
		An opaque blob of data stored on the leaderboard entry. Note that the metadata
		is not used for ranking purposes.

	]]
	Metadata: string?,
	--[[
		Position on the leaderboard.

	]]
	Rank: number,
}

export type GetStatisticsResponse = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	Statistics: EntityStatisticValue?,
	ColumnDetails: StatisticColumnCollection?,
}

export type DeleteStatisticDefinitionRequest = {
	--[[
		Name of the statistic to delete.

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

export type LeaderboardColumn = {
	SortDirection: LeaderboardSortDirection,
	--[[
		A name for the leaderboard column, unique per leaderboard definition.

	]]
	Name: string,
	LinkedStatisticColumn: LinkedStatisticColumn?,
}

export type ListStatisticDefinitionsResponse = {
	--[[
		List of statistic definitions for the title.

	]]
	StatisticDefinitions: { StatisticDefinition }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type GetStatisticDefinitionResponse = {
	--[[
		Created time, in UTC

	]]
	Created: string,
	--[[
		The columns for the statistic defining the aggregation method for each column.

	]]
	Columns: { StatisticColumn }?,
	--[[
		The list of leaderboards that are linked to this statistic definition.

	]]
	LinkedLeaderboardNames: { string }?,
	--[[
		The list of statistic definitions names this definition aggregates to.

	]]
	AggregationDestinations: { string }?,
	--[[
		The list of statistic definitions names whose values must be aggregated
		towards this stat. If AggregationSource is specified, the entityType of this
		definition MUST be Title (making it a CommunityStat). Currently, only one
		aggregation source can be specified.

	]]
	AggregationSources: { string }?,
	--[[
		Statistic version.

	]]
	Version: number,
	--[[
		The entity type that can have this statistic.

	]]
	EntityType: string?,
	--[[
		Name of the statistic.

	]]
	Name: string?,
	VersionConfiguration: VersionConfiguration?,
	--[[
		Last time, in UTC, statistic version was incremented.

	]]
	LastResetTime: string?,
}

export type GetStatisticsForEntitiesResponse = {
	--[[
		List of entities mapped to their statistics. Only the latest version of a
		statistic is returned.

	]]
	EntitiesStatistics: { EntityStatistics }?,
	ColumnDetails: StatisticColumnCollection?,
}

export type ExternalFriendSources = 
	| "None"
	| "Steam"
	| "Facebook"
	| "Xbox"
	| "Psn"
	| "All"

export type GetFriendLeaderboardForEntityRequest = {
	ExternalFriendSources: ExternalFriendSources?,
	--[[
		Optional version of the leaderboard, defaults to current version.

	]]
	Version: number?,
	--[[
		Xbox token if Xbox friends should be included. Requires Xbox be configured on
		PlayFab.

	]]
	XboxToken: string?,
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Name of the leaderboard.

	]]
	LeaderboardName: string,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type EmptyResponse = {
	-- No properties defined in spec
	[string]: any
}

export type DeleteLeaderboardDefinitionRequest = {
	--[[
		The name of the leaderboard definition to delete.

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

export type DeleteStatisticsRequest = {
	--[[
		Combined entity type and ID structure which uniquely identifies a single
		entity.

	]]
	Entity: EntityKey?,
	--[[
		Collection of statistics to remove from this entity.

	]]
	Statistics: { StatisticDelete },
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type StatisticAggregationMethod = 
	| "Last"
	| "Min"
	| "Max"
	| "Sum"

export type ResetInterval = 
	| "Manual"
	| "Hour"
	| "Day"
	| "Week"
	| "Month"

export type CreateStatisticDefinitionRequest = {
	--[[
		The entity type allowed to have score(s) for this statistic.

	]]
	EntityType: string?,
	--[[
		The columns for the statistic defining the aggregation method for each column.
		A maximum of 5 columns are allowed.

	]]
	Columns: { StatisticColumn }?,
	--[[
		[In Preview]: The list of statistic definition names whose scores must be
		aggregated towards this stat. If AggregationSource is specified, the
		entityType of this definition MUST be Title (making it a CommunityStat).
		Currently, only one aggregation source can be specified.

	]]
	AggregationSources: { string }?,
	--[[
		Name of the statistic. Must be less than 150 characters. Restricted to a-Z,
		0-9, '(', ')', '_', '-' and '.'.

	]]
	Name: string,
	VersionConfiguration: VersionConfiguration?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LeaderboardDefinition = {
	--[[
		Created time, in UTC

	]]
	Created: string,
	--[[
		Latest Leaderboard version.

	]]
	Version: number,
	--[[
		Sort direction of the leaderboard columns, cannot be changed after creation.

	]]
	Columns: { LeaderboardColumn },
	--[[
		The entity type being represented on the leaderboard. If it doesn't correspond
		to the PlayFab entity types, use 'external' as the type.

	]]
	EntityType: string,
	--[[
		A name for the leaderboard, unique per title.

	]]
	Name: string,
	--[[
		Maximum number of entries on this leaderboard

	]]
	SizeLimit: number,
	VersionConfiguration: VersionConfiguration,
	--[[
		Last time, in UTC, leaderboard version was incremented.

	]]
	LastResetTime: string?,
}

export type UpdateStatisticDefinitionRequest = {
	VersionConfiguration: VersionConfiguration?,
	--[[
		Name of the statistic. Must be less than 150 characters. Restricted to a-Z,
		0-9, '(', ')', '_', '-' and '.'.

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

export type ListStatisticDefinitionsRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type StatisticColumnCollection = {
	--[[
		Columns for the statistic defining the aggregation method for each column.

	]]
	Columns: { StatisticColumn }?,
}

export type CreateLeaderboardDefinitionRequest = {
	--[[
		The entity type being represented on the leaderboard. If it doesn't correspond
		to the PlayFab entity types, use 'external' as the type.

	]]
	EntityType: string,
	--[[
		A name for the leaderboard, unique per title.

	]]
	Name: string,
	--[[
		Leaderboard columns describing the sort directions, cannot be changed after
		creation. A maximum of 5 columns are allowed.

	]]
	Columns: { LeaderboardColumn },
	--[[
		Maximum number of entries on this leaderboard

	]]
	SizeLimit: number,
	VersionConfiguration: VersionConfiguration?,
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
	Request to load a leaderboard.

]]
export type GetEntityLeaderboardRequest = {
	--[[
		Optional version of the leaderboard, defaults to current version.

	]]
	Version: number?,
	--[[
		Index position to start from. 1 is beginning of leaderboard.

	]]
	StartingPosition: number?,
	--[[
		Name of the leaderboard.

	]]
	LeaderboardName: string,
	--[[
		Maximum number of results to return from the leaderboard. Minimum 1, maximum
		100.

	]]
	PageSize: number,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type StatisticDelete = {
	--[[
		Name of the statistic, as originally configured.

	]]
	Name: string,
}

export type StatisticUpdate = {
	--[[
		Name of the statistic, as originally configured.

	]]
	Name: string,
	--[[
		Statistic scores for the entity. This will be used in accordance with the
		aggregation method configured for the statistics.The maximum value allowed for
		each individual score is 9223372036854775807. The minimum value for each
		individual score is -9223372036854775807The values are formatted as strings to
		avoid interop issues with client libraries unable to handle 64bit integers.

	]]
	Scores: { string }?,
	--[[
		Optional field to indicate the version of the statistic to set. When empty
		defaults to the statistic's current version.

	]]
	Version: number?,
	--[[
		Arbitrary metadata to store along side the statistic, will be returned by all
		Leaderboard APIs. Must be less than 50 UTF8 encoded characters.

	]]
	Metadata: string?,
}

export type UnlinkLeaderboardFromStatisticRequest = {
	--[[
		The name of the statistic definition to unlink.

	]]
	StatisticName: string,
	--[[
		The name of the leaderboard definition to unlink.

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

export type GetStatisticsForEntitiesRequest = {
	--[[
		Collection of Entity IDs to retrieve statistics for.

	]]
	Entities: { EntityKey },
	--[[
		The list of statistics to return for the user. If set to null, the current
		version of all statistics are returned.

	]]
	StatisticNames: { string }?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type LeaderboardSortDirection = 
	| "Descending"
	| "Ascending"

export type LinkedStatisticColumn = {
	--[[
		The name of the statistic column that this leaderboard column is sourced from.

	]]
	LinkedStatisticColumnName: string,
	--[[
		The name of the statistic.

	]]
	LinkedStatisticName: string,
}

export type GetLeaderboardDefinitionRequest = {
	--[[
		The name of the leaderboard to retrieve the definition for.

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

export type UpdateLeaderboardDefinitionRequest = {
	--[[
		The name of the leaderboard to update the definition for.

	]]
	Name: string,
	--[[
		Maximum number of entries on this leaderboard

	]]
	SizeLimit: number?,
	VersionConfiguration: VersionConfiguration?,
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
}

export type IncrementLeaderboardVersionResponse = {
	--[[
		New Leaderboard version.

	]]
	Version: number,
}

export type UpdateLeaderboardEntriesRequest = {
	--[[
		The optional custom tags associated with the request (e.g. build number,
		external trace identifiers, etc.).

	]]
	CustomTags: {
		-- No properties defined in spec
		[string]: any
	}?,
	--[[
		The name of the leaderboard.

	]]
	LeaderboardName: string,
	--[[
		The entries to add or update on the leaderboard.

	]]
	Entries: { LeaderboardEntryUpdate }?,
}



return nil
