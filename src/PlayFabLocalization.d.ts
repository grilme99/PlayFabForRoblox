/// <reference path="PlayFab.d.ts" />

declare module PlayFabLocalizationModule {
    export interface IPlayFabLocalization {
        /**
         * Retrieves the list of allowed languages, only accessible by title entities
         * https://docs.microsoft.com/rest/api/playfab/localization/localization/getlanguagelist
         */
        GetLanguageList(
            entityToken: string,
            request?: PlayFabLocalizationModels.GetLanguageListRequest
        ): Promise<PlayFabLocalizationModels.GetLanguageListResponse>;

    }
}

declare module PlayFabLocalizationModels {
    export interface GetLanguageListRequest extends PlayFabModule.IPlayFabRequestCommon {
        /** The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.). */
        CustomTags?: { [key: string]: string | undefined };
    }

    export interface GetLanguageListResponse extends PlayFabModule.IPlayFabResultCommon {
        /** The list of allowed languages, in BCP47 two-letter format */
        LanguageList?: string[];
    }

}
