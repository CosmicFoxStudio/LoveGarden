/// @description Persistent Game Manager
// Initializes globals & enumerators
Enums();
global.debug = false;
global.lastFontUsed = -1;
DrawFont(fnt_dialogue); // Run the first time
global.configMenu = noone;
global.lang = "en"; // "en", "pt"
SetLanguage();
// Manages the loading of translated files based on the game language
ManageLocalization();
global.day = 4;
global.currentDaytime = e_daytime.MORNING;
global.date = ConvertDate(date_current_datetime());
global.saveSlot = 0;
global.playerStats = new StatsDefinition();
global.flags = {
	bad: false,
	love: false,
	favePlace: false
}
global.state = e_gameStates.TITLE_SCREEN;
global.statePrevious = global.state;
// Player Info
global.playerName = "PLAYER";
global.pronouns = e_pronouns.ELU;
global.favePlace = "";
global.NPCs = [];
global.NPCs[e_SO.YPE] = new StatsDefinition();
global.NPCs[e_SO.CARU] = new StatsDefinition();
global.NPCs[e_SO.ROSE] = new StatsDefinition();
global.NPCs[e_SO.CLOVE] = new StatsDefinition();
global.NPCs[e_SO.HYDRA] = new StatsDefinition();
global.progress = [];
Progress();
#region GAME CONTROLS
global.inputMode = 0; // 0 ---> Mouse, 1 ---> Keyboard
/*
---------------- CONFIRM ----------------
Master Race _______________ Z, SPACE BAR, MOUSE LEFT
Consoles	_______________ Top button 1 (A on Xbox 360, cross on PS) 
---------------- CANCEL -----------------
Master Race _______________ X, BACKSPACE, MOUSE RIGHT
Consoles	_______________ Top button 2 (B on Xbox 360, circle on PS) 
---------------- START ------------------
Master Race _______________ C, ENTER, MOUSE MIDDLE
Consoles	_______________ The start button (The "options" button on a PS4)
------------- DIRECTIONAL ---------------
Master Race _______________ ARROW KEYS, (W, A, S, D)
Consoles	_______________  D-PAD
-----------------------------------------
*/
// Gamepad
global.current_gamepad = 0; // The device
// Mouse
global.HELD_MOUSE_LEFT = false;
global.RELEASED_MOUSE_LEFT = false;
global.PRESSED_MOUSE_LEFT = false;
global.HELD_MOUSE_RIGHT	= false;
global.RELEASED_MOUSE_RIGHT = false;
global.PRESSED_MOUSE_RIGHT = false;
global.PRESSED_MOUSE_MIDDLE = false;
// Held
global.HELD_ARROWS = false;
global.HELD_UP = false; 
global.HELD_DOWN = false;
global.HELD_LEFT = false;
global.HELD_RIGHT = false;
global.HELD_CANCEL = false;
global.HELD_CONFIRM = false;
// Pressed
global.PRESSED_UP = false;
global.PRESSED_DOWN = false;
global.PRESSED_LEFT = false;
global.PRESSED_RIGHT = false;
global.PRESSED_CONFIRM = false;	
global.PRESSED_CANCEL = false;	
global.PRESSED_START = false;
// Released
global.RELEASED_UP = false;
global.RELEASED_DOWN = false;
global.RELEASED_LEFT = false;
global.RELEASED_RIGHT = false;
global.RELEASED_CONFIRM = false;
global.RELEASED_CANCEL = false;
// Shoulder
//global.SHOULDER_LEFT = false;
//global.SHOULDER_RIGHT = false;
#endregion GAME CONTROLS
#region ROOMS & NAVIGATION
global.roomType = e_roomTypes.SCENES;
// These globals are used as DS Lists for the debug room list
global.rmCurrent = room_get_name(rm_dormroom);
global.location = "Dormroom";
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
}
global.viewWidth = global.res.width * global.res.scale;
global.viewHeight = global.res.height * global.res.scale;
SetResolution();
#endregion CAMERA

#region CHATTERBOX LOAD FILES
global.dialogueList = [];
	
if os_browser == browser_not_a_browser {
	// Not in browser - Load the files dynamically
	LoadDialogueFiles();
}
else {
	// In browser - load files manually
	ChatterboxLoadFromFile("scenes/main_scene0_test.yarn");
}

#endregion CHATTERBOX LOAD FILES

//  ---------------- Data structure to get node based on room  ------------------  //

// Room-to-yarn map
global.roomYarnMap = ds_map_create();
global.roomYarnMap[? "rm_dormroom"	]		= "scenes/main_day0_test.yarn";
// And so on...

// ----------------------- Chatterbox Localization Build -----------------------  //

// Only uncomment this next line when there are NEW dialogue lines to be generated!!
// (You will also need do disable sandboxing temporarily)
// ChatterboxLocalizationBuild(global.dialogueList, [("lang/" + "en_dialogues.csv")]);
// OBS: LoadLocalization() is set at rm_title's creation code

// ------------------------------ TESTING ZONE ------------------------------ //
if (Debug()) instance_create_layer(0, 0, "Controllers", DEBUG_DRAWER);
// Add first room here
//room_goto(rm_lang);
// room_goto(rm_dream);
// room_goto(rm_file_selection);
room_goto(rm_title);
