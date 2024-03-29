/// @description Persistent Game Manager

// Initializes globals & enumerators
Enums();
camera = -1;
global.debug = false;
global.gameMode = e_gameMode.DEMO;
global.lastFontUsed = -1;
DrawFont(fnt_dialogue); // Run the first time
global.configMenu = noone;
global.date = ConvertDate(date_current_datetime());
global.saveSlot = 0;
global.state = e_gameStates.TITLE_SCREEN;
global.statePrevious = global.state;
global.hoveringButton = false;
global.hoveringConfigButton = false;
global.hoveringTextbox = false;
global.hoveringPlace = "";
global.isMapOn = true;
global.keyboardIcons = false;

// Localization Info
global.lang = "en";     // "en", "pt"
SetLanguage();
ManageLocalization();

// Day Info
global.day = 1;
global.currentDaytime = e_daytime.MORNING;
global.actions[0] = 0;	// DAY 0 (for debug)
global.actions[1] = 3;	// DAY 1
global.actions[2] = 3;	// DAY 2
global.actions[3] = 3;	// DAY 3
global.actions[4] = 3;	// DAY 4
global.maxActions = [0, 5, 5, 5, 5];
global.flags = { 
	met_solanum: 0,
	orange_photo_book_talk: false,
	met_hydra: false,
	sat_with_ype: false,
	sat_with_hydra: false,
	stood_ype_up: false,
	sat_alone: false
};

// Player Info
global.playerName = "PLAYER";
global.pronouns = e_pronouns.ELU;
global.playerStats = DefineStats();
global.progress = [];
Progress();

// NPC Info
global.NPCs = [];
global.NPCs[e_SO.YPE] = DefineStats();
global.NPCs[e_SO.CARU] = DefineStats();
global.NPCs[e_SO.ROSE] = DefineStats();
global.NPCs[e_SO.CLOVE] = DefineStats();
global.NPCs[e_SO.HYDRA] = DefineStats();
global.routes[e_SO.YPE] = false;
global.routes[e_SO.CARU] = false 
global.routes[e_SO.ROSE] = false; 
global.routes[e_SO.CLOVE] = false; 
global.routes[e_SO.HYDRA] = false; 
global.characterSprites = {
    "maple": spr_maple,
    "ype": spr_ype,
    "caru": spr_caru,
    "rose": spr_rose,
    "clove": spr_clove,
    "hydra": spr_hydra,
    "fern": spr_fern,
    "orange": spr_orange,
    "nanne": spr_nanne,
    "cali": spr_cali,
    "void": spr_noone,
};

#region GAME CONTROLS
// The gamepad device (player 1)
global.GAMEPAD = 0;  

function KeybindingDefinition(_confirm=-1, _cancel=-1, _start=-1, _up=-1, _down=-1, _left=-1, _right=-1) constructor {
	confirm = _confirm;
	cancel = _cancel;
	start = _start;
	up = _up;
	down = _down;
	left = _left;
	right = _right;
}

// Config keybindings
function PrimaryKeybindingCreate() {
	var _keybind = array_create(3);
	_keybind[e_input.MOUSE] = new KeybindingDefinition(mb_left, mb_right, mb_middle);
	_keybind[e_input.KEYBOARD] = new KeybindingDefinition(vk_space, vk_backspace, vk_enter, vk_up, vk_down, vk_left, vk_right);
	_keybind[e_input.GAMEPAD] = new KeybindingDefinition(gp_face1, gp_face2, gp_start, gp_padu, gp_padd, gp_padl, gp_padr);
	
	return _keybind;
}

function SecondaryKeybindingCreate() {
	var _keybind = array_create(3);
	_keybind[e_input.MOUSE] = new KeybindingDefinition();
	_keybind[e_input.KEYBOARD] = new KeybindingDefinition(, , , ord("W"), ord("S"), ord("A"), ord("D"));
	_keybind[e_input.GAMEPAD] = new KeybindingDefinition();
	
	return _keybind;
}

global.primaryKeybind = PrimaryKeybindingCreate();
global.secondaryKeybind = SecondaryKeybindingCreate();
// To reference: global.keybind.confirm
#endregion GAME CONTROLS

#region ROOMS & NAVIGATION
global.roomType = e_roomTypes.SCENES;
// These globals are used as DS Lists for the debug room list
global.rmCurrent = "";
global.location = "";
global.rmName = noone;
global.rmNameSorted = noone;
// Room Transitions
global.roomTarget = -1;
global.midTransition = false;
#endregion ROOMS & NAVIGATION

#region CAMERA
global.isResizing = false;
global.fullscreen = window_get_fullscreen();
global.cameraID = -1;
// Initialize resolution struct
global.res = {
	// Never change the width or the height!! Just the scale
	width: 640,
	height: 360,
	scale: 2 //1 ---> 640x360 | 2 ---> 1280x720 | 3 ---> 1920x1080
} // Use scale:1 for building to the web, scale:2 to the rest
global.viewWidth = global.res.width * global.res.scale;
global.viewHeight = global.res.height * global.res.scale;
SetResolution();
#endregion CAMERA

#region CHATTERBOX LOAD FILES
global.dialogueList = [];
	
if (os_browser == browser_not_a_browser) {
	// Not in browser - Load the canon files dynamically
	LoadDialogueFiles();
	// Load Bonus Events
	ChatterboxLoadFromFile("scenes/demo_day1_bonus.yarn");
}
else {
	// In browser - load files manually
	if (global.gameMode == e_gameMode.DEMO) {
		// DEMO MODE
		ChatterboxLoadFromFile("scenes/demo_day1_dormitory.yarn");
		ChatterboxLoadFromFile("scenes/demo_day1_boat.yarn");
		ChatterboxLoadFromFile("scenes/demo_day1_sciences.yarn");
		ChatterboxLoadFromFile("scenes/demo_day1_central.yarn");
	}
	else {
		// RELEASE MODE
		ChatterboxLoadFromFile("scenes/main_day0_test.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_dormitory.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_boat.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_sciences.yarn");
	}
}

#endregion CHATTERBOX LOAD FILES

//  ---------------- Data structure to get node based on room  ------------------  //

// Room-to-yarn map
global.roomYarnMap = ds_map_create();
// DEMO MODE
if (global.gameMode == e_gameMode.DEMO) {
	//global.roomYarnMap[? "rm_test"]			= "scenes/main_day0_test.yarn";
	global.roomYarnMap[? "rm_dormitory"]		= "scenes/demo_day1_dormitory.yarn";
	global.roomYarnMap[? "rm_boat"]				= "scenes/demo_day1_boat.yarn";
	global.roomYarnMap[? "rm_sciences"]			= "scenes/demo_day1_sciences.yarn";
	global.roomYarnMap[? "rm_central"]			= "scenes/demo_day1_central.yarn";
}
// RELEASE MODE
else {
	global.roomYarnMap[? "rm_test"]				= "scenes/main_day0_test.yarn";
	global.roomYarnMap[? "rm_dormitory"]		= "scenes/main_day1_dormitory.yarn";
	global.roomYarnMap[? "rm_boat"]				= "scenes/main_day1_boat.yarn";
	global.roomYarnMap[? "rm_sciences"]			= "scenes/main_day1_sciences.yarn";
	// And so on...
}
// ----------------------- Chatterbox Localization Build -----------------------  //

// Only uncomment this next line when there are NEW dialogue lines to be generated!!
// (You will also need do disable sandboxing temporarily)
// ChatterboxLocalizationBuild(global.dialogueList, [("lang/" + global.lang + "_dialogues.csv")]);
// OBS: LoadLocalization() is set at rm_title's creation code

// -----------------------------------------------------------------------------  //

#region CHATTERBOX INITIALIZE CUSTOMS
// Custom Chatterbox Functions
ChatterboxAddFunction("addAction", AddAction);				    	// Adds a certain number of actions
ChatterboxAddFunction("assignRoute", RouteAssign);					// Assign a character route
ChatterboxAddFunction("backTitle", BackToTitle);			    	// Goes back to the title screen and changes game state
ChatterboxAddFunction("bg", BackgroundSetIndex);					// Function to change background
ChatterboxAddFunction("chara", CharacterOnScreen);					// Function to draw character
ChatterboxAddFunction("shadow", CharacterShadowOnScreen);			// Function to draw shadow character
ChatterboxAddFunction("emotion", CharacterExpressionOnScreen);		// Function to change character expression
ChatterboxAddFunction("dialogueWait", DialogueWait);				// Makes the textbox wait for x seconds
ChatterboxAddFunction("save", SaveGame);							// Calls the save script from inside a yarn file
ChatterboxAddFunction("changeRelationship", ChangeRelationshipBar)  // Adds or removes hearts to romanceable characters relationship bars
ChatterboxAddFunction("getRelationship", GetRelationshipBar)        // Checks relationship bars of romanceable characters
ChatterboxAddFunction("nextDay", NextDay);							// Increments by 1 global.day and set global.currentDaytime to morning
ChatterboxAddFunction("nextDaytime", NextDaytime);					// Increments by 1 global.currentDaytime
ChatterboxAddFunction("nextRoom", NextRoom);						// Function to change scene
ChatterboxAddFunction("transition", DialogueTransition);			// Transition VFX
ChatterboxAddFunction("bgTransition", BackgroundWaitTransition);	// Change background using transition
ChatterboxAddFunction("setFlag", FlagSet);							// Sets a value to a flag
ChatterboxAddFunction("getFlag", FlagGet);							// Returns the value of a given flag
#endregion CHATTERBOX INITIALIZE CUSTOMS

// ------------------------------ TESTING ZONE ---------------------------------- //
if (Debug()) {
	instance_create_layer(ORIGIN_X, ORIGIN_Y, "Controllers", DEBUG_DRAWER);
}

time_source_start(time_source_create(time_source_game, 120, time_source_units_frames, function() {
    // Add first room here
	GameTransitionChangeRoom(rm_lang, sq_trans_fade_black);
}));