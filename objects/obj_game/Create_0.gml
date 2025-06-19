/// @description Persistent Game Manager

// Audio load variables
total_audio_groups = 2;
total_audio_groups_loaded = 0;
camera = -1;

// Initializes globals
global.debug = false;
global.lastFontUsed = -1;
global.dialogFonts = [
	[fnt_dialogue_s, fnt_dialogue, fnt_dialogue_l],
	[fnt_dialogue2_s, fnt_dialogue2, fnt_dialogue2_l]
];
global.fontType = e_fontType.PRIMARY;
global.fontSize = e_fontSize.MEDIUM;
DrawFont(fnt_dialogue); // Run the first time
global.configMenu = noone;
global.date = ConvertDate(date_current_datetime());
global.saveSlot = 0;
global.hoveringButton = false;
global.hoveringConfigButton = false;
global.hoveringTextbox = false;
global.hoveringPlace = "";
global.map = false;
global.keyboardIcons = false;
global.textComplete = false;
global.changeCalendarDaytime = true;
global.newGame = false;
global.lastPlace = rm_init;

// Localization
global.lang = "en"; // "en", "pt"
global.localization = {}; 
global.langMenu = false;
SetLanguage();
PopulateLocali(); // See "LOCALI.gml"
ManageLocalization();

#region GAME CONTROLS
// The gamepad device (player 1)
global.GAMEPAD = 0;  

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
	_keybind[e_input.MOUSE] = new KeybindingDefinition(mb_left, mb_right, mb_middle);
	_keybind[e_input.KEYBOARD] = new KeybindingDefinition(ord("Z"), ord("X"), ord("C"), ord("W"), ord("S"), ord("A"), ord("D"));
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

// Initialize GAME_DATA script
GAME_DATA();
// ------------------------------ TESTING ZONE ---------------------------------- //
if (Debug()) {
	instance_create_layer(ORIGIN_X, ORIGIN_Y, "Controllers", DEBUG_DRAWER);
}

// Add first room here
room_goto(rm_logo);
// room_goto(rm_test);