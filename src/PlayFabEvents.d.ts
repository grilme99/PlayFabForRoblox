/// <reference path="PlayFab.d.ts" />

declare module PlayFabEventsModule {
    export interface IPlayFabEvents {
        /**
         * Write batches of entity based events to PlayStream. The namespace of the Event must be 'custom' or start with 'custom.'.
         * https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writeevents
         */
        WriteEvents(
            entityToken: string,
            request?: PlayFabEventsModels.WriteEventsRequest
        ): Promise<PlayFabEventsModels.WriteEventsResponse>;
        /**
         * Write batches of entity based events to as Telemetry events (bypass PlayStream). The namespace must be 'custom' or start
         * with 'custom.'
         * https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writetelemetryevents
         */
        WriteTelemetryEvents(
            entityToken: string,
            request?: PlayFabEventsModels.WriteEventsRequest
        ): Promise<PlayFabEventsModels.WriteEventsResponse>;

    }
}

declare module PlayFabEventsModels {
    export interface EntityKey {
        /** Unique ID of the entity. */
        Id: string;
        /** Entity type. See https://docs.microsoft.com/gaming/playfab/features/data/entities/available-built-in-entity-types */
        Type?: string;
    }

    export interface EventContents {
        /**
         * The optional custom tags associated with the event (e.g. build number, external trace identifiers, etc.). Before an
         * event is written, this collection and the base request custom tags will be merged, but not overriden. This enables the
         * caller to specify static tags and per event tags.
         */
        CustomTags?: { [key: string]: string | undefined };
        /** Entity associated with the event. If null, the event will apply to the calling entity. */
        Entity?: EntityKey;
        /** The namespace in which the event is defined. Allowed namespaces can vary by API. */
        EventNamespace: string;
        /** The name of this event. */
        Name: string;
        /**
         * The original unique identifier associated with this event before it was posted to PlayFab. The value might differ from
         * the EventId value, which is assigned when the event is received by the server.
         */
        OriginalId?: string;
        /**
         * The time (in UTC) associated with this event when it occurred. If specified, this value is stored in the
         * OriginalTimestamp property of the PlayStream event.
         */
        OriginalTimestamp?: string;
        /** Arbitrary data associated with the event. Only one of Payload or PayloadJSON is allowed. */
        Payload?: any;
        /**
         * Arbitrary data associated with the event, represented as a JSON serialized string. Only one of Payload or PayloadJSON is
         * allowed.
         */
        PayloadJSON?: string;
    }

    export interface WriteEventsRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
        /** Collection of events to write to PlayStream. */
        Events: EventContents[];
    }

    export interface WriteEventsResponse extends PlayFabModule.IPlayFabResultCommon {
        /**
         * The unique identifiers assigned by the server to the events, in the same order as the events in the request. Only
         * returned if FlushToPlayStream option is true.
         */
        AssignedEventIds?: string[];
    }

}
