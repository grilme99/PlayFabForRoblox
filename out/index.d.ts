import * as admin from './AdminApi';
import * as auth from './AuthenticationApi';
import * as client from './ClientApi';
import * as data from './DataApi';
import * as events from './EventsApi';
import * as experimentation from './ExperimentationApi';
import * as groups from './GroupsApi';
import * as multiplayer from './MultiplayerApi';
import * as profiles from './ProfilesApi';
import * as server from './ServerApi';
export declare const AdminApi: typeof admin;
export declare const AuthenticationApi: typeof auth;
export declare const ClientApi: typeof client;
export declare const DataApi: typeof data;
export declare const EventsApi: typeof events;
export declare const ExperimentationApi: typeof experimentation;
export declare const GroupsApi: typeof groups;
export declare const MultiplayerApi: typeof multiplayer;
export declare const ProfilesApi: typeof profiles;
export declare const ServerApi: typeof server;
export declare let Settings: {
    _internalSettings: {
        sdkVersionString: string;
        requestGetParams: {
            ['sdk']: string;
        };
        productionUrl: string;
        entityToken: string;
    };
    settings: {
        titleId: string;
        secretKey: string;
    };
};
