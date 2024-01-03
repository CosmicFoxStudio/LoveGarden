Enums();
global.debug = false;
global.pause = false;
global.lang = "en"; // "en", "pt"
SetLanguage();
global.currentDaytime = e_daytime.MORNING;
global.status = {
	wilting: 0,
	growth: 0,
	blossom: 0,
	humor: 0
}
global.flags = {
	bad: false,
	love: false,
	favePlace: false,
}
// Player Info
global.playerName = ""; // Used in obj_player_creator
global.progress = [];
Progress();
// Input
global.MOUSE_CONFIRM = false;
global.SPACE_CONFIRM = false;
global.BACKSPACE_CANCEL = false;
global.PRESSED_UP = false;
global.PRESSED_DOWN = false;
global.PRESSED_LEFT = false;
global.PRESSED_RIGHT = false;

#region ROOMS & NAVIGATION
global.roomType = e_roomTypes.SCENES;
//global.roomMusic = "";
// These globals are used as DS Lists in obj_room_setup (for debug room list)
global.rmCurrent = room_get_name(room);
global.location = global.rmCurrent;
global.rmName = noone;
global.rmNameSorted = noone;
// Room Transitions
global.roomTarget = -1;
global.midTransition = false;
#endregion ROOMS & NAVIGATION

#region CAMERA
global.resize = false;
global.is_fullscreen = false;
global.camera_id = -1;
// Resolution struct
global.res = { // See menu_functions script
	xx: 0,
	yy: 0,
	width: 640,
	height: 360,
	scale: 1 //1 ---> 640x360 | 2 ---> 1280x720
}
global.view_width = global.res.width * global.res.scale;
global.view_height = global.res.height * global.res.scale;
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
//room_goto(rm_title);
room_goto(rm_lang);
