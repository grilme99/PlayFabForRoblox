// THIS FILE IS GENERATED AUTOMATICALLY AND SHOULD NOT BE EDITED BY HAND!

/// <reference no-default-lib="true"/>
/// <reference path="None.d.ts" />

interface Services {
	ABTestService: ABTestService;
	ChangeHistoryService: ChangeHistoryService;
	CoreGui: CoreGui;
	KeyframeSequenceProvider: KeyframeSequenceProvider;
	NetworkClient: NetworkClient;
	NetworkServer: NetworkServer;
	NetworkSettings: NetworkSettings;
	PackageService: PackageService;
	PluginDebugService: PluginDebugService;
	PluginGuiService: PluginGuiService;
	RenderSettings: RenderSettings;
	RobloxPluginGuiService: RobloxPluginGuiService;
	ScriptContext: ScriptContext;
	Selection: Selection;
	Studio: Studio;
	StudioData: StudioData;
	StudioService: StudioService;
	TaskScheduler: TaskScheduler;
	TestService: TestService;
	VersionControlService: VersionControlService;
}

interface CreatableInstances {
	PluginAction: PluginAction;
	RenderingTest: RenderingTest;
}

interface AbstractInstances {
	NetworkPeer: NetworkPeer;
	NetworkReplicator: NetworkReplicator;
	PluginGui: PluginGui;
	StatsItem: StatsItem;
}

interface Instances extends Services, CreatableInstances, AbstractInstances {
	ClientReplicator: ClientReplicator;
	DataModelSession: DataModelSession;
	DebuggerBreakpoint: DebuggerBreakpoint;
	DebuggerManager: DebuggerManager;
	DebuggerWatch: DebuggerWatch;
	DebugSettings: DebugSettings;
	DockWidgetPluginGui: DockWidgetPluginGui;
	File: File;
	GameSettings: GameSettings;
	GlobalSettings: GlobalSettings;
	LuaSettings: LuaSettings;
	MemStorageConnection: MemStorageConnection;
	MultipleDocumentInterfaceInstance: MultipleDocumentInterfaceInstance;
	PhysicsSettings: PhysicsSettings;
	Plugin: Plugin;
	PluginDragEvent: PluginDragEvent;
	PluginMenu: PluginMenu;
	PluginMouse: PluginMouse;
	PluginToolbar: PluginToolbar;
	PluginToolbarButton: PluginToolbarButton;
	QWidgetPluginGui: QWidgetPluginGui;
	RunningAverageItemDouble: RunningAverageItemDouble;
	RunningAverageItemInt: RunningAverageItemInt;
	RunningAverageTimeIntervalItem: RunningAverageTimeIntervalItem;
	ScriptDebugger: ScriptDebugger;
	ServerReplicator: ServerReplicator;
	StudioTheme: StudioTheme;
	TotalCountTimeIntervalItem: TotalCountTimeIntervalItem;
}

// GENERATED ROBLOX INSTANCE CLASSES

interface Instance {
	/** If true, the `Instance` and its descendants cannot be indexed or edited by a `Script` or `LocalScript` and will throw an error if it is attempted.
	 * 
	 * This property currently cannot be changed by developers.
	 * 
	 * This property is primarily intended to protect objects in the `CoreGui` service from being altered by users in an unauthorized manner. Developers looking to alter the `CoreGui` should use [StarterGui.SetCore](https://developer.roblox.com/api-reference/function/StarterGui/SetCore) and [StarterGui.GetCore](https://developer.roblox.com/api-reference/function/StarterGui/GetCore).
	 */
	RobloxLocked: boolean;
	/** Returns a coded string of the `Instance`s DebugId used internally by Roblox.
	 * 
	 * ## Notes
	 * 
	 *  - This item is protected. Attempting to use it in a `Script` or `LocalScript` will cause an error
	 * 
	 *  - A debug ID is an ID used in debugging processes. It allows a debugger to read each instruction before an application processes it. All objects in Roblox act like processes and each run instructions (or 'code') that can be debugged if needed
	 * 
	 *  - This can be helpful for plugins which need to distinguish similar objects from one-another (such as objects that share the same name)
	 * @param scopeLength The scope length.
	 * @returns The Debug ID string.
	 */
	GetDebugId(this: Instance, scopeLength?: number): string;
}

interface ABTestService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "ABTestService";
	/** [NO DOCUMENTATION] */
	ClearUserVariations(this: ABTestService): void;
	/** [NO DOCUMENTATION] */
	GetBrowserTrackerABTestLoadingStatus(this: ABTestService): Enum.ABTestLoadingStatus;
	/** [NO DOCUMENTATION] */
	GetPendingOrInitializedUserId(this: ABTestService): number;
	/** [NO DOCUMENTATION] */
	GetUserABTestLoadingStatus(this: ABTestService): Enum.ABTestLoadingStatus;
	/** [NO DOCUMENTATION] */
	GetVariant(this: ABTestService, name: string): string;
	/** [NO DOCUMENTATION] */
	InitializeForUserId(this: ABTestService, userId: number): void;
	/** [NO DOCUMENTATION] *
	 * Tags: Yields
	 */
	WaitUntilBrowserTrackerABTestsInitialized(this: ABTestService): void;
	/** [NO DOCUMENTATION] *
	 * Tags: Yields
	 */
	WaitUntilUserABTestsInitialized(this: ABTestService): void;
	/** [NO DOCUMENTATION] */
	readonly OnBrowserTrackerABTestLoadingStatusChanged: RBXScriptSignal<(status: Enum.ABTestLoadingStatus) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnUserABTestLoadingStatusChanged: RBXScriptSignal<(status: Enum.ABTestLoadingStatus, userId: number) => void>;
}

interface Animator extends Instance {
	/** Increments the [AnimationTrack.TimePosition](https://developer.roblox.com/api-reference/property/AnimationTrack/TimePosition) of all playing `AnimationTrack`s that are loaded onto the `Animator`, applying the offsets to the model associated with the `Animator`. For use in the command bar or by plugins only.
	 * 
	 * The deltaTime paramater determines the number of seconds to increment on the animation's progress. Typically this function will be called in a loop to preview the length of an animation (see example).
	 * 
	 * Note that once animations have stopped playing, the model's joints will need to be manually reset to their original positions (see example).
	 * 
	 * This function is used to simulate playback of `Animation`s when the game isn't running. This allows animations to be previewed without the consequences of running the game, such as scripts executing. If the function is called whilst the game is running, or by `Script`s or `LocalScript`s, it will return an error.
	 * 
	 * Developers designing their own custom animation editors are advised to use this function to preview animations, as it is the method the official Roblox Animation Editor plugin uses.
	 * @param deltaTime The amount of time in seconds animation playback is to be incremented by.
	 */
	StepAnimations(this: Animator, deltaTime: number): void;
}

/** The CoreGui is a service used to store Guis created in-game by Roblox for the core user interface found in every game (such as the game menu, the playerlist, the backpack, etc.). It can also be used by [Plugins](https://developer.roblox.com/api-reference/class/Plugin) in Roblox Studio.
 * 
 * You can use the [StarterGui.SetCoreGuiEnabled](https://developer.roblox.com/api-reference/function/StarterGui/SetCoreGuiEnabled) and [StarterGui.GetCoreGuiEnabled](https://developer.roblox.com/api-reference/function/StarterGui/GetCoreGuiEnabled) methods in a `LocalScript` to enable and disable most elements of the CoreGui. You can also use [PlayerGui.SetTopbarTransparency](https://developer.roblox.com/api-reference/function/PlayerGui/SetTopbarTransparency) to set the transparency of the top bar.
 */
interface CoreGui extends BasePlayerGui {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "CoreGui";
	/** [NO DOCUMENTATION] */
	readonly SelectionImageObject: GuiObject | undefined;
	/** The current version of the CoreGui. Everytime the CoreGui is majorly changed, this number is increased.
	 * 	
	 * The current version of the CoreGui. Everytime the CoreGui is majorly changed, this number is increased.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The current version of the CoreGui. Everytime the CoreGui is majorly changed, this number is increased.
	 * 	
	 * The current version of the CoreGui. Everytime the CoreGui is majorly changed, this number is increased.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly Version: number;
	/** [NO DOCUMENTATION] */
	SetUserGuiRendering(this: CoreGui, enabled: boolean, guiAdornee: Instance, faceId: CastsToEnum<Enum.NormalId>): void;
	/** [NO DOCUMENTATION] */
	TakeScreenshot(this: CoreGui): void;
	/** [NO DOCUMENTATION] */
	ToggleRecording(this: CoreGui): void;
}

interface StarterGui extends BasePlayerGui {
	ProcessUserInput: boolean;
	/** This property determines whether [GUI objects](https://developer.roblox.com/api-reference/class/LayerCollector) descending from the `StarterGui` are visible in Studio’s edit mode.
	 * 
	 * As this property defaults to true, [ScreenGuis](https://developer.roblox.com/api-reference/class/ScreenGui), [BillboardGuis](https://developer.roblox.com/api-reference/class/BillboardGui) and [SurfaceGuis](https://developer.roblox.com/api-reference/class/SurfaceGui) descending from the `StarterGui` are not hidden.
	 * 
	 * Setting this property to false will only affect objects not descending from the `StarterGui`. This means [BillboardGuis](https://developer.roblox.com/api-reference/class/BillboardGui) and [SurfaceGuis](https://developer.roblox.com/api-reference/class/SurfaceGui) descending from the `Workspace` will not be hidden.
	 * 
	 * This property has no effect outside of Roblox Studio and is intended as a tool to hide the contents of `StarterGui` whilst working in the 3d world.
	 * 
	 * ## Disabling ShowDevelopmentGui by default
	 * 
	 * You can set this property to be false by default in new places by saving a `Script` with the following code into your local plugins folder.
	 * 
	 * ```lua
	 * print("StarterGui.ShowDevelopmentGui = false") -- a reminder this plugin is active
	 * game:GetService("StarterGui").ShowDevelopmentGui = false
	 * ```
	 * 
	 */
	ShowDevelopmentGui: boolean;
}

/** The ChangeHistoryService provides a way for plugins to undo and redo changes and to create waypoints when changes are made to the place. */
interface ChangeHistoryService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "ChangeHistoryService";
	/** Returns whether there are actions that can be redone, and, if there are, returns the last of them. */
	GetCanRedo(this: ChangeHistoryService): unknown;
	/** Returns whether there are actions that can be undone, and, if there are, returns the last of them. */
	GetCanUndo(this: ChangeHistoryService): unknown;
	/** Executes the last action that was undone. */
	Redo(this: ChangeHistoryService): void;
	/** Clears the history, causing all undo/redo waypoints to be removed. */
	ResetWaypoints(this: ChangeHistoryService): void;
	/** Sets whether or not the ChangeHistoryService is enabled. When set to false, the undo/redo list is cleared, and does not repopulate. When set to true again, the original list is not restored, but further operations append to the list once more */
	SetEnabled(this: ChangeHistoryService, state: boolean): void;
	/** Sets a new waypoint which can be used as an undo or redo point. */
	SetWaypoint(this: ChangeHistoryService, name: string): void;
	/** Undos the last action taken, for which there exists a waypoint. */
	Undo(this: ChangeHistoryService): void;
	/** Fired when the user reverses the undo command. Waypoint describes the type action that has been redone. */
	readonly OnRedo: RBXScriptSignal<(waypoint: string) => void>;
	/** Fired when the user undoes an action in studio. Waypoint describes the type action that has been undone. */
	readonly OnUndo: RBXScriptSignal<(waypoint: string) => void>;
}

interface DataModelSession extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "DataModelSession";
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly CurrentDataModelType: Enum.StudioDataModelType;
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly SessionId: string;
	/** [NO DOCUMENTATION] */
	readonly CurrentDataModelTypeAboutToChange: RBXScriptSignal<(dataModelType: Enum.StudioDataModelType) => void>;
	/** [NO DOCUMENTATION] */
	readonly CurrentDataModelTypeChanged: RBXScriptSignal<() => void>;
	/** [NO DOCUMENTATION] */
	readonly DataModelCreated: RBXScriptSignal<(gameStateType: Enum.StudioDataModelType) => void>;
	/** [NO DOCUMENTATION] */
	readonly DataModelWillBeDestroyed: RBXScriptSignal<(gameStateType: Enum.StudioDataModelType) => void>;
}

/** The DebugSettings allows you to view diagnostics information regarding Roblox. It is labeled as **Diagnostics** in the Roblox Studio Settings menu. */
interface DebugSettings extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "DebugSettings";
	/** Describes whether a `DataModel` is actively in memory, as an integer (where 1 = true, and 0 = false).
	 * 	
	 * Describes whether a `DataModel` is actively in memory, as an integer (where 1 = true, and 0 = false).
	 * 
	 * Tags: ReadOnly, NotReplicated
	Describes whether a `DataModel` is actively in memory, as an integer (where 1 = true, and 0 = false).
	 * 	
	 * Describes whether a `DataModel` is actively in memory, as an integer (where 1 = true, and 0 = false).
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly DataModel: number;
	/** The number of instances active in the simulation.
	 * 	
	 * The number of instances active in the simulation.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The number of instances active in the simulation.
	 * 	
	 * The number of instances active in the simulation.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly InstanceCount: number;
	/** Whether or not a stacktrace is displayed in the output for an error. */
	IsScriptStackTracingEnabled: boolean;
	/** Returns the number of internal DataModel jobs actively being processed.
	 * 	
	 * Returns the number of internal DataModel jobs actively being processed.
	 * 
	 * Tags: ReadOnly, NotReplicated
	Returns the number of internal DataModel jobs actively being processed.
	 * 	
	 * Returns the number of internal DataModel jobs actively being processed.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly JobCount: number;
	/** The number of players currently in the active game-instance.
	 * 	
	 * The number of players currently in the active game-instance.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The number of players currently in the active game-instance.
	 * 	
	 * The number of players currently in the active game-instance.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly PlayerCount: number;
	/** Whether or not sound warnings should be reported. */
	ReportSoundWarnings: boolean;
	/** The current client version of Roblox. Can also be retrieved by using the version() function.
	 * 	
	 * The current client version of Roblox. Can also be retrieved by using the version() function.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The current client version of Roblox. Can also be retrieved by using the version() function.
	 * 	
	 * The current client version of Roblox. Can also be retrieved by using the version() function.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly RobloxVersion: string;
	/** Sets the internal sampling method used to measure elapsed time with consistency across platforms. */
	TickCountPreciseOverride: Enum.TickCountSampleMethod;
}

/** Represents a breakpoint in Roblox's Lua Debugger.
 * 
 * This object cannot be created, but it can be retrieved from the `ScriptDebugger` class.
 */
interface DebuggerBreakpoint extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "DebuggerBreakpoint";
	/** The condition of the debugger breakpoint. */
	Condition: string;
	/** Whether or not the breakpoint is enabled. */
	IsEnabled: boolean;
	/** The line that the breakpoint has been placed on.
	 * 	
	 * The line that the breakpoint has been placed on.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The line that the breakpoint has been placed on.
	 * 	
	 * The line that the breakpoint has been placed on.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly Line: number;
	/** [NO DOCUMENTATION] */
	isContextDependentBreakpoint: boolean;
}

/** The DebuggerManager is a special singleton class responsible for managing Roblox's Lua Debugger feature.
 * 
 * It can be retrieved via the `DebuggerManager()` function, but only from plugins or the command bar.
 */
interface DebuggerManager extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "DebuggerManager";
	/** Whether the debugger is enabled or disabled.
	 * 	
	 * Whether the debugger is enabled or disabled.
	 * 
	 * Tags: ReadOnly, NotReplicated
	Whether the debugger is enabled or disabled.
	 * 	
	 * Whether the debugger is enabled or disabled.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly DebuggingEnabled: boolean;
	/** Registers a script to be used in the Lua Debugger. Returns a `ScriptDebugger` for the script. */
	AddDebugger(this: DebuggerManager, script: LuaSourceContainer): Instance | undefined;
	/** [NO DOCUMENTATION] */
	EnableDebugging(this: DebuggerManager): void;
	/** Returns a list of `ScriptDebugger` present in the game. */
	GetDebuggers(this: DebuggerManager): Array<Instance>;
	/** Resumes the Lua Debugger if it paused. */
	Resume(this: DebuggerManager): void;
	/** Performs a [step into](https://developer.roblox.com/articles/Lua-debugger) operation on the Lua Debugger. */
	StepIn(this: DebuggerManager): void;
	/** Performs a [step out](https://developer.roblox.com/articles/Lua-debugger) operation on the Lua Debugger. */
	StepOut(this: DebuggerManager): void;
	/** Performs a [step over](https://developer.roblox.com/articles/Lua-debugger) operation on the Lua Debugger. */
	StepOver(this: DebuggerManager): void;
	/** Fired when a new [ScriptDebugger](https://developer.roblox.com/api-reference/class/ScriptDebugger) is created through the [AddDebugger](https://developer.roblox.com/api-reference/function/DebuggerManager/AddDebugger) method. */
	readonly DebuggerAdded: RBXScriptSignal<(debug: Instance) => void>;
	/** Fired when a registered [ScriptDebugger](https://developer.roblox.com/api-reference/class/ScriptDebugger) has been discontinued. */
	readonly DebuggerRemoved: RBXScriptSignal<(debug: Instance) => void>;
}

/** Represents a watch in Roblox's Lua Debugger.
 * 
 * This object cannot be created, but it can be retrieved from the `ScriptDebugger` class.
 */
interface DebuggerWatch extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "DebuggerWatch";
	/** The expression set for the DebuggerWatch. */
	Expression: string;
}

interface File extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "File";
	/** 
	 * Tags: Hidden, ReadOnly, NotReplicated
	
	 * Tags: Hidden, ReadOnly, NotReplicated
	 *
	 * Tags: Hidden, ReadOnly, NotReplicated
	 */
	readonly Size: number;
	/** [NO DOCUMENTATION] */
	GetBinaryContents(this: File): string;
	/** [NO DOCUMENTATION] */
	GetTemporaryId(this: File): string;
}

/** Various miscellaneous options for in-game. Can be accessed from Roblox Studio's settings menu under the _Game_ tab. */
interface GameSettings extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "GameSettings";
	/** Used internally by Roblox to add additional CoreScript loading directories.
	 * 
	 * The value of this string should be full paths to each directory, separated only by semicolons (`;`)
	 */
	readonly AdditionalCoreIncludeDirs: string;
	/** When a bubble of the official bubblechat appears, this property determines after how much seconds it should disappear automaticly. */
	BubbleChatLifetime: number;
	/** Max amounts of chat bubbles that may appear above one player's head. */
	BubbleChatMaxBubbles: number;
	/** The maximum number of chats that can be shown in the chat history. Does not seem to work because the chat gui's code does not read from here. */
	ChatHistory: number;
	/** The maximum number of chats that can stack and show on the screen. Does not seem to work because the chat gui's code does not read from here. */
	ChatScrollLength: number;
	/** Toggles whether or not Roblox should use the Hardware Mouse or the Software Mouse. */
	HardwareMouse: boolean;
	/** Describes a path to a .lua file that will be ran in place of the default StarterScript. */
	readonly OverrideStarterScript: string;
	/** Sets how many of the latest chat messages should be included in an abuse report request. */
	ReportAbuseChatHistory: number;
	/** **(OBSOLETE)** */
	SoftwareSound: boolean;
	/** Toggles whether or not video capture is enabled. */
	VideoCaptureEnabled: boolean;
	/** Sets the quality level of Roblox's built-in video capture. */
	VideoQuality: Enum.VideoQualitySettings;
	/** [NO DOCUMENTATION] *
	 * Tags: NotReplicated
	 */
	readonly VideoRecording: boolean;
	/** [NO DOCUMENTATION] */
	readonly VideoRecordingChangeRequest: RBXScriptSignal<(recording: boolean) => void>;
}

/** PluginGui is an abstract class for GUIs that allow the display of [GuiObjects](https://developer.roblox.com/api-reference/class/GuiObject) in various Roblox Studio widgets. As of right now, the only available PluginGui type is `DockWidgetPluginGui`, but there may be more in the future! */
interface PluginGui extends LayerCollector {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "DockWidgetPluginGui" | "QWidgetPluginGui";
	/** The title that is displayed above the contents of the PluginGui. */
	Title: string;
	/** This function binds a function to the [PluginGui’s](https://developer.roblox.com/api-reference/class/PluginGui) close button, overriding the default behavior.
	 * 
	 * By default, when the user clicks the ‘x’ button in the top right corner of the `PluginGui` the [Enabled](https://developer.roblox.com/api-reference/property/LayerCollector/Enabled) property is set to *false*, closing the window. When a custom function is bound using BindToClose this behavior is overwritten, allowing you to check if the user really wants to close the window or give them an opportunity to save their work.
	 * 
	 * As the default closing behavior is overwritten by this function, you’ll need to configure the `PluginGui` to close manually by setting [PluginGui.Enabled](https://developer.roblox.com/api-reference/property/LayerCollector/Enabled) to *false*. For example, in the below snippet users are required to click a confirm button to close the GUI:
	 * 
	 * ```lua
	 * local closing = false
	 * pluginGui:BindToClose(function()
	 * ```
	 * 
	 * lua
	 * 
	 * -- make sure we haven't already made a button
	 * 
	 * if closing then
	 * 
	 *     return
	 * 
	 * end
	 * 
	 * closing = true
	 * 
	 * ```lua
	 * 
	 * ```
	 * 
	 * lua
	 * 
	 * -- create confirm button
	 * 
	 * local confirmButton = Instance.new("TextButton")
	 * 
	 * confirmButton.AnchorPoint = Vector2.new(0.5, 0.5)
	 * 
	 * confirmButton.Size = UDim2.new(0.5, 0, 0.5, 0)
	 * 
	 * confirmButton.Position = UDim2.new(0.5, 0, 0.5, 0)
	 * 
	 * confirmButton.BackgroundColor3 = Color3.new(1, 0, 0)
	 * 
	 * confirmButton.Text = "Close?"
	 * 
	 * confirmButton.Parent = pluginGui
	 * 
	 * ```lua
	 * 
	 * ```
	 * 
	 * lua
	 * 
	 * -- listen for click
	 * 
	 * confirmButton.Activated:Connect(function()
	 * 
	 *     -- close the gui
	 * 
	 *     pluginGui.Enabled = false
	 * 
	 *     -- remove confirm button
	 * 
	 *     confirmButton:Destroy()
	 * 
	 * end)
	 * 
	 * ```lua
	 * end)
	 * ```
	 * 
	 * You can call BindToClose with no argument to ‘unbind’ and revert to the default behavior described above. For example:
	 * 
	 * ```lua
	 * pluginGui:BindToClose()
	 * ```
	 * 
	 * ## See also
	 * 
	 *  - [Plugin.CreateDockWidgetPluginGui](https://developer.roblox.com/api-reference/function/Plugin/CreateDockWidgetPluginGui) to create a `PluginGui`
	 * 
	 *  - [DataModel.BindToClose](https://developer.roblox.com/api-reference/function/DataModel/BindToClose), which can be used to bind a function to the game ending and should not be confused with this function
	 * @param function The function to bind the close button to. If no function is specified then any previously specified function will be unbound 
	 */
	BindToClose(this: PluginGui, callback?: Function): void;
	/** [NO DOCUMENTATION] */
	GetRelativeMousePosition(this: PluginGui): Vector2;
	/** [NO DOCUMENTATION] */
	readonly PluginDragDropped: RBXScriptSignal<(dragData: object) => void>;
	/** [NO DOCUMENTATION] */
	readonly PluginDragEntered: RBXScriptSignal<(dragData: object) => void>;
	/** [NO DOCUMENTATION] */
	readonly PluginDragLeft: RBXScriptSignal<(dragData: object) => void>;
	/** [NO DOCUMENTATION] */
	readonly PluginDragMoved: RBXScriptSignal<(dragData: object) => void>;
	/** [NO DOCUMENTATION] */
	readonly WindowFocusReleased: RBXScriptSignal<() => void>;
	/** [NO DOCUMENTATION] */
	readonly WindowFocused: RBXScriptSignal<() => void>;
}

/** **DockWidgetPluginGui** is a `PluginGui` that displays its contents inside a dockable Roblox Studio window. It is used to create widgets similar to the built-in **Animation Editor** and **Terrain Tools**.
 * 
 * This GUI can be created using [Plugin:CreateDockWidgetPluginGui()](https://developer.roblox.com/api-reference/function/Plugin/CreateDockWidgetPluginGui).
 * 
 * See the [Building Studio Widgets](https://developer.roblox.com/search#stq=building%20studio%20widgets) tutorial for details on working with custom Studio widgets.
 */
interface DockWidgetPluginGui extends PluginGui {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "DockWidgetPluginGui";
}

interface QWidgetPluginGui extends PluginGui {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "QWidgetPluginGui";
}

interface KeyframeSequence extends Instance {
	AuthoredHipHeight: number;
}

/** The KeyframeSequenceProvider is a service that is used to load and preview `KeyframeSequence`s. It includes a number of functions that are useful when working with `Animation`s.
 * 
 * ## What is a KeyframeSequence?
 * 
 * The animation data Roblox uses in the playback of an animation, referenced by the [Animation.AnimationId](https://developer.roblox.com/api-reference/property/Animation/AnimationId) property, is constructed from a `KeyframeSequence`. Every animation has a `KeyframeSequence` associated with it. `KeyframeSequence`s are usually created by the Roblox Animation Editor but can be created through other plugins or even manually.
 * 
 * For more information, see the `KeyframeSequence` page.
 * 
 * ## What does the KeyframeSequenceProvider do?
 * 
 * The KeyframeSequenceProvider has a number of uses.
 * 
 *  - Download the `KeyframeSequence` associated with an animation content ID from the Roblox website
 * 
 *  - Generate a temporary id to locally preview an animation
 * 
 *  - Fetch the content IDs of animations owned by a particular user.
 */
interface KeyframeSequenceProvider extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "KeyframeSequenceProvider";
	GetMemStats(this: KeyframeSequenceProvider): object;
	/** Generates a temporary asset ID from a `KeyframeSequence` that can be used for localized testing of an animation.
	 * 
	 * This function performs the same function to [KeyframeSequenceProvider.RegisterKeyframeSequence](https://developer.roblox.com/api-reference/function/KeyframeSequenceProvider/RegisterKeyframeSequence) however this function generates an *active:/ URL instead of a hash.
	 * 
	 * The ID generated can be used in an `Animation`'s [Animation.AnimationId](https://developer.roblox.com/api-reference/property/Animation/AnimationId) property for testing.
	 * 
	 * The asset ID generated by this function is temporary and cannot be used outside of Studio. Developers wishing to generate an asset ID that can be used online should upload the `KeyframeSequence` to Roblox.
	 * @param keyframeSequence The `KeyframeSequence` to be used.
	 * @returns A temporary asset ID generated for localized animation playback.
	 */
	RegisterActiveKeyframeSequence(this: KeyframeSequenceProvider, keyframeSequence: KeyframeSequence): string;
	/** Generates a temporary asset ID from a `KeyframeSequence` that can be used for localized testing of an animation.
	 * 
	 * This function performs the same function to [KeyframeSequenceProvider.RegisterActiveKeyframeSequence](https://developer.roblox.com/api-reference/function/KeyframeSequenceProvider/RegisterActiveKeyframeSequence) however this function generates a hash instead of an *active:/ URL.
	 * 
	 * The ID generated can be used for the [Animation.AnimationId](https://developer.roblox.com/api-reference/property/Animation/AnimationId) property to test animations.
	 * 
	 * The asset ID generated by this function is temporary and cannot be used outside of Studio. Developers wishing to generate an asset ID that can be used online should upload the `KeyframeSequence` to Roblox.
	 * @param keyframeSequence The `KeyframeSequence` to be used.
	 * @returns A temporary asset ID generated for localized animation playback.
	 */
	RegisterKeyframeSequence(this: KeyframeSequenceProvider, keyframeSequence: KeyframeSequence): string;
	/** This function returns an `InventoryPages` object which can be used to iterate over animations owned by a specific user.
	 * 
	 * This function has a number of potential uses, such as allowing users to browse and import animations into a custom animation plugin.
	 * @param userId The user ID of the user.
	 * @returns An `InventoryPages` of animations.
	 */
	GetAnimations(this: KeyframeSequenceProvider, userId: number): InventoryPages;
	/** GetKeyframeSequenceAsync returns a `KeyframeSequence` based on the specified assetId. The assetId must correspond to an animation. The function will yield until the `KeyframeSequence` is loaded from the website. Because this is a webcall it should wrapped in a pcall.
	 * @param assetId The content ID of the animation.
	 * @returns The `KeyframeSequence` found.
	 */
	GetKeyframeSequenceAsync(this: KeyframeSequenceProvider, assetId: string): KeyframeSequence;
}

/** The LuaSettings allows you to change certain properties, in regards to how Roblox handles Lua.
 * 
 * It is labeled as **Lua** in the Roblox Studio Settings menu.
 */
interface LuaSettings extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "LuaSettings";
	/** Toggles whether or not script starts are logged in the output.
	 * 
	 * If set to true, the output will print blue text indicating what scripts are running, and their origin point in the DataModel.
	 */
	AreScriptStartsReported: boolean;
	/** How long a call to `wait()` with no arguments will yield. */
	DefaultWaitTime: number;
	/** Sets the maximum percent of Roblox's duty cycle that can be used to resume waiting Lua threads.
	 * 
	 * This defaults to 0.1 (or 10%)
	 */
	WaitingThreadsBudget: number;
}

interface Script extends BaseScript {
	/** The code to be executed. */
	Source: string;
}

interface ModuleScript extends LuaSourceContainer {
	/** The code to be executed. */
	Source: string;
}

interface MemStorageConnection extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "MemStorageConnection";
	/** [NO DOCUMENTATION] */
	Disconnect(this: MemStorageConnection): void;
}

/** The PluginMouse object gives `Plugin`s access to the mouse. It works like the `Mouse` object and can be obtained using the plugin [Plugin.GetMouse](https://developer.roblox.com/api-reference/function/Plugin/GetMouse) method.
 * 
 * Note the PluginMouse can only be used when the plugin has been activated using [Plugin.Activate](https://developer.roblox.com/api-reference/function/Plugin/Activate).
 * 
 * In addition to the functions from the `Mouse` object, the PluginMouse includes the [PluginMouse.DragEnter](https://developer.roblox.com/api-reference/event/PluginMouse/DragEnter) function which keeps track of items being selected whilst the mouse is dragging.
 * 
 * For more information on how to use mouse objects, see the `Mouse` page.
 */
interface PluginMouse extends Mouse {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PluginMouse";
	/** Fired when Instances are being selected while the mouse is dragging. */
	readonly DragEnter: RBXScriptSignal<(instances: Array<Instance>) => void>;
}

interface MultipleDocumentInterfaceInstance extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "MultipleDocumentInterfaceInstance";
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly FocusedDataModelSession: Instance | undefined;
	/** [NO DOCUMENTATION] */
	readonly DataModelSessionEnded: RBXScriptSignal<(dataModelSession: DataModelSession) => void>;
	/** [NO DOCUMENTATION] */
	readonly DataModelSessionStarted: RBXScriptSignal<(dataModelSession: DataModelSession) => void>;
}

/** The NetworkPeer object is the most basic class of the network objects. */
interface NetworkPeer extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "NetworkClient" | "NetworkServer";
	/** Sets the maximum outgoing bandwidth that Roblox can use. */
	SetOutgoingKBPSLimit(this: NetworkPeer, limit: number): void;
}

/** This service is responsible for connecting a client to a server. */
interface NetworkClient extends NetworkPeer {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "NetworkClient";
	readonly ConnectionAccepted: RBXScriptSignal<(peer: string, replicator: ClientReplicator) => void>;
}

/** The NetworkServer stores all the `NetworkReplicator` in the game and handles all connections. [NetworkPeer.SetOutgoingKBPSLimit](https://developer.roblox.com/api-reference/function/NetworkPeer/SetOutgoingKBPSLimit) can be used to imitate latency while using _Start Server_. */
interface NetworkServer extends NetworkPeer {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "NetworkServer";
}

/** An object which handles the replication of other objects either from the server to the client, or from the client to the server. */
interface NetworkReplicator extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "ClientReplicator" | "ServerReplicator";
	/** Returns the player that is connected to the NetworkReplicator. */
	GetPlayer(this: NetworkReplicator): Player;
}

/** The ClientReplicator is in charge of replicating changes from the server over to the client. It represents the client's connection to a server. */
interface ClientReplicator extends NetworkReplicator {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "ClientReplicator";
}

/** The ServerReplicator's job is to replicate changes from other clients and the server over to a certain client. */
interface ServerReplicator extends NetworkReplicator {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "ServerReplicator";
}

/** NetworkSettings is a settings class that allow you to debug a lot of features with Roblox's server/client networking.
 * 
 * It can be found in Roblox Studio's settings, under the **Network** tab.
 */
interface NetworkSettings extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "NetworkSettings";
	/** ExtraMemoryUsed is an unused debug property intended for streaming.
	 * 
	 * It appears to specify how much extra memory is allocated to streaming, in MBs.
	 * 	
	 * ExtraMemoryUsed is an unused debug property intended for streaming.
	 * 
	 * It appears to specify how much extra memory is allocated to streaming, in MBs.
	 * 
	 * Tags: Hidden, NotReplicated
	ExtraMemoryUsed is an unused debug property intended for streaming.
	 * 
	 * It appears to specify how much extra memory is allocated to streaming, in MBs.
	 * 	
	 * ExtraMemoryUsed is an unused debug property intended for streaming.
	 * 
	 * It appears to specify how much extra memory is allocated to streaming, in MBs.
	 * 
	 * Tags: Hidden, NotReplicated
	 *
	 * Tags: Hidden, NotReplicated
	 */
	ExtraMemoryUsed: number;
	/** FreeMemoryMBytes is a read-only property that describes how much free memory is available, in MBs.
	 * 
	 * It is stored as a floating point number, so it can be be read down at the level of available bytes by multiplying its value by `1024 * 1024`.
	 * 	
	 * FreeMemoryMBytes is a read-only property that describes how much free memory is available, in MBs.
	 * 
	 * It is stored as a floating point number, so it can be be read down at the level of available bytes by multiplying its value by `1024 * 1024`.
	 * 
	 * Tags: Hidden, ReadOnly, NotReplicated
	FreeMemoryMBytes is a read-only property that describes how much free memory is available, in MBs.
	 * 
	 * It is stored as a floating point number, so it can be be read down at the level of available bytes by multiplying its value by `1024 * 1024`.
	 * 	
	 * FreeMemoryMBytes is a read-only property that describes how much free memory is available, in MBs.
	 * 
	 * It is stored as a floating point number, so it can be be read down at the level of available bytes by multiplying its value by `1024 * 1024`.
	 * 
	 * Tags: Hidden, ReadOnly, NotReplicated
	 *
	 * Tags: Hidden, ReadOnly, NotReplicated
	 */
	readonly FreeMemoryMBytes: number;
	/** [NO DOCUMENTATION] */
	readonly HttpProxyEnabled: boolean;
	/** [NO DOCUMENTATION] */
	readonly HttpProxyURL: string;
	/** IncommingReplicationLag is a property that allows you to simulate high-latency situations. It adds a delay time between when packets are actually sent and received. The property is measured in seconds, and defaults to 0. */
	IncommingReplicationLag: number;
	/** PrintFilters is a diagnostics property that allows developers to see what changes are being filtered while [Workspace.FilteringEnabled](https://developer.roblox.com/api-reference/property/Workspace/FilteringEnabled) is set to true. It's important to note that this property will only work while in a local server.
	 * 
	 * When set to true, there are several conditions where warnings will be printed into the output, as listed below:
	 * 
	 * ----------
	 * 
	 * Instance Replication
	 * 
	 * If the client creates an instance and parents it into another instance that is visible to the server, the following warning is printed:
	 * 
	 * "**Filtering is enabled. New Instance `{1}` will not be replicated.**"
	 * 
	 * •  `{1}` — The hierarchical location of the hew instance in the `DataModel`.
	 * 
	 * ----------
	 * 
	 * Property Replication
	 * 
	 * If the client changes the property of an instance that is visible to the server, the following warning is printed:
	 * 
	 * "**Filtering is enabled. Property `{1}` change for instance `{2}` will not be replicated.**"
	 * 
	 * • `{1}` — The name of the property.
	 * 
	 * • `{2}` — The hierarchical location of the instance in the `DataModel`.
	 * 
	 * ----------
	 * 
	 * Event Replication
	 * 
	 * If an instance's event is fired by the client and it's normally able to replicate to the server, the following warning is printed:
	 * 
	 * "**Filtering is enabled. Event `{1}` for instance `{2}` will not be replicated.**"
	 * 
	 * • `{1}` — The name of the event.
	 * 
	 * • `{2}` — The hierarchical location of the instance in the `DataModel`.
	 * 
	 * ----------
	 * 
	 * Terrain Voxel Replication
	 * 
	 * If the client changes a `Terrain` cell, the following warning is printed:
	 * 
	 * "**Filtering is enabled, terrain cell change will not be replicated.**"
	 * 
	 * ----------
	 */
	PrintFilters: boolean;
	/** [NO DOCUMENTATION] */
	PrintJoinSizeBreakdown: boolean;
	/** When set to true, debug messages will be printed into the output, pertaining to physics replication errors. There are several debug outputs that are made available when this property is set to true, as listed below.
	 * 
	 * Note that this property is intended for Roblox engineers who are debugging network replication. This documentation may become outdated in the future, as Roblox’s network code is always changing behind the scenes.
	 * 
	 * ---
	 * 
	 * Outdated Physics Packet
	 * 
	 * This following debug message is printed if the PhysicsReceiver receives a mechanism update packet for a part that has been updated ahead of the packet's submission time:
	 * 
	 * `Physics-in old packet`
	 * 
	 * This happens if the packet is received late, and a newer packet has already been processed.
	 * 
	 * ---
	 * 
	 * Unknown Part
	 * 
	 * This following debug message is printed if the PhysicsReceiver cannot find the part that is trying to be updated, because the provided Instance identifier was invalid:
	 * 
	 * `Physics-in of unidentified {GUID}`
	 * 
	 * (Where `{GUID}` is the unknown [Instance.GetDebugId](https://developer.roblox.com/api-reference/function/Instance/GetDebugId) identifier that is supposed to be targeting the part)
	 * 
	 * This typically happens if a part is removed before the physics update packet is received.
	 * 
	 * ---
	 * 
	 * Invalid Part
	 * 
	 * This following debug message is printed if the PhysicsReceiver receives a request to update the physics of a part that is not a descendant of the Workspace:
	 * 
	 * `Physics-in of part not in workspace {GUID}`
	 * 
	 * (Where `{GUID}` is the [Instance.GetDebugId](https://developer.roblox.com/api-reference/function/Instance/GetDebugId) identifier of the target part)
	 * 
	 * This usually happens if the part was just moved out of the Workspace, and was previously being simulated.
	 * 
	 * ---
	 */
	PrintPhysicsErrors: boolean;
	/** When set to true, debug information is printed to the output regarding the replication of instances when [Workspace.StreamingEnabled](https://developer.roblox.com/api-reference/property/Workspace/StreamingEnabled) is set to true. There are several debug outputs that are made available when this property is set to true, as listed below.
	 * 
	 * Note that this property is intended for Roblox engineers who are debugging network replication. This documentation may become outdated in the future, as Roblox’s network code is always changing behind the scenes.
	 * 
	 * ---
	 * 
	 * Streaming Capacity Update
	 * 
	 * When the client's streaming capacity is updated, the following debug message will be printed:
	 * 
	 * `clientInstanceQuota {1}, packet in queue {2}, predictedTotalInstanceProcessTime {3}, avgStreamDataReadTime {4}, avgInstancesPerStreamData {5}`
	 * 
	 * **The numbers in curly braces are substituted, and can be described as:**
	 * 
	 * • `{1}` – The id of the client instance quota.
	 * 
	 * • `{2}` – The current number of incoming packets that have been queued.
	 * 
	 * • `{3}` – A prediction for how long it will take to update the quota.
	 * 
	 * • `{4}` – The current average time it takes to read the stream data.
	 * 
	 * • `{5}` – The average number of instances in the stream data.
	 * 
	 * ---
	 * 
	 * Instance Quota Update
	 * 
	 * When the client receives an instance quota update, the following debug message will be printed:
	 * 
	 * `Received new client instance quota: {1}, max region radius: {2}`
	 * 
	 * **The numbers in curly braces are substituted, and can be described as:**
	 * 
	 * • `{1}` – The id of the client instance quota.
	 * 
	 * • `{2}` – The maximum radius of space around the client's [Player.ReplicationFocus](https://developer.roblox.com/api-reference/property/Player/ReplicationFocus) that can have physical instances streamed in.
	 * 
	 * ---
	 */
	PrintStreamInstanceQuota: boolean;
	/** When set to true, a debug message will be printed to the output, when a physics `Touched` event is replicated. This includes the [BasePart.Touched](https://developer.roblox.com/api-reference/event/BasePart/Touched) event, and the [BasePart.TouchEnded](https://developer.roblox.com/api-reference/event/BasePart/TouchEnded) event.
	 * 
	 * Note that this property is intended for Roblox engineers who are debugging network replication. This documentation may become outdated in the future, as Roblox’s network code is always changing behind the scenes.
	 * 
	 * ---
	 * 
	 * Sending 'Contact Start'
	 * 
	 * When the replicator is sending that contact between two parts has started, the following debug message will be printed:
	 * 
	 * `Replication: Touch:{1}-&gt;{2} &gt;&gt; {3}, bytes: {4}`
	 * 
	 * **The numbers in curly braces are substituted, and can be described as:**
	 * 
	 * • `{1}` – The name of the 1st part.
	 * 
	 * • `{2}` – The name of the 2nd part.
	 * 
	 * • `{3}` – The IP of the peer sending the change.
	 * 
	 * • `{4}` – The number of bytes that were sent to send the change.
	 * 
	 * ---
	 * 
	 * Sending 'Contact End'
	 * 
	 * When the replicator is sending that contact between two parts has ended, the following debug message will be printed:
	 * 
	 * `Replication: Untouch:{1}-&gt;{2} &gt;&gt; {3}, bytes: {4}`
	 * 
	 * **The numbers in curly braces are substituted, and can be described as:**
	 * 
	 * • `{1}` – The name of the 1st part.
	 * 
	 * • `{2}` – The name of the 2nd part.
	 * 
	 * • `{3}` – The IP of the peer sending the change.
	 * 
	 * • `{4}` – The number of bytes that were sent to send the change.
	 * 
	 * ---
	 * 
	 * Receiving 'Contact Start'
	 * 
	 * When the replicator is receiving that contact between two parts has started, the following debug message will be printed:
	 * 
	 * `Replication: Touch:{1}-&gt;{2} &lt;&lt; {3}`
	 * 
	 * **The numbers in curly braces are substituted, and can be described as:**
	 * 
	 * • `{1}` – The name of the 1st part.
	 * 
	 * • `{2}` – The name of the 2nd part.
	 * 
	 * • `{3}` – The IP of the peer receiving the change.
	 * 
	 * ---
	 * 
	 * Receiving 'Contact End'
	 * 
	 * When the replicator is receiving that contact between two parts has ended, the following debug message will be printed:
	 * 
	 * `Replication: Untouch:{1}-&gt;{2} &lt;&lt; {3}`
	 * 
	 * **The numbers in curly braces are substituted, and can be described as:**
	 * 
	 * • `{1}` – The name of the 1st part.
	 * 
	 * • `{2}` – The name of the 2nd part.
	 * 
	 * • `{3}` – The IP of the peer receiving the change.
	 * 
	 * ---
	 */
	PrintTouches: boolean;
	/** ![RenderStreamedRegions in action!][1]
	 * 
	 * When set to true, regions of space that are being streamed to the client will be outlined in red.
	 * 
	 * This will only be shown if [Workspace.StreamingEnabled](https://developer.roblox.com/api-reference/property/Workspace/StreamingEnabled) is set to true.
	 * 
	 * [1]: https://developer.roblox.com/assets/blte3c189bb8bdbf8e3/ShowStreamedRegions.png
	 */
	RenderStreamedRegions: boolean;
	/** When set to true, a label will be shown above each `Player`'s head, showing the current animation being played by the Player's `Humanoid`, if any. */
	ShowActiveAnimationAsset: boolean;
	/** TrackDataTypes is a diagnostics property that, when set to true, tells the replicator stats to sample data about packets that are being sent. */
	TrackDataTypes: boolean;
	/** TrackPhysicsDetails is a diagnostics property that, when set to true, tells the replicator stats to sample replication physics details. */
	TrackPhysicsDetails: boolean;
}

interface Model extends PVInstance {
	/** Automatically generate impostor meshes to be rendered outside of streaming radius. */
	LevelOfDetail: Enum.ModelLevelOfDetail;
}

interface WorldRoot extends Model {
	IKMoveTo(this: WorldRoot, part: BasePart, target: CFrame, translateStiffness?: number, rotateStiffness?: number, collisionsMode?: CastsToEnum<Enum.IKCollisionsMode>): void;
}

interface Workspace extends WorldRoot {
	readonly BreakJoints: any;
	readonly MakeJoints: any;
	/** Positions and zooms the [Workspace.CurrentCamera](https://developer.roblox.com/api-reference/property/Workspace/CurrentCamera) to show the extent of `BasePart`s currently in the `Workspace`.
	 * 
	 * This function was used in the, now removed, 'Zoom To Extents' button in Roblox Studio. It exhibits similar behavior to the 'Zoom To' (F shortcut) feature, however it shows the extents of the `Workspace` rather than the currently selected object.
	 * 
	 * This function cannot be used in scripts but will function in the command bar or plugins.
	 */
	ZoomToExtents(this: Workspace): void;
}

interface PackageService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PackageService";
}

/** The PhysicsSettings is a singleton class, which lets developers view  debugging features in Roblox's physics engine.It can be found under the Physics tab in Roblox Studio's settings menu. */
interface PhysicsSettings extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PhysicsSettings";
	/** When set to true, physically simulated objects will stop being simulated if they have little to no motion for a set period of time. */
	AllowSleep: boolean;
	/** When set to true, parts that are [BasePart.Anchored](https://developer.roblox.com/api-reference/property/BasePart/Anchored) will show a gray surface outline on the surface of the part's bounding box that is currently facing the ground. */
	AreAnchorsShown: boolean;
	/** When set to true, each physics assembly is assigned a unique color and the `Part` associated with the assembly are outlined with the color. Parts that are attached together by `JointInstance` will share the same color. */
	AreAssembliesShown: boolean;
	/** When set to true, parts that are actively being physically simulated will have a red outline. */
	AreAwakePartsHighlighted: boolean;
	/** When set to true, `Part` will be outlined with a specific color, depending on the state of its root simulation body.
	 * 
	 * ## Body Types
	 * 
	 * | Color | Body Type | Description |
	 * | --- |
	 * |  | Real Time Body | Physics Body that is always simulated in real time, and is never throttled. Used for Humanoids. |
	 * |  | Free Fall Body | Physics Body that is freely moving with no physical contact. |
	 * |  | Joint Body | Physics Body that is being influenced by a physically simulated joint, such as a Motor or a Hinge. |
	 * |  | Contact Body | Physics Body that is in contact with another physics body. |
	 * |  | Symmetric Contact Body | Physics Body that is experiencing a torquing force, while in contact with another body. |
	 * |  | Vertical Contact Body | Physics Body that is moving very little along the Y plane, while in contact with another body. |
	 */
	AreBodyTypesShown: boolean;
	/** When set to true, each contact island will render `SelectionBox` adorns on the parts in contact islands, where each contact island is assigned a random color. */
	AreContactIslandsShown: boolean;
	/** When set to true, sphere adorns will be drawn at the contact points of each part where physics interactions are occurring.
	 * 
	 * Each sphere also has an arrow drawn in 3D, facing the surface that the contact point is detecting.
	 * 
	 * ## Solver Variations
	 * 
	 * The behavior of this property varies depending on whether Roblox's physics engine is using the _PGS Physics Solver_, or the _Spring Physics Solver_.
	 * 
	 * This is controlled by the `Workspace`'s [Workspace.PGSPhysicsSolverEnabled](https://developer.roblox.com/search#stq=PGSPhysicsSolverEnabled) property.
	 * 
	 * ### Spring Physics Solver
	 * 
	 * When [Workspace.PGSPhysicsSolverEnabled](https://developer.roblox.com/search#stq=PGSPhysicsSolverEnabled) is set to false, the contact points are color coded as listed below.
	 * 
	 * The length of the arrow extruding from the sphere depends on how much force the contact point is exerting, and what the contact type is.
	 * 
	 * | Color | Contact Type | Description |
	 * | --- |
	 * |  | Normal Contact | Contact point with no special conditions. |
	 * |  | Resting Contact | Contact point that has been active for at least 4 frames. |
	 * |  | Second Pass Contact | Contact point that was made by a kernel joint going through a second pass. Rarely seen. |
	 * |  | Real Time Contact | Contact point that was made with a real-time physics body. This applies to tripped `Humanoid`. |
	 * |  | Joint Contact | Contact point that was made under the context of a physically simulated joint. This applies to Motors and Hinges. |
	 * 
	 * ### PGS Physics Solver
	 * 
	 * When [Workspace.PGSPhysicsSolverEnabled](https://developer.roblox.com/search#stq=PGSPhysicsSolverEnabled) is set to true, the contact points are always colored **RED**, and the length of the arrow will always be 1 stud.
	 * 
	 * There are no special conditions tracked, because the PGS solver does not keep specific lookup tables for the states listed in the Spring Solver.
	 * 
	 * | Color | Contact Type | Description |
	 * | --- |
	 * |  | Normal Contact | Contact point with no special conditions. |
	 */
	AreContactPointsShown: boolean;
	/** When set to true, XYZ axes are rendered at the [BasePart.CFrame](https://developer.roblox.com/api-reference/property/BasePart/CFrame) of every part. */
	AreJointCoordinatesShown: boolean;
	/** When set to true, every individual mechanism of parts is given a unique color. */
	AreMechanismsShown: boolean;
	/** An ancient property that hasn't work correctly since late 2007.
	 * 
	 * It's supposed to render an XYZ axis on the root part of a `Model`, but the axis rendering component doesn't work correctly.
	 */
	AreModelCoordsShown: boolean;
	/** When set to true, each `Player`'s character is outlined with a unique color, and each part that the player has network ownership over is outlined with the same color. */
	AreOwnersShown: boolean;
	/** An ancient property that hasn't worked correctly since late 2007.
	 * 
	 * It's supposed to render a large XYZ axis in the center of each `BasePart`, but the axis rendering component doesn't work correctly.
	 */
	ArePartCoordsShown: boolean;
	/** When set to true, a cylinder is drawn around each `Player`'s character, representing their [Player.SimulationRadius](https://developer.roblox.com/api-reference/property/Player/SimulationRadius).
	 * 
	 * Each physically simulated object will check to see which player is closest to that object, and if they are within the player's simulation radius. If both conditions are met, that player will becomes the network owner of that object.When set to true, a cylinder is drawn around each `Player`'s character, representing their [Player.SimulationRadius](https://developer.roblox.com/api-reference/property/Player/SimulationRadius).
	 */
	AreRegionsShown: boolean;
	/** [NO DOCUMENTATION] */
	AreTerrainReplicationRegionsShown: boolean;
	/** When set to true, parts that aren't aligned on the 1x1x1 grid will be outlined yellow. */
	AreUnalignedPartsShown: boolean;
	/** An ancient property that hasn't worked correctly since late 2007.
	 * 
	 * It's supposed to render a large XYZ axis in the center of the world, but the axis rendering component doesn't work correctly.
	 */
	AreWorldCoordsShown: boolean;
	/** When set to true, Roblox will fall back to using its legacy CSG solver when performing [solid model operations](https://developer.roblox.com/articles/3D-Modeling-with-Parts). */
	DisableCSGv2: boolean;
	/** This property is supposed to show the [BasePart.ReceiveAge](https://developer.roblox.com/api-reference/property/BasePart/ReceiveAge) of a part, but it does not work correctly. */
	IsReceiveAgeShown: boolean;
	/** When set to true, the joint connections of each part, and the states of their underlying primitive components are visualized as a spanning tree.
	 * 
	 * ## Spanning Tree Table
	 * 
	 * There are several visualizations made available when this property is set to true:
	 * 
	 * | Color | Adorn Type | Description |
	 * | --- |
	 * |  | Box | Root Primitive of a Mechanism that is currently anchored, or connected to an anchored primitive. (See: [BasePart.IsGrounded](https://developer.roblox.com/api-reference/function/BasePart/IsGrounded)) |
	 * |  | Box | Root Primitive of a Mechanism that is free to be physically simulated. |
	 * |  | Box | Root Primitive of a Mechanism that has moving components. |
	 * |  | Sphere | Root Primitive of an Assembly. |
	 * |  | Cylinder | Root Primitive of a Clump. |
	 * |  | Line | Connection between two Primitives that share the same Assembly and Clump. |
	 * |  | Line | Connection between two Primitives that share the same Assembly. |
	 * |  | Line | Connection between two Primitives. |
	 */
	IsTreeShown: boolean;
	/** Controls the throttle rate of Roblox's physics engine.
	 * 
	 * By default, the physics engine will adjust the physics environment throttle depending on how much work the physics engine is doing, and the current framerate. See the enum page for [EnviromentalPhysicsThrottle](https://developer.roblox.com/api-reference/enum/EnviromentalPhysicsThrottle) for more information.Controls the throttle rate of Roblox's physics engine.
	 */
	PhysicsEnvironmentalThrottle: Enum.EnviromentalPhysicsThrottle;
	/** When set to true, the underlying collision geometry for `PartOperation` and `MeshPart` is rendered. */
	ShowDecompositionGeometry: boolean;
	/** If the [PhysicsSettings.PhysicsEnvironmentalThrottle](https://developer.roblox.com/api-reference/property/PhysicsSettings/PhysicsEnvironmentalThrottle) is set to _DefaultAuto_, this specifies the maximum time that the physics environmental throttle has to wait before it is allowed to automatically change. */
	ThrottleAdjustTime: number;
	/** If set to true, version 2 of Roblox's CSG solver will be used instead of version 1. */
	UseCSGv2: boolean;
}

interface Player extends Instance {
	/** Sets the [AccountAge](https://wiki.roblox.com/index.php?title=AccountAge) of the player. */
	SetAccountAge(this: Player, accountAge: number): void;
	/** Sets whether or not the player sees [filtered chats](https://wiki.roblox.com/index.php?title=FilterStringForPlayerAsync), rather than normal chats. */
	SetSuperSafeChat(this: Player, value: boolean): void;
}

interface Players extends Instance {
	/** This function makes the local player chat the given message. Since this item is protected, attempting to use it in a `Script` or `LocalScript` will cause an error.
	 * 
	 * Instead, when creating a custom chat system, or a system that needs access to the chat, you can use the `Chat` service's [Chat.Chat](https://developer.roblox.com/api-reference/function/Chat/Chat) function instead.
	 * 
	 * ## See also
	 * 
	 *  - [Lua Chat System](https://developer.roblox.com/search#stq=Lua-Chat-System), a tutorial for creating a more advanced chat system
	 * @param message The message chatted.
	 * @returns void
	 */
	Chat(this: Players, message: string): void;
	/** This function sets whether BubbleChat and ClassicChat are being used, and tells TeamChat and Chat what to do using the `ChatStyle` enum. Since this item is protected, attempting to use it in a `Script` or `LocalScript` will cause an error.
	 * 
	 * This function is used internally when the chat mode is set by the game.
	 * 
	 * If you would like to create a custom chat system where you can define custom functions such as these, take a look at the tutorial [here][1].
	 * 
	 * [1]: https://developer.roblox.com/articles/Lua-Chat-System
	 * @param style The specified chat style being set
	 * @returns void
	 */
	SetChatStyle(this: Players, style?: CastsToEnum<Enum.ChatStyle>): void;
	/** This function makes the [Players.LocalPlayer](https://developer.roblox.com/api-reference/property/Players/LocalPlayer) chat the given message, which will only be viewable by users on the same team. Since this item is protected, attempting to use it in a `Script` or `LocalScript` will cause an error.
	 * 
	 * This function is used internally when the [Players.LocalPlayer](https://developer.roblox.com/api-reference/property/Players/LocalPlayer) sends a message to their team.
	 * 
	 * If you would like to create a custom chat system where you can define custom functions such as these, take a look at the tutorial [here][1].
	 * 
	 * [1]: https://developer.roblox.com/articles/Lua-Chat-System
	 * @param message The message being chatted.
	 * @returns void
	 */
	TeamChat(this: Players, message: string): void;
}

/** Plugin is the main object responsible for creating basic studio widgets. It is a custom add-on to Studio which adds new behavior and features that are not normally included.
 * 
 * Both the [Animation Editor](https://developer.roblox.com/search#stq=using%20animation%20editor) and [Terrain Tools](https://developer.roblox.com/search#stq=Intro%20To%20Terrain) were originally developed as plugins. There are also many plugins made by the Roblox community that you can use to help make games and experiences.
 * 
 * ## See also
 * 
 * [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
 */
interface Plugin extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "Plugin";
	/** Returns whether the user enabled _Collisions_ in studio under the Model tab. */
	readonly CollisionEnabled: boolean;
	/** Returns the grid size the user has set in studio under the Model tab. This can be 1, 0.2 or 0.01, but has rounding errors.
	 * 
	 * The 1/5th option should return 0.2, but could return 0.20000000298023 instead. This code can be used to get the real gridsize:
	 * 
	 * ```lua
	 * local gridsize = plugin.GridSize
	 * if math.abs(gridsize-0.2) < 0.005 then -- Check if the gridsize is between 0.195 and 0.205
	 * 	gridsize = 0.2
	 * elseif math.abs(gridsize-0.01) < 0.005 then -- Between 0.005 and 0.015
	 * 	gridsize = 0.01
	 * else -- Assume it's 1
	 * 	gridsize = 1
	 * end
	 * ```
	 * 
	 */
	readonly GridSize: number;
	readonly HostDataModelType: Enum.StudioDataModelType;
	readonly HostDataModelTypeIsCurrent: boolean;
	readonly MultipleDocumentInterfaceInstance: MultipleDocumentInterfaceInstance | undefined;
	readonly UsesAssetInsertionDrag: boolean;
	/** Sets the state of the calling plugin to activated. Allows mouse control through the [Plugin.GetMouse](https://developer.roblox.com/api-reference/function/Plugin/GetMouse) method. */
	Activate(this: Plugin, exclusiveMouse: boolean): void;
	/** This function creates a `PluginAction` which is an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`. In Roblox Studio, they can be assigned a keyboard shortcut under `File → Advanced → Customize Shortcuts…`, and they can also be added to the Quick Access Toolbar.
	 * 
	 * When an action is triggered, the [PluginAction.Triggered](https://developer.roblox.com/api-reference/event/PluginAction/Triggered) event is signaled.
	 * 
	 * In order for PluginActions work as expected, they must be created using this function.
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginMenu`, a context menu that can be shown in Studio which displays a list of PluginActions and supports submenus
	 * 
	 *   - [Plugin.CreatePluginMenu](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginMenu), creates a PluginMenu
	 * @param actionId Must be a unique string that identifies this PluginAction from others
	 * @param text The displayed name of the action
	 * @param statusTip The displayed description of the action
	 * @param iconName The name of the icon used to display the plugin
	 * @param allowBinding Whether the `PluginAction` will be hidden from Studio's shortcuts view. Useful for contextual actions. Defaults to true
	 * @returns The newly created PluginAction object
	 */
	CreatePluginAction(
		this: Plugin,
		actionId: string,
		text: string,
		statusTip: string,
		iconName?: string,
		allowBinding?: boolean,
	): PluginAction;
	/** This function creates a new `PluginMenu`, which is a context menu that can be shown in Studio that displays a list of [PluginActions](https://developer.roblox.com/api-reference/class/PluginAction) and supports submenus.
	 * 
	 * In order for PluginMenus to work as expected, they must be created using this function.
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
	 * 
	 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
	 * 
	 *   - [PluginMenu.Title](https://developer.roblox.com/api-reference/property/PluginMenu/Title), the text to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.Icon](https://developer.roblox.com/api-reference/property/PluginMenu/Icon), the icon to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.AddAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddAction), adds the given action to the menu
	 * 
	 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
	 * 
	 *   - [PluginMenu.AddMenu](https://developer.roblox.com/api-reference/function/PluginMenu/AddMenu), adds the given menu as a separator
	 * 
	 *   - [PluginMenu.AddSeparator](https://developer.roblox.com/api-reference/function/PluginMenu/AddSeparator), adds a separator between items in the menu
	 * 
	 *   - [PluginMenu.Clear](https://developer.roblox.com/api-reference/function/PluginMenu/Clear), clears the menu
	 * 
	 *   - [PluginMenu.ShowAsync](https://developer.roblox.com/api-reference/function/PluginMenu/ShowAsync), shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. The selected action fires its Triggered event
	 * @param id Unique ID for the menu
	 * @param title The text to be displayed when used as a sub menu
	 * @param icon The icon to be displayed when used as a sub menu
	 * @returns The created `PluginMenu` instance
	 */
	CreatePluginMenu(this: Plugin, id: string, title?: string, icon?: string): PluginMenu;
	/** Gets or creates a new `Toolbar` with the specified name, which is then used to create a plugin button. */
	CreateToolbar(this: Plugin, name: string): PluginToolbar;
	/** Deactivates this plugin. This will disengage the associated `PluginMouse` if it has been activated. */
	Deactivate(this: Plugin): void;
	GetItem(this: Plugin, key: string, defaultValue?: any): unknown;
	/** Returns the [Enum.JointCreationMode](https://developer.roblox.com/search#stq=JointCreationMode) the user has set in studio under the Model tab. */
	GetJoinMode(this: Plugin): Enum.JointCreationMode;
	/** Returns a mouse that can be used with the plugin. */
	GetMouse(this: Plugin): PluginMouse;
	/** GetSelectedRibbonTool return the currently selected [Enum.RibbonTool](https://developer.roblox.com/search#stq=RibbonTool). It returns an Enum that corresponds to a particular tool. This will return whether the tool is selected manually or programmatically via [Plugin.SelectRibbonTool](https://developer.roblox.com/api-reference/function/Plugin/SelectRibbonTool). */
	GetSelectedRibbonTool(this: Plugin): Enum.RibbonTool;
	/** Retrieves a previously stored value with the given key, or nil if the given key doesn't exist. */
	GetSetting(this: Plugin, key: string): unknown;
	Invoke(this: Plugin, key: string, arguments: Array<any>): void;
	/** Returns true if this plugin is currently active, after having been activated via the [Plugin.Activate](https://developer.roblox.com/api-reference/function/Plugin/Activate) function. */
	IsActivated(this: Plugin): boolean;
	/** Returns true if this plugin is currently active with an exclusive mouse, after having been activated via the [Plugin.Activate](https://developer.roblox.com/api-reference/function/Plugin/Activate) function.If this returns true, a `PluginMouse` can be retrieved via [Plugin.GetMouse](https://developer.roblox.com/api-reference/function/Plugin/GetMouse). */
	IsActivatedWithExclusiveMouse(this: Plugin): boolean;
	/** Negates the given parts and returns the resulting NegateOperations. */
	Negate(this: Plugin, objects: Array<Instance>): Array<Instance>;
	OnInvoke(this: Plugin, key: string, callback: Function): Instance | undefined;
	OnSetItem(this: Plugin, key: string, callback: Function): Instance | undefined;
	/** Used to open the given script instance in an editor window, in Roblox studio, at the given line. If no line is given as an argument it will default to 0. */
	OpenScript(this: Plugin, script: LuaSourceContainer, lineNumber?: number): void;
	/** Opens the context help window to the wiki page that `url` links to. */
	OpenWikiPage(this: Plugin, url: string): void;
	PauseSound(this: Plugin, soundChannel: Sound): void;
	PlaySound(this: Plugin, soundChannel: Sound): void;
	ResumeSound(this: Plugin, soundChannel: Sound): void;
	/** Opens an upload window for the user's current selection. */
	SaveSelectedToRoblox(this: Plugin): void;
	/** Activates the specified Roblox Studio tool.
	 * 
	 * If the tool opens a window, the position parameter specifies where it should be shown on the screen.
	 * 
	 * ## Notes
	 * 
	 * * An object must be selected in order for this to work correctly.
	 * 
	 * * Altering the scale fields of the _position_ property will not affect the dialog popups.
	 */
	SelectRibbonTool(this: Plugin, tool: CastsToEnum<Enum.RibbonTool>, position: UDim2): void;
	/** Separates the given UnionOperations and returns the resulting parts. */
	Separate(this: Plugin, objects: Array<Instance>): Array<Instance>;
	SetItem(this: Plugin, key: string, value?: any): void;
	/** Stores a given value for later use under the given key. The value will persist even after studio is closed. */
	SetSetting(this: Plugin, key: string, value?: any): void;
	StartDecalDrag(this: Plugin, decal: Decal): void;
	StartDrag(this: Plugin, dragData: object): void;
	StopAllSounds(this: Plugin): void;
	/** Unions the given parts and returns the resulting UnionOperation. */
	Union(this: Plugin, objects: Array<BasePart>): UnionOperation;
	/** This function creates a `DockWidgetPluginGui` using the provided [DataType.DockWidgetPluginGuiInfo](https://developer.roblox.com/search#stq=DockWidgetPluginGuiInfo).
	 * 
	 * See the [Building Studio Widgets](https://developer.roblox.com/search#stq=building%20studio%20widgets) tutorial for details on working with custom Studio widgets.
	 * @param pluginGuiId Consistent identifier used for storing/preserving the widget dock state and other internal details.
	 * @param dockWidgetPluginGuiInfo Datatype describing details for the new `DockWidgetPluginGui`.
	 */
	CreateDockWidgetPluginGui(
		this: Plugin,
		pluginGuiId: string,
		dockWidgetPluginGuiInfo: DockWidgetPluginGuiInfo,
	): DockWidgetPluginGui;
	CreateQWidgetPluginGui(this: Plugin, pluginGuiId: string, pluginGuiOptions: object): Instance | undefined;
	/** This function prompts the user to open a .fbx animation file that can be loaded onto the _rigModel_, then proceeds to insert the animation as a `KeyframeSequence` in the `Workspace`. */
	ImportFbxAnimation(this: Plugin, rigModel: Model, isR15?: boolean): Instance | undefined;
	/** Prompts the user to open a .fbx file, uploads the individual components of the model as meshes, and generates a character rig for use in animation, which is loaded into the `Workspace`. */
	ImportFbxRig(this: Plugin, isR15?: boolean): Model;
	/** Opens a window in Roblox Studio, which prompts the user to select an asset based on the _assetType_ specified. Returns what assetId was selected, or -1 if the window was closed. */
	PromptForExistingAssetId(this: Plugin, assetType: string): number;
	/** Prompts the user to save their current selection with the specified file name. Returns true if the user did save the file. */
	PromptSaveSelection(this: Plugin, suggestedFileName?: string): boolean;
	/** Fired when the plugin is deactivated. This occurs when either the plugin code calls [Plugin.Deactivate](https://developer.roblox.com/api-reference/function/Plugin/Deactivate), or because some other plugin called [Plugin.Activate](https://developer.roblox.com/api-reference/function/Plugin/Activate), which forces all other plugins to lose their active state. */
	readonly Deactivation: RBXScriptSignal<() => void>;
	readonly Unloading: RBXScriptSignal<() => void>;
}

/** PluginAction is an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`. In Roblox Studio, they can be assigned a keyboard shortcut under `File → Advanced → Customize Shortcuts...`, and they can also be added to the Quick Access Toolbar.
 * 
 * PluginActions must be created using the [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction) function in order to work as expected.
 */
interface PluginAction extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PluginAction";
	/** A string that uniquely identifies this action. This string is the key used when saving and loading the action's state in Roblox Studio.
	 * 	
	 * A string that uniquely identifies this action. This string is the key used when saving and loading the action's state in Roblox Studio.
	 * 
	 * Tags: ReadOnly, NotReplicated
	A string that uniquely identifies this action. This string is the key used when saving and loading the action's state in Roblox Studio.
	 * 	
	 * A string that uniquely identifies this action. This string is the key used when saving and loading the action's state in Roblox Studio.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly ActionId: string;
	/** This property determines whether the `PluginAction` will be hidden from Studio's shortcuts view. Useful for contextual actions. It defaults to true.
	 * 
	 * ## See also
	 * 
	 *   - [Plugin.CreationPluginAction](https://developer.roblox.com/search#stq=CreationPluginAction), creates a PluginAction
	 * 	
	 * This property determines whether the `PluginAction` will be hidden from Studio's shortcuts view. Useful for contextual actions. It defaults to true.
	 * 
	 * ## See also
	 * 
	 *   - [Plugin.CreationPluginAction](https://developer.roblox.com/search#stq=CreationPluginAction), creates a PluginAction
	 * 
	 * Tags: ReadOnly, NotReplicated
	This property determines whether the `PluginAction` will be hidden from Studio's shortcuts view. Useful for contextual actions. It defaults to true.
	 * 
	 * ## See also
	 * 
	 *   - [Plugin.CreationPluginAction](https://developer.roblox.com/search#stq=CreationPluginAction), creates a PluginAction
	 * 	
	 * This property determines whether the `PluginAction` will be hidden from Studio's shortcuts view. Useful for contextual actions. It defaults to true.
	 * 
	 * ## See also
	 * 
	 *   - [Plugin.CreationPluginAction](https://developer.roblox.com/search#stq=CreationPluginAction), creates a PluginAction
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly AllowBinding: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: NotReplicated
	 */
	readonly Checked: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: NotReplicated
	 */
	readonly DefaultShortcut: string;
	/** [NO DOCUMENTATION] *
	 * Tags: NotReplicated
	 */
	readonly Enabled: boolean;
	/** The description of the action, when viewing it from the keyboard shortcuts window in Roblox Studio.
	 * 	
	 * The description of the action, when viewing it from the keyboard shortcuts window in Roblox Studio.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The description of the action, when viewing it from the keyboard shortcuts window in Roblox Studio.
	 * 	
	 * The description of the action, when viewing it from the keyboard shortcuts window in Roblox Studio.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly StatusTip: string;
	/** The text that is displayed when viewing this action in Roblox Studio.
	 * 	
	 * The text that is displayed when viewing this action in Roblox Studio.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The text that is displayed when viewing this action in Roblox Studio.
	 * 	
	 * The text that is displayed when viewing this action in Roblox Studio.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly Text: string;
	/** Fires when the action is triggered. This can be done by either activating the action from the Quick Access Toolbar, or by using the keyboard shortcut that was bound to it. */
	readonly Triggered: RBXScriptSignal<() => void>;
}

interface PluginDebugService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PluginDebugService";
}

interface PluginDragEvent extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PluginDragEvent";
	/** 
	 * Tags: ReadOnly, NotReplicated
	
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly Data: string;
	/** 
	 * Tags: ReadOnly, NotReplicated
	
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly MimeType: string;
	/** 
	 * Tags: ReadOnly, NotReplicated
	
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly Position: Vector2;
	/** 
	 * Tags: ReadOnly, NotReplicated
	
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly Sender: string;
}

/** PluginGuiService is a service that stores `PluginGui` objects to be displayed in Roblox Studio. It only allows PluginGuis to be direct children of the service, and PluginGuis are not allowed to be parented anywhere besides the service. */
interface PluginGuiService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PluginGuiService";
}

interface PluginManagerInterface extends Instance {
	/** [NO DOCUMENTATION] */
	ExportPlace(this: PluginManagerInterface, filePath?: string): void;
	/** [NO DOCUMENTATION] */
	ExportSelection(this: PluginManagerInterface, filePath?: string): void;
}

/** A context menu that can be shown in Studio. It displays a list of PluginActions and supports submenus.
 * 
 * PluginMenus must be created using the [Plugin.CreatePluginMenu](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginMenu) function in order to work as expected.
 * 
 * ## See also
 * 
 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
 * 
 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
 * 
 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
 * 
 *   - [PluginMenu.Title](https://developer.roblox.com/api-reference/property/PluginMenu/Title), the text to be displayed when used as a sub menu
 * 
 *   - [PluginMenu.Icon](https://developer.roblox.com/api-reference/property/PluginMenu/Icon), the icon to be displayed when used as a sub menu
 * 
 *   - [PluginMenu.AddAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddAction), adds the given action to the menu
 * 
 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
 * 
 *   - [PluginMenu.AddMenu](https://developer.roblox.com/api-reference/function/PluginMenu/AddMenu), adds the given menu as a separator
 * 
 *   - [PluginMenu.AddSeparator](https://developer.roblox.com/api-reference/function/PluginMenu/AddSeparator), adds a separator between items in the menu
 * 
 *   - [PluginMenu.Clear](https://developer.roblox.com/api-reference/function/PluginMenu/Clear), clears the menu
 * 
 *   - [PluginMenu.ShowAsync](https://developer.roblox.com/api-reference/function/PluginMenu/ShowAsync), shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. The selected action fires its Triggered event
 */
interface PluginMenu extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PluginMenu";
	/** This property determines the icon to be displayed when used as a sub menu. It defaults to an empty string `””`.
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
	 * 
	 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
	 * 
	 *   - [PluginMenu.Title](https://developer.roblox.com/api-reference/property/PluginMenu/Title), the text to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.AddAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddAction), adds the given action to the menu
	 * 
	 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
	 * 
	 *   - [PluginMenu.AddMenu](https://developer.roblox.com/api-reference/function/PluginMenu/AddMenu), adds the given menu as a separator
	 * 
	 *   - [PluginMenu.AddSeparator](https://developer.roblox.com/api-reference/function/PluginMenu/AddSeparator), adds a separator between items in the menu
	 * 
	 *   - [PluginMenu.Clear](https://developer.roblox.com/api-reference/function/PluginMenu/Clear), clears the menu
	 * 
	 *   - [PluginMenu.ShowAsync](https://developer.roblox.com/api-reference/function/PluginMenu/ShowAsync), shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. The selected action fires its Triggered event
	 */
	Icon: string;
	/** This property determines the text to be displayed when a `PluginMenu` is used as a sub menu. It defaults to an empty string `””`.
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
	 * 
	 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
	 * 
	 *   - [PluginMenu.Icon](https://developer.roblox.com/api-reference/property/PluginMenu/Icon), the icon to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.AddAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddAction), adds the given action to the menu
	 * 
	 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
	 * 
	 *   - [PluginMenu.AddMenu](https://developer.roblox.com/api-reference/function/PluginMenu/AddMenu), adds the given menu as a separator
	 * 
	 *   - [PluginMenu.AddSeparator](https://developer.roblox.com/api-reference/function/PluginMenu/AddSeparator), adds a separator between items in the menu
	 * 
	 *   - [PluginMenu.Clear](https://developer.roblox.com/api-reference/function/PluginMenu/Clear), clears the menu
	 * 
	 *   - [PluginMenu.ShowAsync](https://developer.roblox.com/api-reference/function/PluginMenu/ShowAsync), shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. The selected action fires its Triggered event
	 */
	Title: string;
	/** This function adds the given action to the menu.
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
	 * 
	 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
	 * 
	 *   - [PluginMenu.Title](https://developer.roblox.com/api-reference/property/PluginMenu/Title), the text to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.Icon](https://developer.roblox.com/api-reference/property/PluginMenu/Icon), the icon to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
	 * 
	 *   - [PluginMenu.AddMenu](https://developer.roblox.com/api-reference/function/PluginMenu/AddMenu), adds the given menu as a separator
	 * 
	 *   - [PluginMenu.AddSeparator](https://developer.roblox.com/api-reference/function/PluginMenu/AddSeparator), adds a separator between items in the menu
	 * 
	 *   - [PluginMenu.Clear](https://developer.roblox.com/api-reference/function/PluginMenu/Clear), clears the menu
	 * 
	 *   - [PluginMenu.ShowAsync](https://developer.roblox.com/api-reference/function/PluginMenu/ShowAsync), shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. The selected action fires its Triggered event
	 * @param action The action to add
	 * @returns void
	 */
	AddAction(this: PluginMenu, action: PluginAction): void;
	/** This function adds the given menu as a separator.
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
	 * 
	 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
	 * 
	 *   - [PluginMenu.Title](https://developer.roblox.com/api-reference/property/PluginMenu/Title), the text to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.Icon](https://developer.roblox.com/api-reference/property/PluginMenu/Icon), the icon to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.AddAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddAction), adds the given action to the menu
	 * 
	 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
	 * 
	 *   - [PluginMenu.AddSeparator](https://developer.roblox.com/api-reference/function/PluginMenu/AddSeparator), adds a separator between items in the menu
	 * 
	 *   - [PluginMenu.Clear](https://developer.roblox.com/api-reference/function/PluginMenu/Clear), clears the menu
	 * 
	 *   - [PluginMenu.ShowAsync](https://developer.roblox.com/api-reference/function/PluginMenu/ShowAsync), shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. The selected action fires its Triggered event
	 * @param menu The menu to add as a sub menu. Uses its `PluginMenu/Title` and `PluginMenu/Icon` to display
	 * @returns void
	 */
	AddMenu(this: PluginMenu, menu: PluginMenu): void;
	/** 	 
	 * @param actionId Must be a unique string that identifies this PluginAction from others
	 * @param text The text to be displayed
	 * @param icon The icon to be displayed
	 * @returns The created `PluginAction`
	 */
	AddNewAction(this: PluginMenu, actionId: string, text: string, icon?: string): PluginAction;
	/** This function adds a separator between items in the menu.
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
	 * 
	 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
	 * 
	 *   - [PluginMenu.Title](https://developer.roblox.com/api-reference/property/PluginMenu/Title), the text to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.Icon](https://developer.roblox.com/api-reference/property/PluginMenu/Icon), the icon to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.AddAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddAction), adds the given action to the menu
	 * 
	 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
	 * 
	 *   - [PluginMenu.AddMenu](https://developer.roblox.com/api-reference/function/PluginMenu/AddMenu), adds the given menu as a separator
	 * 
	 *   - [PluginMenu.Clear](https://developer.roblox.com/api-reference/function/PluginMenu/Clear), clears the menu
	 * 
	 *   - [PluginMenu.ShowAsync](https://developer.roblox.com/api-reference/function/PluginMenu/ShowAsync), shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. The selected action fires its Triggered event
	 * @returns void
	 */
	AddSeparator(this: PluginMenu): void;
	/** This function clears the menu
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
	 * 
	 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
	 * 
	 *   - [PluginMenu.Title](https://developer.roblox.com/api-reference/property/PluginMenu/Title), the text to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.Icon](https://developer.roblox.com/api-reference/property/PluginMenu/Icon), the icon to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.AddAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddAction), adds the given action to the menu
	 * 
	 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
	 * 
	 *   - [PluginMenu.AddMenu](https://developer.roblox.com/api-reference/function/PluginMenu/AddMenu), adds the given menu as a separator
	 * 
	 *   - [PluginMenu.AddSeparator](https://developer.roblox.com/api-reference/function/PluginMenu/AddSeparator), adds a separator between items in the menu
	 * 
	 *   - [PluginMenu.ShowAsync](https://developer.roblox.com/api-reference/function/PluginMenu/ShowAsync), shows the menu at the mouse cursor. Yields until either an item is selected or the menu is closed. The selected action fires its Triggered event
	 */
	Clear(this: PluginMenu): void;
	/** This function shows the menu at the mouse cursor. It yields until either an item is selected or the menu is closed. The selected action fires its [PluginAction.Triggered](https://developer.roblox.com/api-reference/event/PluginAction/Triggered) event
	 * 
	 * ## See also
	 * 
	 *   - [articles.Intro to Plugins](https://developer.roblox.com/search#stq=Intro%20to%20Plugins), an introductory article to plugin use and development
	 * 
	 *   - `PluginAction`, an object that represents a generic performable action in Roblox Studio, with no directly associated `Toolbar` or `Button`.
	 * 
	 *   - [Plugin.CreatePluginAction](https://developer.roblox.com/api-reference/function/Plugin/CreatePluginAction), creates a PluginAction
	 * 
	 *   - [PluginMenu.Title](https://developer.roblox.com/api-reference/property/PluginMenu/Title), the text to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.Icon](https://developer.roblox.com/api-reference/property/PluginMenu/Icon), the icon to be displayed when used as a sub menu
	 * 
	 *   - [PluginMenu.AddAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddAction), adds the given action to the menu
	 * 
	 *   - [PluginMenu.AddNewAction](https://developer.roblox.com/api-reference/function/PluginMenu/AddNewAction), creates a temporary action that is hidden from Studio's customize shortcuts window
	 * 
	 *   - [PluginMenu.AddMenu](https://developer.roblox.com/api-reference/function/PluginMenu/AddMenu), adds the given menu as a separator
	 * 
	 *   - [PluginMenu.AddSeparator](https://developer.roblox.com/api-reference/function/PluginMenu/AddSeparator), adds a separator between items in the menu
	 * 
	 *   - [PluginMenu.Clear](https://developer.roblox.com/api-reference/function/PluginMenu/Clear), clears the menu
	 * @returns The `PluginAction` item that was selected or nil
	 */
	ShowAsync(this: PluginMenu): Instance | undefined;
}

/** A PluginToolbar is an object created by using the [Plugin.CreateToolbar](https://developer.roblox.com/api-reference/function/Plugin/CreateToolbar) method. It is used to create `PluginToolbarButton`s using the [CreateButton](https://developer.roblox.com/api-reference/function/PluginToolbar/CreateButton) function. In general, it is good practice for a plugin to use **one and only one** uniquely named toolbar for all of its buttons. In Roblox Studio, toolbars are rendered under the Plugins tab.
 * 
 * ![A screenshot of Roblox Studio's Plugins tab, rendering several PluginToolbars][1]
 * 
 * Pictured above are three PluginToolbars in Roblox Studio: Animations, Three Wise Monkeys and Localization. The center toolbar is a custom toolbar created by a plugin; the other toolbars are created by built-in Roblox Studio plugins.
 * 
 * ## Example
 * 
 * The following code sample creates a basic toolbar with one button. It should be run as a Roblox Studio plugin, and not run as a `Script`.
 * 
 * ```lua
 * local toolbar = plugin:CreateToolbar("Three Wise Monkeys")
 * local button = toolbar:CreateButton("Mizaru", "See No Evil", "rbxassetid://2778270261")
 * ```
 * 
 * [1]: https://developer.roblox.com/assets/5c48e228da4c5b970f6efb58/PluginToolbar-light.png
 */
interface PluginToolbar extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PluginToolbar";
	CreateButton(
		this: PluginToolbar,
		buttonId: string,
		tooltip: string,
		iconname: string,
		text?: string,
	): PluginToolbarButton;
}

/** A PluginToolbarButton is an object created by the [PluginToolbar.CreateButton](https://developer.roblox.com/api-reference/function/PluginToolbar/CreateButton) function. It allows the user to initiate a single, one-off action in Roblox Studio through the [Click](https://developer.roblox.com/api-reference/event/PluginToolbarButton/Click) event. Pictured below are three PluginToolbarButtons. From left to right: the default, hover and pressed states. The hovered button in the center shows tooltip text, which is the 2nd argument passed to [PluginToolbar.CreateButton](https://developer.roblox.com/api-reference/function/PluginToolbar/CreateButton).
 * 
 * ![Three PluginToolbarButtons rendered on a PluginToolbar titled "Three Wise Monkeys"][1]
 * 
 * ## Behavior
 * 
 * When pressed, the [Click](https://developer.roblox.com/api-reference/event/PluginToolbarButton/Click) event fires. A button will also remain in the pressed state, which may be set manually using [SetActive](https://developer.roblox.com/api-reference/function/PluginToolbarButton/SetActive). Upon plugin activation ([Plugin.Activate](https://developer.roblox.com/api-reference/function/Plugin/Activate)), buttons in all other `PluginToolbar`s will be toggled off. If all buttons in a toolbar are off, the toolbar's plugin is deactivated ([Plugin.Deactivate](https://developer.roblox.com/api-reference/function/Plugin/Deactivate)).
 * 
 * When the game viewport is not visible, buttons will be disabled as if their [Enabled](https://developer.roblox.com/api-reference/property/PluginToolbarButton/Enabled) property were false. Disabled buttons are desaturated and do not respond to user clicks. By setting [ClickableWhenViewportHidden](https://developer.roblox.com/api-reference/property/PluginToolbarButton/ClickableWhenViewportHidden) to true, you can allow plugin buttons to remain clickable (such as during script editing).
 * 
 * ## History
 * 
 * * Prior to an update released in January 2019, this class was simply known as "Button". This was changed to reduce confusion with similarly named in-game UI element classes, such as `TextButton`.
 * 
 * [1]: https://developer.roblox.com/assets/5c48e310f8a426690c84250e/PluginToolbarButton-light.png
 */
interface PluginToolbarButton extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "PluginToolbarButton";
	/** 
	 * Tags: NotReplicated
	
	 * Tags: NotReplicated
	 *
	 * Tags: NotReplicated
	 */
	ClickableWhenViewportHidden: boolean;
	/** 
	 * Tags: NotReplicated
	
	 * Tags: NotReplicated
	 *
	 * Tags: NotReplicated
	 */
	Enabled: boolean;
	/** 
	 * Tags: NotReplicated
	
	 * Tags: NotReplicated
	 *
	 * Tags: NotReplicated
	 */
	Icon: string;
	/** [NO DOCUMENTATION] */
	SetActive(this: PluginToolbarButton, active: boolean): void;
	/** [NO DOCUMENTATION] */
	readonly Click: RBXScriptSignal<() => void>;
}

/** The RenderSettings is a singleton class, which lets developers debug components of Roblox's graphics engine.
 * 
 * It can be found under the _Rendering_ tab in Roblox Studio's settings menu.
 */
interface RenderSettings extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "RenderSettings";
	/** Sets the starting quality level of the framerate manager, when [RenderSettings.EnableFRM](https://developer.roblox.com/api-reference/property/RenderSettings/EnableFRM) is set to true. */
	AutoFRMLevel: number;
	/** When set to true, all scene updates will be given an unlimited budget, regardless of how computationally expensive it may be.
	 * 
	 * This ensures each frame will look as it should, at the cost of a more unstable frame rate.When set to true, all scene updates will be given an unlimited budget, regardless of how computationally expensive it may be.
	 * 
	 * ## Notes
	 * 
	 * * This is used when rendering game thumbnails.
	 */
	EagerBulkExecution: boolean;
	/** Sets the graphics quality level in Roblox Studio, when [RenderSettings.EnableFRM](https://developer.roblox.com/api-reference/property/RenderSettings/EnableFRM) is set to false. */
	EditQualityLevel: Enum.QualityLevel;
	/** Toggles the enabled state of the framerate manager.
	 * 	
	 * Toggles the enabled state of the framerate manager.
	 * 
	 * Tags: Hidden, NotReplicated
	Toggles the enabled state of the framerate manager.
	 * 	
	 * Toggles the enabled state of the framerate manager.
	 * 
	 * Tags: Hidden, NotReplicated
	 *
	 * Tags: Hidden, NotReplicated
	 */
	EnableFRM: boolean;
	/** Sets whether materials should be generated per part, or per unique appearance in Roblox's obj exporter. */
	ExportMergeByMaterial: boolean;
	/** Specifies the behavior of the framerate manager. */
	FrameRateManager: Enum.FramerateManagerMode;
	/** The graphics API that Roblox will use on startup. */
	GraphicsMode: Enum.GraphicsMode;
	/** The size in bytes of the mesh cache.
	 * 
	 * Defaults to 32 MBs.
	 */
	MeshCacheSize: number;
	/** [NO DOCUMENTATION] */
	MeshPartDetailLevel: Enum.MeshPartDetailLevel;
	/** If [RenderSettings.EnableFRM](https://developer.roblox.com/api-reference/property/RenderSettings/EnableFRM) is set to true, this property controls the quality level in Roblox Studio. */
	QualityLevel: Enum.QualityLevel;
	/** When set to true, Roblox Studio will automatically reload changes that are made to files in Roblox's `content` folder. */
	ReloadAssets: boolean;
	/** When set to true, a wireframe of polygons will be shown on all `PartOperation` objects. */
	RenderCSGTrianglesDebug: boolean;
	/** If set to true, renders bounding boxes around each individual rendered entity in the scene. */
	ShowBoundingBoxes: boolean;
	/** Returns the maximum quality level. */
	GetMaxQualityLevel(this: RenderSettings): number;
}

/** RenderingTest is an internal testing utility used by Roblox engineers to do performance/regression tests on the rendering pipeline. It is expected to be parented inside of the `TestService`, and will run LocalScripts parented inside of it when the TestService is ran via [TestService.Run](https://developer.roblox.com/api-reference/function/TestService/Run).
 * 
 * ![Selected RenderingTest][1]
 * 
 * One of its more notable features is that, upon being selected in the Explorer, it draws an accurate wireframe of the Camera frustum, visualizing what a Camera would see in the RenderingTest's configuration.
 * 
 * ## Recording Test Results
 * 
 * When a RenderingTest is executed by the TestService, the [CurrentCamera](https://developer.roblox.com/api-reference/property/Workspace/CurrentCamera) of the `Workspace` has its properties updated so it mirrors the Camera configuration of the RenderingTest.
 * 
 * The recorded data is then sent as JSON with an HTTP-POST request to: `localhost:8001/api/v1/submit_test`.
 * 
 * For the RenderingTest to pass in Roblox Studio, the request expects the response to be the string `"passed"`. It will also acknowledge the strings `"failed"` or `"golden"` as a string response.
 * 
 * [1]: https://developer.roblox.com/assets/5b404eddcbdac88b0b7f2e4e/RenderingTest.png
 */
interface RenderingTest extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "RenderingTest";
	/** The CFrame that the `Camera` will use when this RenderingTest is executed.
	 * 
	 * The value of this property is reflected into [RenderingTest.Position](https://developer.roblox.com/api-reference/property/RenderingTest/Position) and [RenderingTest.Orientation](https://developer.roblox.com/api-reference/property/RenderingTest/Orientation).
	 */
	CFrame: CFrame;
	/** The maximum difference that this RenderingTest can have between the image it captures and the original image.
	 * 
	 * This property is only used if the RenderingTest's ComparisonMethod is set to **diff**.
	 */
	ComparisonDiffThreshold: number;
	/** The comparison method that is expected to be used when this RenderingTest's image capture is compared to its original image. */
	ComparisonMethod: Enum.RenderingTestComparisonMethod;
	/** The maximum peak signal-to-noise ratio that this RenderingTest can have between the image it captures and the original image.
	 * 
	 * This property is only used if the RenderingTest's ComparisonMethod is set to **psnr**.
	 */
	ComparisonPsnrThreshold: number;
	/** A description to describe this RenderingTest. */
	Description: string;
	/** The FieldOfView that will be used by the `Camera` when running this RenderingTest.
	 * 
	 * Should fall between 1 and 120 in order to work as expected.
	 */
	FieldOfView: number;
	/** The derived orientation of the RenderingTest’s CFrame.
	 * 	
	 * The derived orientation of the RenderingTest’s CFrame.
	 * 
	 * Tags: NotReplicated
	The derived orientation of the RenderingTest’s CFrame.
	 * 	
	 * The derived orientation of the RenderingTest’s CFrame.
	 * 
	 * Tags: NotReplicated
	 *
	 * Tags: NotReplicated
	 */
	Orientation: Vector3;
	/** The derived position of the RenderingTest's CFrame.
	 * 	
	 * The derived position of the RenderingTest's CFrame.
	 * 
	 * Tags: NotReplicated
	The derived position of the RenderingTest's CFrame.
	 * 	
	 * The derived position of the RenderingTest's CFrame.
	 * 
	 * Tags: NotReplicated
	 *
	 * Tags: NotReplicated
	 */
	Position: Vector3;
	/** The graphics quality that will be used by the rendering pipeline when running this RenderingTest.
	 * 
	 * Should fall between 1 and 21 in order to work as expected.
	 */
	QualityLevel: number;
	/** Indicates whether or not this RenderingTest should be skipped. */
	ShouldSkip: boolean;
	/** A label of the internal JIRA ticket this RenderingTest is associated with. */
	Ticket: string;
	/** [NO DOCUMENTATION] */
	RenderdocTriggerCapture(this: RenderingTest): void;
}

interface RobloxPluginGuiService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "RobloxPluginGuiService";
}

interface RunService extends Instance {
	IsEdit(this: RunService): boolean;
	/** Pauses the physics and scripts in a place. */
	Pause(this: RunService): void;
	/** Creates a waypoint and then runs the game just like the Play button does in studio. */
	Run(this: RunService): void;
	/** Stops the running simulation. */
	Stop(this: RunService): void;
}

/** This service controls all `BaseScript` objects. Most of the properties and methods of this service are locked for internal use, however you may use the [ScriptContext.ScriptsDisabled](https://developer.roblox.com/api-reference/property/ScriptContext/ScriptsDisabled) property to disable all scripts from a thread with normal security access. */
interface ScriptContext extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "ScriptContext";
	/** [NO DOCUMENTATION] *
	 * Tags: NotReplicated
	 */
	readonly ScriptsDisabled: boolean;
	/** [NO DOCUMENTATION] */
	AddCoreScriptLocal(this: ScriptContext, name: string, parent: Instance): void;
	/** [NO DOCUMENTATION] */
	GetCoverageStats(this: ScriptContext): unknown;
	/** Limits how long a script is allowed to run without yielding. */
	SetTimeout(this: ScriptContext, seconds: number): void;
	/** Fired when an error occurs. */
	readonly Error: RBXScriptSignal<(message: string, stackTrace: string, script: LuaSourceContainer) => void>;
	/** [NO DOCUMENTATION] */
	readonly ErrorDetailed: RBXScriptSignal<(message: string, stackTrace: string, script: LuaSourceContainer, details: string, securityLevel: number) => void>;
}

/** A ScriptDebugger is used to handle the debugging of a specific script. It can be retrieved from the `DebuggerManager`. */
interface ScriptDebugger extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "ScriptDebugger";
	/** The current line that the script is on. */
	readonly CurrentLine: number;
	/** Describes if this ScriptDebugger is actually debugging the script attached to it. */
	readonly IsDebugging: boolean;
	/** Describes if this ScriptDebugger is paused. */
	readonly IsPaused: boolean;
	/** The script object this debugger is linked to. */
	readonly Script: Instance | undefined;
	/** Adds a watch with the given expression. */
	AddWatch(this: ScriptDebugger, expression: string): Instance | undefined;
	/** Returns a list of `DebuggerBreakpoint` present in the script. */
	GetBreakpoints(this: ScriptDebugger): Array<Instance>;
	/** Returns a dictionary of all variables that are visible to the script's global stack, where the keys are the names of the variables, and the values are the actual values of the variables. */
	GetGlobals(this: ScriptDebugger): Map<string, any>;
	/** Returns a dictionary of all local variables in the specified stack, where the keys are the names of the variables, and the values are the actual values of the variables. */
	GetLocals(this: ScriptDebugger, stackFrame?: number): Map<string, any>;
	/** Returns an array of all active call stacks in the script. */
	GetStack(this: ScriptDebugger): unknown;
	/** Returns a dictionary of all upvalues present in the stack specified. */
	GetUpvalues(this: ScriptDebugger, stackFrame?: number): Map<string, any>;
	/** Returns the current value of a variable being watched by a `DebuggerWatch`. */
	GetWatchValue(this: ScriptDebugger, watch: Instance): unknown;
	/** Returns a list with all the watches for this debugger */
	GetWatches(this: ScriptDebugger): Array<Instance>;
	/** Sets the specified line of the script as a breakpoint. Returns a `DebuggerBreakpoint` that you can use to manage the breakpoint. */
	SetBreakpoint(this: ScriptDebugger, line: number, isContextDependentBreakpoint: boolean): Instance | undefined;
	/** Sets the value of the variable _name_ as _value_ in the script's main stack. */
	SetGlobal(this: ScriptDebugger, name: string, value?: any): void;
	/** Sets the value of the variable _name_ as _value_ in the stack specified. */
	SetLocal(this: ScriptDebugger, name: string, value?: any, stackFrame?: number): void;
	/** Sets the value of the upvalue _name_ as _value_ in the stack specified. */
	SetUpvalue(this: ScriptDebugger, name: string, value?: any, stackFrame?: number): void;
	/** Fired when a breakpoint is added to the script. */
	readonly BreakpointAdded: RBXScriptSignal<(breakpoint: Instance) => void>;
	/** Fired when a breakpoint is removed from the script. */
	readonly BreakpointRemoved: RBXScriptSignal<(breakpoint: Instance) => void>;
	/** Fired when a breakpoint is encountered by the script. */
	readonly EncounteredBreak: RBXScriptSignal<(line: number, breakReason: Enum.BreakReason) => void>;
	/** Fired when the game is resumed after being paused by a breakpoint. */
	readonly Resuming: RBXScriptSignal<() => void>;
	/** Fired when an expression watch is added to this script debugger. */
	readonly WatchAdded: RBXScriptSignal<(watch: Instance) => void>;
	/** Fired when an expression watch is removed from this script debugger. */
	readonly WatchRemoved: RBXScriptSignal<(watch: Instance) => void>;
}

/** The Selection service controls the `Instance`s that are selected in Roblox Studio.
 * 
 * This service is particularly useful when developing `Plugin`s, as it allows the developer to access and manipulate the current selection.
 * 
 * Currently selected `Instance`s can be obtained and set using the [Selection.Get](https://developer.roblox.com/api-reference/function/Selection/Get) and [Selection.Set](https://developer.roblox.com/api-reference/function/Selection/Set) functions. The [Selection.SelectionChanged](https://developer.roblox.com/api-reference/event/Selection/SelectionChanged) event fires whenever the current selection changes.
 * 
 * For more information on using Selection and `Plugin`s please see [this tutorial](https://developer.roblox.com/search#stq=Intro%20to%20Plugins).
 * 
 * Selection is also often used in the command bar, to set hidden properties or run functions for selected `Instance`s. For example:
 * 
 * ```lua
 * game.Selection:Get()[1]:SetPrimaryPartCFrame(CFrame.new()) -- move the selected model to the origin
 * ```
 * 
 * Note this class only applies to Roblox Studio and has no applicability to games.
 * 
 * [1]: https://developer.roblox.com/articles/Intro-to-Plugins
 */
interface Selection extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "Selection";
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly ActiveInstance: Instance | undefined;
	/** Returns an array of currently selected `Instance`s in Roblox Studio.
	 * 
	 * If no `Instance`s are selected, the array returned be empty. This function can be used in conjunction with the [Selection.SelectionChanged](https://developer.roblox.com/api-reference/event/Selection/SelectionChanged) event to get the selection whenever it changes.
	 * 
	 * Note, this function can only be used in `Plugin`s or the command line.
	 * 
	 * For changing the current selection, please see [Selection.Set](https://developer.roblox.com/api-reference/function/Selection/Set).
	 * @returns An array of currently selected `Instance`s.
	 */
	Get(this: Selection): Array<Instance>;
	/** Sets the currently selected objects in Roblox Studio to `Instance`s in the given array.
	 * 
	 * Calling this function will cause the [Selection.SelectionChanged](https://developer.roblox.com/api-reference/event/Selection/SelectionChanged) event to fire, unless the new selection set is identical to the previous selection.
	 * 
	 * Note this function overwrites the existing selection. However, using [Selection.Get](https://developer.roblox.com/api-reference/function/Selection/Get) an `Instance` can be added to the existing selection like so:
	 * 
	 * ```lua
	 * local selected = Selection:Get()
	 * table.insert(selected, object)
	 * Selection:Set(selected)
	 * ```
	 * 
	 * @param selection An array of `Instance`s to set the current selection to.
	 */
	Set(this: Selection, selection: Array<Instance>): void;
	/** Fires when the `Instance`s selected in Roblox Studio changes.
	 * 
	 * Note this event does not give the new selection. Developers will need to use `Selection`'s [Selection.Get](https://developer.roblox.com/api-reference/function/Selection/Get) function to obtain the current selection.
	 * 
	 * Although this event can be used outside of plugins and the command bar, it only applies to the selection in Roblox Studio and therefore has no functionality outside of Studio.
	 * 
	 * To change the selection use the [Selection.Set](https://developer.roblox.com/api-reference/function/Selection/Set) function.
	 */
	readonly SelectionChanged: RBXScriptSignal<() => void>;
}

interface DataModel extends ServiceProvider<Services> {
	/** Returns the job interval peak fraction of the specified task scheduler job. */
	GetJobIntervalPeakFraction(this: DataModel, jobname: string, greaterThan: number): number;
	/** Returns the job time peak fraction of the specified task scheduler job. */
	GetJobTimePeakFraction(this: DataModel, jobname: string, greaterThan: number): number;
	/** This function is currently broken
	 * 
	 * This function returns a table containing extended statistics on the jobs performed by the task scheduler.
	 * 
	 * In computing, a task scheduler is a system responsible for executing key tasks at the appropriate intervals.
	 * 
	 * This function is currently broken and does not return the correct values. You can find live task scheduler statistics in the Task Scheduler window in Roblox Studio.
	 * 
	 * The first entry in the table returned is a reference dictionary containing the statistics (or headings) available. It is in the following format:
	 * 
	 * ```lua
	 * {
	 * ```
	 * 
	 * lua
	 * 
	 * ["name"] = "name",
	 * 
	 * ["time.average"] = "time.average",
	 * 
	 * ["time.variance"] = "time.variance",
	 * 
	 * ["time.samples"] = "time.samples",
	 * 
	 * ["interval.average"] = "interval.average",
	 * 
	 * ["interval.variance"] = "interval.variance",
	 * 
	 * ["interval.samples"] = "interval.samples",
	 * 
	 * ["dutyfraction"] = "dutyfraction"
	 * 
	 * ```lua
	 * }
	 * ```
	 * 
	 * The subsequent entries in the table returned are dictionaries containing the above statistics for jobs performed by the task scheduler. For example:
	 * 
	 * ```lua
	 * {
	 * ```
	 * 
	 * lua
	 * 
	 * ["name"] = "Heartbeat",
	 * 
	 * ["time.average"] = 0,
	 * 
	 * ["time.variance"] = 0,
	 * 
	 * ["time.samples"] = 0,
	 * 
	 * ["interval.average"] = 0,
	 * 
	 * ["interval.variance"] = 0,
	 * 
	 * ["interval.samples"] = 0,
	 * 
	 * ["dutyfraction"] = 0
	 * 
	 * ```lua
	 * }
	 * ```
	 * 
	 * ## See also
	 * 
	 *  - `TaskScheduler`
	 * 
	 *  - [DataModel.GetJobsInfo](https://developer.roblox.com/api-reference/function/DataModel/GetJobsInfo)
	 * 
	 *  - [DataModel.GetJobIntervalPeakFraction](https://developer.roblox.com/api-reference/function/DataModel/GetJobIntervalPeakFraction)
	 * 
	 *  - [DataModel.GetJobTimePeakFraction](https://developer.roblox.com/api-reference/function/DataModel/GetJobTimePeakFraction)
	 * @returns A table containing statistics on the jobs performed by the task scheduler, see above for the format
	 */
	GetJobsExtendedStats(this: DataModel): unknown;
	/** Returns a table containing basic information about the jobs performed by the task scheduler
	 * 
	 * In computing, a task scheduler is a system responsible for executing key tasks at the appropriate intervals.
	 * 
	 * You can also find live task scheduler statistics in the Task Scheduler window in Roblox Studio.
	 * 
	 * The first entry in the table returned is a reference dictionary containing the statistics (or headings) available. It is in the following format:
	 * 
	 * ```lua
	 * {
	 * ```
	 * 
	 * lua
	 * 
	 * ["name"] = "name",
	 * 
	 * ["averageDutyCycle"] = "averageDutyCycle",
	 * 
	 * ["averageStepsPerSecond"] = "averageStepsPerSecond",
	 * 
	 * ["averageStepTime"] = "averageStepTime",
	 * 
	 * ["averageError"] = "averageError",
	 * 
	 * ["isRunning"] = "isRunning",
	 * 
	 * ```lua
	 * }
	 * ```
	 * 
	 * The subsequent entries in the table returned are dictionaries containing the above statistics for jobs performed by the task scheduler. For example:
	 * 
	 * ```lua
	 * {
	 * ```
	 * 
	 * lua
	 * 
	 * ["name"] = "Heartbeat",
	 * 
	 * ["averageDutyCycle"] = 0,
	 * 
	 * ["averageStepsPerSecond"] = 0,
	 * 
	 * ["averageStepTime"] = 0,
	 * 
	 * ["averageError"] = 0,
	 * 
	 * ["isRunning"] = false,
	 * 
	 * ```lua
	 * }
	 * ```
	 * 
	 * ## See also
	 * 
	 *  - `TaskScheduler`
	 * 
	 *  - [DataModel.GetJobsExtendedStats](https://developer.roblox.com/api-reference/function/DataModel/GetJobsExtendedStats)
	 * 
	 *  - [DataModel.GetJobIntervalPeakFraction](https://developer.roblox.com/api-reference/function/DataModel/GetJobIntervalPeakFraction)
	 * 
	 *  - [DataModel.GetJobTimePeakFraction](https://developer.roblox.com/api-reference/function/DataModel/GetJobTimePeakFraction)
	 * @returns A table containing information about the jobs performed by the task scheduler, see above for the format
	 */
	GetJobsInfo(this: DataModel): unknown;
	/** This function returns an array of [Instances](https://developer.roblox.com/api-reference/class/Instance) associated with the given [content](https://developer.roblox.com/search#stq=Content) URL.
	 * 
	 * This function can be used to insert content from the Roblox [library][1], such as:
	 * 
	 *  - Models
	 * 
	 *  - Decals
	 * 
	 *  - Meshes
	 * 
	 *  - Plugins
	 * 
	 *  - Animations
	 * 
	 * It is not possible to insert [Sounds](https://developer.roblox.com/api-reference/class/Sound) using this method as they do not have an `Instance` associated with them (rather just a [content](https://developer.roblox.com/search#stq=Content) URL).
	 * 
	 * Unlike [InsertService.LoadAsset](https://developer.roblox.com/api-reference/function/InsertService/LoadAsset), GetObjects does not require an asset to be ‘trusted’. This means that an asset does not need to be owned by the logged in user, or created by Roblox, to be inserted. However, if the asset is not owned by the logged in user it must be freely available.
	 * 
	 * Due to this function’s security context it can only be used by plugins or the command bar. For an alternative that can be used in [Scripts](https://developer.roblox.com/api-reference/class/Script) and [LocalScripts](https://developer.roblox.com/api-reference/class/LocalScript), see [InsertService.LoadAsset](https://developer.roblox.com/api-reference/function/InsertService/LoadAsset).
	 * 
	 * [1]: https://www.roblox.com/develop/library
	 * @param url The given `Articles/Content|content` URL
	 * @returns An array of `Instance|Instances` associated with the `Articles/Content|content` URL
	 */
	GetObjects(this: DataModel, url: string): Array<Instance>;
	/** This function sets the [DataModel.PlaceId](https://developer.roblox.com/api-reference/property/DataModel/PlaceId) of the game instance to the given *placeId*.
	 * 
	 * Setting the [DataModel.PlaceId](https://developer.roblox.com/api-reference/property/DataModel/PlaceId) is required to access the `DataStoreService` when the place is unpublished (for example a local .rbxl file). See below for an example. Note this will only work when the *‘Enable Studio Access to API Services`* option is enabled under game settings.
	 * 
	 * ```lua
	 * local DataStoreService = game:GetService("DataStoreService")
	 * 
	 * -- access DataStore 'Data' as place placeId
	 * game:SetPlaceId(placeId)
	 * local dataStore = DataStoreService:GetDataStore("Data")
	 * ```
	 * 
	 * You can use [DataModel.SetUniverseId](https://developer.roblox.com/api-reference/function/DataModel/SetUniverseId) to set the [DataModel.GameId](https://developer.roblox.com/api-reference/property/DataModel/GameId) of the game instance. However, it is the [DataModel.PlaceId](https://developer.roblox.com/api-reference/property/DataModel/PlaceId) that must be set to access the `DataStoreService`.
	 * @param placeId The ID to set the `DataModel/PlaceId` to
	 */
	SetPlaceId(this: DataModel, placeId: number): void;
	/** This function sets the [DataModel.GameId](https://developer.roblox.com/api-reference/property/DataModel/GameId) of the current game instance to the given *universeId*. This is useful when testing local .rbxl files that have not been published to Roblox.
	 * 
	 * If you want to access the `DataStoreService` in an unpublished place, you should use [DataModel.SetPlaceId](https://developer.roblox.com/api-reference/function/DataModel/SetPlaceId) instead.
	 * @param universeId The ID to set the `DataModel/GameId` to
	 */
	SetUniverseId(this: DataModel, universeId: number): void;
}

/** The base object used for Roblox Studio's settings menu.
 * 
 * Can be accessed by using the `settings()` function.
 * 
 * ## Settings classes under the GlobalSettings
 * 
 * * `DebugSettings`
 * 
 * * `GameSettings`
 * 
 * * `LuaSettings`
 * 
 * * `NetworkSettings`
 * 
 * * `PhysicsSettings`
 * 
 * * `RenderSettings`
 * 
 * * `Studio`
 */
interface GlobalSettings extends GenericSettings {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "GlobalSettings";
	/** Returns the value of an FFlag if it exists. */
	GetFFlag(this: GlobalSettings, name: string): boolean;
	/** Returns the value of an FVariable, if it exists. */
	GetFVariable(this: GlobalSettings, name: string): string;
}

/** A StatsItem is an internal measurement item that is created by the engine to benchmark many of the backend components of Roblox.
 * 
 * It cannot be created using `Instance.new`, but its value can be read by plugins. They can be found stored inside of the `Stats` service.
 */
interface StatsItem extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "RunningAverageItemDouble" | "RunningAverageItemInt" | "RunningAverageTimeIntervalItem" | "TotalCountTimeIntervalItem";
	/** Returns the StatsItem's value. */
	GetValue(this: StatsItem): number;
	/** Returns the StatsItem's value as a formatted string. */
	GetValueString(this: StatsItem): string;
}

/** A special type of `StatsItem` which measures the runtime average of an internal **double** value. */
interface RunningAverageItemDouble extends StatsItem {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "RunningAverageItemDouble";
}

/** A special type of `StatsItem` which measures the runtime average of an internal integer value.
 * 
 * As of right now, this StatsItem goes unused.
 */
interface RunningAverageItemInt extends StatsItem {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "RunningAverageItemInt";
}

/** A special type of `StatsItem` which measures a runtime average time interval.
 * 
 * As of right now, this StatsItem goes unused.
 */
interface RunningAverageTimeIntervalItem extends StatsItem {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "RunningAverageTimeIntervalItem";
}

/** A special type of [StatsItem](https://developer.roblox.com/api-reference/class/StatsItem) which measures a total-count-over-time interval.
 * 
 * As of right now, this StatsItem goes unused.
 */
interface TotalCountTimeIntervalItem extends StatsItem {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "TotalCountTimeIntervalItem";
}

/** The Studio object is a settings object that is exclusive to Roblox Studio. It can be found in Roblox Studio's settings under the Studio tab. */
interface Studio extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "Studio";
	["Active Color"]: Color3;
	["Active Hover Over Color"]: Color3;
	/** If set to true, Roblox Studio will attempt to transfer script changes that were made during a Play Solo session to the opened place. */
	["Always Save Script Changes"]: boolean;
	/** If set to true, the hover selection box that is shown when mousing over selectable objects in the `Workspace` will flash between [Studio.Hover Over Color](https://developer.roblox.com/api-reference/property/Studio/Hover) and [Studio.Select Color](https://developer.roblox.com/api-reference/property/Studio/Select) based on the [Studio.Hover Animate Speed](https://developer.roblox.com/api-reference/property/Studio/Hover). */
	["Animate Hover Over"]: boolean;
	["Auto Closing Brackets"]: boolean;
	["Auto Closing Quotes"]: boolean;
	["Auto Indent Rule"]: Enum.AutoIndentRule;
	["Auto-Recovery Enabled"]: boolean;
	["Auto-Recovery Interval (Minutes)"]: number;
	["Auto-Recovery Path"]: QDir;
	/** Specifies the background color of Roblox Studio's script editor. */
	["Background Color"]: Color3;
	/** Sets the scrolling mode of the _Advanced Objects_ tab in Roblox Studio. */
	["Basic Objects Display Mode"]: Enum.ListDisplayMode;
	/** Sets the color of built-in functions and keywords in the script editor. */
	["Built-in Function Color"]: Color3;
	/** Sets how many studs the camera will move forward or backwards when using the mouse wheel. */
	["Camera Mouse Wheel Speed"]: number;
	/** Sets the speed in studs/sec that the camera moves while holding down Shift with the movement keys. */
	["Camera Shift Speed"]: number;
	/** Sets the speed in studs/sec that the camera moves when movement keys are pressed. */
	["Camera Speed"]: number;
	["Camera Zoom to Mouse Position"]: boolean;
	/** If set to true, the output will be automatically cleared when game sessions are switched. */
	["Clear Output On Start"]: boolean;
	/** Specifies the color of comments in Roblox Studio's script editor. */
	["Comment Color"]: Color3;
	["Current Line Highlight Color"]: Color3;
	["Debugger Current Line Color"]: Color3;
	["Debugger Error Line Color"]: Color3;
	/** Specifies the default prompt directory that will be opened when the user activates the _Execute Script_ button in Roblox Studio. */
	DefaultScriptFileDir: QDir;
	/** If set to true, deprecated objects will be shown in the Advanced Objects window, as well as the Object Browser. */
	DeprecatedObjectsShown: boolean;
	["Disable Accurate Play Solo"]: boolean;
	/** If set to true, the bounding box of a selection will be used for collision detection while dragging, instead of each individual part being checked.
	 * 
	 * This makes the dragger perform smoother, but with notably less precision.
	 */
	["Drag Multiple Parts As Single Part"]: boolean;
	/** When set to true, the script editor and command bar will show an autocomplete menu while writing. */
	["Enable Autocomplete"]: boolean;
	["Enable CoreScript Debugger"]: boolean;
	["Enable Internal Features"]: boolean;
	/** Specifies the color of the wavy underline shown when malformed code is detected in the script editor. */
	["Error Color"]: Color3;
	/** Sets the highlight color of matches in the script editor's Find Selection operation (Ctrl+F). */
	["Find Selection Background Color"]: Color3;
	/** Specifies the font used in the script editor. */
	Font: QFont;
	["Format On Paste"]: boolean;
	["Format On Type"]: boolean;
	["Highlight Current Line"]: boolean;
	/** Specifies how frequently the hover animation flashes when the mouse is hovering over a selectable object in the `Workspace`. */
	["Hover Animate Speed"]: Enum.HoverAnimateSpeed;
	/** Specifies the color that the hover selection box uses. */
	["Hover Over Color"]: Color3;
	["Indent Using Spaces"]: boolean;
	/** Sets the text color of built-in Lua keywords. */
	["Keyword Color"]: Color3;
	Language: Enum.LanguagePreference;
	/** Sets the thickness of the [Model.PrimaryPart](https://developer.roblox.com/api-reference/property/Model/PrimaryPart) selection adornee.
	 * 
	 * This value is constrained between 0 and 0.05
	 */
	["Line Thickness"]: number;
	readonly LocalAssetsFolder: QDir;
	/** Specifies whether or not the [Lua Debugger](https://developer.roblox.com/articles/Lua-debugger) feature is enabled. */
	LuaDebuggerEnabled: boolean;
	readonly LuaDebuggerEnabledAtStartup: boolean;
	/** Sets the highlight color of double-clicked variables in the script editor. */
	["Matching Word Background Color"]: Color3;
	/** The maximum number of lines that can be displayed in the output. */
	["Maximum Output Lines"]: number;
	["Maximum Table Depth"]: number;
	/** Specifies the color of numbers in Roblox Studio's script editor. */
	["Number Color"]: Color3;
	/** If set to true, audio being played will only be heard if the game window is being focused on. */
	["Only Play Audio from Window in Focus"]: boolean;
	/** Sets the text color of operator characters in the script editor. */
	["Operator Color"]: Color3;
	/** Specifies the font used by the output. */
	["Output Font"]: QFont;
	/** Sets the layout mode of the output. */
	["Output Layout Mode"]: Enum.OutputLayoutMode;
	/** If set to true, the [Studio.OverrideCoreScriptsDir](https://developer.roblox.com/api-reference/property/Studio/OverrideCoreScriptsDir) will be used for CoreScripts in Roblox Studio, instead of the default `rbxasset://scripts` directory. */
	readonly OverrideCoreScripts: boolean;
	/** The directory used when overriding core scripts.
	 * 
	 * This should point to a clone of [Roblox's CoreScript GitHub repository](https://github.com/ROBLOX/Core-Scripts).
	 */
	readonly OverrideCoreScriptsDir: QDir;
	/** Sets the highest permission level that APIs have to have in order to be shown in the Object Browser.
	 * 
	 * See [Enum.PermissionLevelShown](https://developer.roblox.com/search#stq=PermissionLevelShown) for more info.
	 */
	PermissionLevelShown: Enum.PermissionLevelShown;
	PluginDebuggingEnabled: boolean;
	/** The directory where local plugins are stored. */
	PluginsDir: QDir;
	/** **(OBSOLETE)** */
	["Preprocessor Color"]: Color3;
	/** Scales how much rendering will be throttled when the game window isn't being focused on.
	 * 
	 * In practice, this property isn't very well understood, and is probably intended for internal use only.
	 */
	["Render Throttle Percentage"]: number;
	/** When set to true, Roblox Studio shortcuts will take priority over inputs being captured in the game window. */
	["Respect Studio shortcuts when game has focus"]: boolean;
	Rulers: string;
	RuntimeUndoBehavior: Enum.RuntimeUndoBehavior;
	/** The time (in seconds) a script can wait to be resumed before timing out. */
	ScriptTimeoutLength: number;
	["Search Content For Core Scripts"]: boolean;
	/** The color of the selection box used with object selections in the `Workspace` */
	["Select Color"]: Color3;
	/** Sets the color of the [Model.PrimaryPart](https://developer.roblox.com/api-reference/property/Model/PrimaryPart) selection box. */
	["Select/Hover Color"]: Color3;
	/** Sets the background color of selected text in the script editor. */
	["Selection Background Color"]: Color3;
	/** Sets the text color of selected text in the script editor. */
	["Selection Color"]: Color3;
	/** An unused Roblox Studio setting that does not appear to have any functionality. */
	["Server Audio Behavior"]: Enum.ServerAudioBehavior;
	/** If set to true, the `CoreGui` will be visible in the Explorer while the game is running. */
	["Show Core GUI in Explorer while Playing"]: boolean;
	["Show CorePackages"]: boolean;
	/** If set to true, basic diagnostic information is shown in the bottom right. */
	["Show Diagnostics Bar"]: boolean;
	["Show FileSyncService"]: boolean;
	["Show Hidden Objects in Explorer"]: boolean;
	/** If set to true, hovering over an object in the `Workspace` will show a selection box. */
	["Show Hover Over"]: boolean;
	/** When set to true, the navigation mesh used by the `PathfindingService` will be visualized. */
	["Show Navigation Mesh"]: boolean;
	/** When set to true, the `PluginGuiService` will be shown in Roblox Studio's explorer. */
	["Show Plugin GUI Service in Explorer"]: boolean;
	/** If set to true, certain internal error messages regarding the QT framework that Roblox uses will be shown in the output. */
	["Show QT warnings in output"]: boolean;
	["Show Whitespace"]: boolean;
	["Show plus button on hover in Explorer"]: boolean;
	["Skip Closing Brackets and Quotes"]: boolean;
	/** Specifies the color of strings in the script editor. */
	["String Color"]: Color3;
	/** Specifies how many spaces are used to represent a tab in the script editor. */
	["Tab Width"]: number;
	/** Specifies the color of normal text in the script editor. */
	["Text Color"]: Color3;
	/** If set to true, text in the script editor will be wrapped. */
	["Text Wrapping"]: boolean;
	/** The Theme property is used to get/set the current `StudioTheme` used by `Studio`.
	 * 
	 * This is intended for use within [Plugins](https://developer.roblox.com/api-reference/class/Plugin), but will also execute in the Command Line. You can access the function via:
	 * 
	 * ```lua
	 * settings().Studio.Theme
	 * ```
	 * 
	 * For instance, if you would like to print the current Studio theme:
	 * 
	 * ```lua
	 * print("The current Studio theme is:", settings().Studio.Theme)
	 * ```
	 * 
	 */
	Theme: StudioTheme;
	/** Specifies the color of the wavy underline shown when the script analyzer picks up a problem that should be addressed in the script editor. */
	["Warning Color"]: Color3;
	["Whitespace Color"]: Color3;
	/** The **GetAvailableThemes()** function returns a list of [StudioThemes](https://developer.roblox.com/api-reference/class/StudioTheme) available in `Studio`. You can access the function via:
	 * 
	 * ```lua
	 * settings().Studio:GetAvailableThemes()
	 * ```
	 * 
	 * @returns A list of themes available in Studio
	 */
	GetAvailableThemes(this: Studio): unknown;
	/** The **ThemeChanged** event fires when Studio's [Theme](https://developer.roblox.com/api-reference/property/Studio/Theme) changes. The best use of this event is to get the colors from the theme that changed and update your plugin’s UI accordingly.
	 * 
	 * See the [Building Studio Widgets](https://developer.roblox.com/search#stq=building%20studio%20widgets) tutorial for details on working with custom Studio widgets.
	 */
	readonly ThemeChanged: RBXScriptSignal<() => void>;
}

interface StudioData extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "StudioData";
	/** [NO DOCUMENTATION] *
	 * Tags: Hidden
	 */
	EnableScriptCollabByDefaultOnLoad: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: Hidden
	 */
	EnableScriptCollabOnLoad: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: Hidden
	 */
	EnableScriptCollabVersionHistoryOnLoad: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: Hidden, NotReplicated
	 */
	readonly SrcPlaceId: number;
	/** [NO DOCUMENTATION] *
	 * Tags: Hidden, NotReplicated
	 */
	readonly SrcUniverseId: number;
}

interface StudioService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "StudioService";
	/** 
	 * Tags: ReadOnly, NotReplicated
	
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly ActiveScript: Instance | undefined;
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly AlignDraggedObjects: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly DraggerSolveConstraints: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly DrawConstraintsOnTop: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly GridSize: number;
	/** [NO DOCUMENTATION] *
	 * Tags: NotReplicated
	 */
	readonly HoverInstance: Instance | undefined;
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly InstalledPluginData: string;
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly RotateIncrement: number;
	/** [NO DOCUMENTATION] *
	 * Tags: NotReplicated
	 */
	readonly ShowActiveInstanceHighlight: boolean;
	/** [NO DOCUMENTATION] *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly ShowConstraintDetails: boolean;
	/** 
	 * Tags: ReadOnly, NotReplicated
	
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly StudioLocaleId: string;
	/** [NO DOCUMENTATION] *
	 * Tags: NotReplicated
	 */
	UseLocalSpace: boolean;
	/** [NO DOCUMENTATION] */
	AnimationIdSelected(this: StudioService, id: number): void;
	/** [NO DOCUMENTATION] */
	BaseURLHasChineseHost(this: StudioService): boolean;
	/** [NO DOCUMENTATION] */
	ConvertToPackageUpload(this: StudioService, uploadUrl: string): void;
	/** [NO DOCUMENTATION] */
	CopyToClipboard(this: StudioService, stringToCopy: string): void;
	/** [NO DOCUMENTATION] */
	EmitPlacePublishedSignal(this: StudioService): void;
	/** [NO DOCUMENTATION] */
	GetClassIcon(this: StudioService, className: string): object;
	/** [NO DOCUMENTATION] */
	GetResourceByCategory(this: StudioService, category: string): object;
	/** [NO DOCUMENTATION] */
	GetStartupPluginId(this: StudioService): string;
	/** [NO DOCUMENTATION] */
	GetTermsOfUseUrl(this: StudioService): string;
	/** [NO DOCUMENTATION] */
	GetUserId(this: StudioService): number;
	/** [NO DOCUMENTATION] */
	GizmoRaycast(this: StudioService, origin: Vector3, direction: Vector3, raycastParams?: RaycastParams): RaycastResult;
	/** [NO DOCUMENTATION] */
	HasInternalPermission(this: StudioService): boolean;
	/** [NO DOCUMENTATION] */
	IsPluginInstalled(this: StudioService, assetId: number): boolean;
	/** [NO DOCUMENTATION] */
	IsPluginUpToDate(this: StudioService, assetId: number, currentAssetVersion: number): boolean;
	/** [NO DOCUMENTATION] */
	OpenInBrowser_DONOTUSE(this: StudioService, url: string): void;
	/** [NO DOCUMENTATION] */
	OpenPluginInsertPage(this: StudioService, assetId: number): void;
	/** [NO DOCUMENTATION] */
	PublishAs(this: StudioService, universeId: number, placeId: number, groupId: number): void;
	/** [NO DOCUMENTATION] */
	SerializeInstances(this: StudioService, instances: Array<Instance>): string;
	/** [NO DOCUMENTATION] */
	SetDocumentDisplayName(this: StudioService, newName: string): void;
	/** [NO DOCUMENTATION] */
	SetPluginEnabled(this: StudioService, assetId: number, state: boolean): void;
	/** [NO DOCUMENTATION] */
	SetUniverseDisplayName(this: StudioService, newName: string): void;
	/** [NO DOCUMENTATION] */
	ShowPlaceVersionHistoryDialog(this: StudioService): void;
	/** [NO DOCUMENTATION] */
	ShowPublishToRoblox(this: StudioService): void;
	/** [NO DOCUMENTATION] */
	UninstallPlugin(this: StudioService, assetId: number): void;
	/** [NO DOCUMENTATION] */
	UpdatePluginManagement(this: StudioService): void;
	/** 
	 * Tags: Yields
	
	 * Tags: Yields
	 *
	 * Tags: Yields
	 */
	PromptImportFile(this: StudioService, fileTypeFilter?: Array<any>): Instance | undefined;
	/** 
	 * Tags: Yields
	
	 * Tags: Yields
	 *
	 * Tags: Yields
	 */
	PromptImportFiles(this: StudioService, fileTypeFilter?: Array<any>): Array<Instance>;
	/** [NO DOCUMENTATION] *
	 * Tags: Yields
	 */
	TryInstallPlugin(this: StudioService, assetId: number, assetVersionId: number): void;
	/** [NO DOCUMENTATION] */
	readonly DEPRECATED_OnPublishPlaceToRoblox: RBXScriptSignal<() => void>;
	/** [NO DOCUMENTATION] */
	readonly GamePublishFinished: RBXScriptSignal<(success: boolean, gameId: number) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnConvertToPackageResult: RBXScriptSignal<(isSuccessful: boolean, errorMessage: string) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnImportFromRoblox: RBXScriptSignal<() => void>;
	/** [NO DOCUMENTATION] */
	readonly OnOpenConvertToPackagePlugin: RBXScriptSignal<(instances: Array<Instance>, name: string) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnOpenGameSettings: RBXScriptSignal<(pageIdentifier: string) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnOpenManagePackagePlugin: RBXScriptSignal<(userId: number, assetId: number) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnPluginInstalledFromToolbox: RBXScriptSignal<() => void>;
	/** [NO DOCUMENTATION] */
	readonly OnPluginInstalledFromWeb: RBXScriptSignal<(pluginId: string) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnPublishAsPlugin: RBXScriptSignal<(instances: Array<Instance>) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnPublishPlaceToRoblox: RBXScriptSignal<(isOverwritePublish: boolean) => void>;
	/** [NO DOCUMENTATION] */
	readonly OnSaveToRoblox: RBXScriptSignal<(instances: Array<Instance>) => void>;
}

interface StudioTheme extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "StudioTheme";
	/** The **GetColor()** function returns the [DataType.Color3](https://developer.roblox.com/search#stq=Color3) corresponding to the arguments provided. For instance, if you would like to get the [DataType.Color3](https://developer.roblox.com/search#stq=Color3) of the Studio "MainButton" when it's **disabled**, you can use the following code:
	 * 
	 * ```lua
	 * settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainButton, Enum.StudioStyleGuideModifier.Disabled)
	 * ```
	 * 
	 * See the [StudioStyleGuideColor](https://developer.roblox.com/search#stq=StudioStyleGuideColor) reference for a list of Studio elements and [StudioStyleGuideModifier](https://developer.roblox.com/search#stq=StudioStyleGuideModifier) for a list of modifiers.
	 * @param styleguideitem The element you want to get the theme color for
	 * @param modifier The modifier you want to place on the `StyleGuideColor` element
	 * @returns The corresponding Color3 theme value
	 */
	GetColor(this: StudioTheme, styleguideitem: CastsToEnum<Enum.StudioStyleGuideColor>, modifier?: CastsToEnum<Enum.StudioStyleGuideModifier>): Color3;
	/** The GetPath function returns the path of an asset (or image) for the `Id` and `Modifier`. We can have different icons to be loaded depending on the theme.
	 * 
	 * The `StyleGuideModifer` argument's default value is `Enum\StyleGuideModifier`, which applies no modifier.
	 * 
	 * This is intended for use within [Plugins](https://developer.roblox.com/api-reference/class/Plugin), but will also execute in the Command Line.
	 * 
	 * For instance, if you would like to get the path of the "MoreButton" image, you would use the following code:
	 * 
	 * ```lua
	 * 
	 * settings().Studio.Theme:GetPath("MoreButton")
	 * @param assetid The asset id you want the path for
	 * @param modifier The modifier you want to apply to the specified asset
	 * @returns The path of the id with the modifier
	 */
	GetPath(this: StudioTheme, assetid: string, modifier?: CastsToEnum<Enum.StudioStyleGuideModifier>): string;
}

/** TaskScheduler is a read-only settings class responsible for the Task Scheduler  feature.
 * 
 * Can be found in Roblox Studio's settings with the name *Task Scheduler*.
 */
interface TaskScheduler extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "TaskScheduler";
	/** The average time divided by the average interval of the duty cycle.
	 * 	
	 * The average time divided by the average interval of the duty cycle.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The average time divided by the average interval of the duty cycle.
	 * 	
	 * The average time divided by the average interval of the duty cycle.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly SchedulerDutyCycle: number;
	/** The current average rate of the task scheduler.
	 * 	
	 * The current average rate of the task scheduler.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The current average rate of the task scheduler.
	 * 	
	 * The current average rate of the task scheduler.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly SchedulerRate: number;
	/** The specified thread pooling configuration for the task scheduler. */
	ThreadPoolConfig: Enum.ThreadPoolConfig;
	/** The current size of the thread pool.
	 * 	
	 * The current size of the thread pool.
	 * 
	 * Tags: ReadOnly, NotReplicated
	The current size of the thread pool.
	 * 	
	 * The current size of the thread pool.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly ThreadPoolSize: number;
}

/** The TestService is a service used by Roblox internally to run analytical tests on their engine.
 * 
 * It makes it possible to write sophisticated tests right inside a game.
 * 
 * ## Macros
 * 
 * Scripts that are executed inside of the TestService (via [TestService.Run](https://developer.roblox.com/api-reference/function/TestService/Run)) have access to special macros that directly invoke functions under the TestService. Macros are essentially substitutions for large blocks of code that shouldn't need to be rewritten each time you want to call them.
 * 
 * ### RBX_CHECK
 * 
 * This macro does tests with calls to the [TestService.Check](https://developer.roblox.com/api-reference/function/TestService/Check) function.
 * 
 * | Macro | Test Condition |
 * | --- | --- |
 * | RBX_CHECK(cond) | cond == true |
 * | RBX_CHECK_MESSAGE(cond, failMsg) | cond == true |
 * | RBX_CHECK_THROW(CODE) | pcall(function () CODE end) == false |
 * | RBX_CHECK_NO_THROW(CODE) | pcall(function () CODE end) == true |
 * | RBX_CHECK_EQUAL(a,b) | a == b |
 * | RBX_CHECK_NE(a,b) | a ~= b |
 * | RBX_CHECK_GE(a,b) | a >= b |
 * | RBX_CHECK_LE(a,b) | a  b |
 * | RBX_CHECK_LT(a,b) | a < b |
 * 
 * ### RBX_REQUIRE
 * 
 * This macro does tests with calls to the [TestService.Require](https://developer.roblox.com/api-reference/function/TestService/Require) function.
 * 
 * | Macro | Test Condition |
 * | --- | --- |
 * | RBX_REQUIRE(cond) | cond == true |
 * | RBX_REQUIRE_MESSAGE(cond, failMsg) | cond == true |
 * | RBX_REQUIRE_THROW(CODE) | pcall(function () CODE end) == false |
 * | RBX_REQUIRE_NO_THROW(CODE) | pcall(function () CODE end) == true |
 * | RBX_REQUIRE_EQUAL(a,b) | a == b |
 * | RBX_REQUIRE_NE(a,b) | a ~= b |
 * | RBX_REQUIRE_GE(a,b) | a >= b |
 * | RBX_REQUIRE_LE(a,b) | a  b |
 * | RBX_REQUIRE_LT(a,b) | a < b |
 * 
 * ### RBX_WARN
 * 
 * This macro does tests with calls to the [TestService.Warn](https://developer.roblox.com/api-reference/function/TestService/Warn) function.
 * 
 * | Macro | Test Condition |
 * | --- | --- |
 * | RBX_WARN(cond) | cond == true |
 * | RBX_WARN_MESSAGE(cond, failMsg) | cond == true |
 * | RBX_WARN_THROW(CODE) | pcall(function () CODE end) == false |
 * | RBX_WARN_NO_THROW(CODE) | pcall(function () CODE end) == true |
 * | RBX_WARN_EQUAL(a,b) | a == b |
 * | RBX_WARN_NE(a,b) | a ~= b |
 * | RBX_WARN_GE(a,b) | a >= b |
 * | RBX_WARN_LE(a,b) | a  b |
 * | RBX_WARN_LT(a,b) | a < b |
 * 
 * ### Additional Macros
 * 
 * | Macro | Description |
 * | --- | --- |
 * | RBX_ERROR(msg) | Directly calls the [TestService.Error](https://developer.roblox.com/api-reference/function/TestService/Error) function. |
 * | RBX_FAIL(msg) | Directly calls the [TestService.Fail](https://developer.roblox.com/api-reference/function/TestService/Fail) function. |
 * | RBX_MESSAGE(msg) | Directly calls the [TestService.Message](https://developer.roblox.com/api-reference/function/TestService/Message) function. |
 * 
 * ## See Also
 * 
 * * [Speeding Roblox Development with Continuous Testing](http://blog.roblox.com/2012/04/speeding-roblox-development-with-continuous-testing)
 */
interface TestService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "TestService";
	/** If set to true, the game will start running when the TestService's [TestService.Run](https://developer.roblox.com/api-reference/function/TestService/Run) method is called. */
	AutoRuns: boolean;
	/** A description of the test being executed. */
	Description: string;
	/** Measures how many errors have been recorded in the test session.
	 * 	
	 * Measures how many errors have been recorded in the test session.
	 * 
	 * Tags: ReadOnly, NotReplicated
	Measures how many errors have been recorded in the test session.
	 * 	
	 * Measures how many errors have been recorded in the test session.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly ErrorCount: number;
	/** When set to true, the TestService will be executed when using the _Run_ action in Roblox Studio.
	 * 
	 * ## Notes
	 * 
	 * * If the [TestService.NumberOfPlayers](https://developer.roblox.com/api-reference/property/TestService/NumberOfPlayers) property is set to a value above 0, running the game will open `NumberOfPlayers + 1` studio windows, where one window is a server, and the rest are players connected to that server.
	 * 
	 * 	* Try to keep this value within a rational range (1 to 8 players at most), or else your computer's CPU will get overloaded.
	 */
	ExecuteWithStudioRun: boolean;
	/** Sets whether or not the physics engine should be throttled to 30 FPS while the test is being ran. */
	Is30FpsThrottleEnabled: boolean;
	/** Sets whether or not the physics environment should be throttled while running this test. */
	IsPhysicsEnvironmentalThrottled: boolean;
	/** Sets whether or not physics objects will be allowed to fall asleep while the test simulation is running. */
	IsSleepAllowed: boolean;
	/** The number of players expected in this test, if any. */
	NumberOfPlayers: number;
	/** Sets a specific amount of additional latency experienced by players during the test session. */
	SimulateSecondsLag: number;
	/** Measures how many test calls have been recorded in the test session.
	 * 	
	 * Measures how many test calls have been recorded in the test session.
	 * 
	 * Tags: ReadOnly, NotReplicated
	Measures how many test calls have been recorded in the test session.
	 * 	
	 * Measures how many test calls have been recorded in the test session.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly TestCount: number;
	/** The maximum amount of time that tests are allowed to run for. */
	Timeout: number;
	/** Measures how many warning calls have been recorded in the test session.
	 * 	
	 * Measures how many warning calls have been recorded in the test session.
	 * 
	 * Tags: ReadOnly, NotReplicated
	Measures how many warning calls have been recorded in the test session.
	 * 	
	 * Measures how many warning calls have been recorded in the test session.
	 * 
	 * Tags: ReadOnly, NotReplicated
	 *
	 * Tags: ReadOnly, NotReplicated
	 */
	readonly WarnCount: number;
	/** If condition is true, prints "Check passed: ", followed by description to the output, in blue text. Otherwise, prints "Check failed: ", again, followed by description, but in red text. */
	Check(this: TestService, condition: boolean, description: string, source?: Instance, line?: number): void;
	/** Prints "Test checkpoint: ", followed by text, to the output, in blue text. */
	Checkpoint(this: TestService, text: string, source?: Instance, line?: number): void;
	/** Prints Testing Done to the output, in blue text. */
	Done(this: TestService): void;
	/** Prints a red message to the output, prefixed by `TestService: `. */
	Error(this: TestService, description: string, source?: Instance, line?: number): void;
	/** Indicates a fatal error in a TestService run.
	 * 
	 * If this is called inside of a script running inside of the TestService, this will initiate a [breakpoint](https://developer.roblox.com/articles/Lua-debugger) on the line that invoked the error.
	 */
	Fail(this: TestService, description: string, source?: Instance, line?: number): void;
	/** Prints Test message, followed by text to the output, in blue text. */
	Message(this: TestService, text: string, source?: Instance, line?: number): void;
	/** If `condition` is true, prints `Require passed: `, followed by `description`, to the output in blue text. Otherwise, prints `Require failed. Test ended: `, followed by `description`, to the output in red text. */
	Require(this: TestService, condition: boolean, description: string, source?: Instance, line?: number): void;
	/** If condition is true, prints Warning passed: , followed by description, to the output, in blue text. Otherwise, prints Warning: , followed by description, to the output, in yellow text. */
	Warn(this: TestService, condition: boolean, description: string, source?: Instance, line?: number): void;
	/** [NO DOCUMENTATION] */
	isFeatureEnabled(this: TestService, name: string): boolean;
	/** 
	 * Tags: Yields
	
	 * Tags: Yields
	 *
	 * Tags: Yields
	 */
	Run(this: TestService): void;
	/** Fired when the server should collect a conditional test result. */
	readonly ServerCollectConditionalResult: RBXScriptSignal<(condition: boolean, text: string, script: LuaSourceContainer, line: number) => void>;
	/** Fired when the server should collect a test result. */
	readonly ServerCollectResult: RBXScriptSignal<(text: string, script: LuaSourceContainer, line: number) => void>;
}

interface VersionControlService extends Instance {
	/** The string representing the class this Instance belongs to. `classIs()` can be used to check if this instance belongs to a specific class, ignoring class inheritance. */
	readonly ClassName: "VersionControlService";
}

