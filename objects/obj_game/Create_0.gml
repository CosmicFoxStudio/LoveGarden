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
global.day = 1;
global.currentDaytime = e_daytime.MORNING;
global.date = ConvertDate(date_current_datetime());
global.saveSlot = 0;
global.playerStats = new DefineStats();
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
global.NPCs[e_SO.YPE] = new DefineStats();
global.NPCs[e_SO.CARU] = new DefineStats();
global.NPCs[e_SO.ROSE] = new DefineStats();
global.NPCs[e_SO.CLOVE] = new DefineStats();
global.NPCs[e_SO.HYDRA] = new DefineStats();
global.progress = [];
Progress();
#region GAME CONTROLS
/*
---------------- CONFIRM ----------------
Master Race _______________ SPACE BAR, MOUSE LEFT
Consoles	_______________ Top button 1 (A on Xbox 360, cross on PS) 
---------------- CANCEL -----------------
Master Race _______________ BACKSPACE, MOUSE RIGHT
Consoles	_______________ Top button 2 (B on Xbox 360, circle on PS) 
---------------- START ------------------
Master Race _______________ ENTER, MOUSE MIDDLE
Consoles	_______________ The start button (The "options" button on a PS4)
------------- DIRECTIONAL ---------------
Master Race _______________ ARROW KEYS
Consoles	_______________  D-PAD
-----------------------------------------
*/
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
function KeybindingCreate(_inputMode) {
	if (global.inputMode == e_input.MOUSE) {
		return new KeybindingDefinition(mb_left, mb_right, mb_middle);
	}	
	
	if (global.inputMode == e_input.KEYBOARD) {
		return new KeybindingDefinition(vk_space, vk_backspace, vk_enter, vk_up, vk_down, vk_left, vk_right);
	}
	
	if (global.inputMode == e_input.GAMEPAD) {
		return new KeybindingDefinition(gp_face1, gp_face2, gp_start, gp_padu, gp_padd, gp_padl, gp_padr);
	}
}

global.inputMode = e_input.KEYBOARD; 
global.keybind = KeybindingCreate(global.inputMode);
// To reference: global.keybind.confirm

#endregion GAME CONTROLS

#region ROOMS & NAVIGATION
global.roomType = e_roomTypes.SCENES;
// These globals are used as DS Lists for the debug room list
global.rmCurrent = room_get_name(rm_test);
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
global.roomYarnMap[? "rm_test"	]			= "scenes/main_day0_test.yarn";
global.roomYarnMap[? "rm_dormroom"	]		= "scenes/main_day1_dormroom_morning.yarn";
global.roomYarnMap[? "rm_dormitory"	]		= "scenes/main_day1_dormitory_morning.yarn";
// And so on...

// ----------------------- Chatterbox Localization Build -----------------------  //

// Only uncomment this next line when there are NEW dialogue lines to be generated!!
// (You will also need do disable sandboxing temporarily)
// ChatterboxLocalizationBuild(global.dialogueList, [("lang/" + "en_dialogues.csv")]);
// OBS: LoadLocalization() is set at rm_title's creation code

// ------------------------------ TESTING ZONE ------------------------------ //
if (Debug()) instance_create_layer(0, 0, "Controllers", DEBUG_DRAWER);

// Add first room here
room_goto(rm_lang);
// room_goto(rm_dream);
// room_goto(rm_file_selection);
// room_goto(rm_title);
