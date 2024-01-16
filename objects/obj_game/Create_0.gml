/// @description Persistent Game Manager
// Initializes globals & enumerators
Enums();
global.debug = false;
global.hoveringButton = false;
global.hoveringPlace = "";
global.isMapOn = false;
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
global.playerStats = DefineStats(1);
global.actions[0] = 4;	// DAY 0 (for debug)
global.actions[1] = 4;	// DAY 1
global.actions[2] = 4;	// DAY 2
global.actions[3] = 4;	// DAY 3
global.actions[4] = 4;	// DAY 4
global.maxActions = [0, 4, 4, 4, 4];
global.flags = { 
	met_solanum: 0,
	met_hydra: false,
	finished_fern_intro: false,
	sat_with_ype: false,
	sat_with_hydra: false,
	stood_ype_up: false
};
global.routes[e_SO.YPE] = false;
global.routes[e_SO.CARU] = false 
global.routes[e_SO.ROSE] = false; 
global.routes[e_SO.CLOVE] = false; 
global.routes[e_SO.HYDRA] = false; 

global.state = e_gameStates.TITLE_SCREEN;
global.statePrevious = global.state;
// Player Info
global.playerName = "PLAYER";
global.pronouns = e_pronouns.ELU;
global.NPCs = [];
global.NPCs[e_SO.YPE] = DefineStats();
global.NPCs[e_SO.CARU] = DefineStats();
global.NPCs[e_SO.ROSE] = DefineStats();
global.NPCs[e_SO.CLOVE] = DefineStats();
global.NPCs[e_SO.HYDRA] = DefineStats();
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

function KeybindingDefinition(_confirm=-1, _cancel=-1, _start=-1, _up=-1, _down=-1, _left=-1, _right=-1, _confirm2=-1, _cancel2=-1, _start2=-1) constructor {
	confirm = _confirm;
	cancel = _cancel;
	start = _start;
	up = _up;
	down = _down;
	left = _left;
	right = _right;
	confirm2 = _confirm2;
	cancel2 = _cancel2;
	start2 = _start2;
}

// Config keybindings
function KeybindingCreate(_inputMode) {
	if (global.inputMode == e_input.MOUSE) {
		//return new KeybindingDefinition(mb_left, mb_right, mb_middle);
		return new KeybindingDefinition(mb_left, mb_right, mb_middle, vk_up, vk_down, vk_left, vk_right, vk_space, vk_backspace, vk_enter);
	}	
	
	if (global.inputMode == e_input.KEYBOARD) {
		return new KeybindingDefinition(vk_space, vk_backspace, vk_enter, vk_up, vk_down, vk_left, vk_right);
	}
	
	if (global.inputMode == e_input.GAMEPAD) {
		return new KeybindingDefinition(gp_face1, gp_face2, gp_start, gp_padu, gp_padd, gp_padl, gp_padr);
	}
}

global.inputMode = e_input.MOUSE; 
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
	show_debug_message("TEST");
}
else {
	// In browser - load files manually
	ChatterboxLoadFromFile("scenes/main_day0_test.yarn");
	ChatterboxLoadFromFile("scenes/main_day1_dormroom.yarn");
	ChatterboxLoadFromFile("scenes/main_day1_dormitory.yarn");
	ChatterboxLoadFromFile("scenes/main_day1_boat_departure.yarn");
	ChatterboxLoadFromFile("scenes/main_day1_school.yarn");
	//ChatterboxLoadFromFile("scenes/main_day1_classroom.yarn");
}

#endregion CHATTERBOX LOAD FILES

//  ---------------- Data structure to get node based on room  ------------------  //

// Room-to-yarn map
global.roomYarnMap = ds_map_create();
global.roomYarnMap[? "rm_test"	]			= "scenes/main_day0_test.yarn";
global.roomYarnMap[? "rm_dormroom"	]		= "scenes/main_day1_dormroom.yarn";
global.roomYarnMap[? "rm_dormitory"	]		= "scenes/main_day1_dormitory.yarn";
global.roomYarnMap[? "rm_boat"	]			= "scenes/main_day1_boat_departure.yarn";
global.roomYarnMap[? "rm_school"]			= "scenes/main_day1_school.yarn";
global.roomYarnMap[? "rm_classroom"	]		= "scenes/main_day1_classroom.yarn";
// And so on...

// ----------------------- Chatterbox Localization Build -----------------------  //

// Only uncomment this next line when there are NEW dialogue lines to be generated!!
// (You will also need do disable sandboxing temporarily)
// ChatterboxLocalizationBuild(global.dialogueList, [("lang/" + global.lang + "_dialogues.csv")]);
// OBS: LoadLocalization() is set at rm_title's creation code

// ------------------------------ TESTING ZONE ------------------------------ //
if (Debug()) instance_create_layer(0, 0, "Controllers", DEBUG_DRAWER);

// Add first room here
room_goto(rm_lang);
// room_goto(rm_dream);
// room_goto(rm_file_selection);
// room_goto(rm_title);
