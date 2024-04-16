/// @description Create Config Submenu

// Constructor to create a menu element struct.
/// @function						DefineMenuElement(_text, _type, _action, _param1 = -1, _param2 = -1)
/// @description					Function to create a menu element
/// @arg {string}	_text			The title of the option
/// @arg {real}		_type			The type of script to run (check enumerator e_menuElementType)
/// @arg {function}	_action			The action (function) that should be performed
/// @arg {any}		[_param1]		1st parameter of the action to perform. Usually a value
/// @arg {any}		[_param2]		2nd parameter of the action to perform. Usually an array of options
function DefineMenuElement(_text, _type, _action, _param1 = -1, _param2 = -1) constructor { 
    text = _text;
    type = _type;
    action = _action;
    param1 = _param1; // (value)
    param2 = _param2; // (options)
};

#region CREATE MENU ELEMENTS
// MAIN PAGE [0]
menu_page_main_elements[0]		= new DefineMenuElement(MenuLocalization("RESUME"),		    e_menuElementType.SCRIPT_RUNNER,	ResumeGame);
menu_page_main_elements[1]		= new DefineMenuElement(MenuLocalization("SETTINGS"),		e_menuElementType.PAGE_CHANGE,		e_MenuPage.SETTINGS);
menu_page_main_elements[2]		= new DefineMenuElement(MenuLocalization("MENU"),			e_menuElementType.SCRIPT_RUNNER,	BackToTitle);

//SETTINGS PAGE [1]
menu_page_settings_elements[0]	= new DefineMenuElement(MenuLocalization("AUDIO"),		    e_menuElementType.PAGE_CHANGE,		e_MenuPage.AUDIO);
menu_page_settings_elements[1]	= new DefineMenuElement(MenuLocalization("GRAPHICS"),		e_menuElementType.PAGE_CHANGE,		e_MenuPage.GRAPHICS);
menu_page_settings_elements[2]	= new DefineMenuElement(MenuLocalization("BACK"),			e_menuElementType.PAGE_CHANGE,		e_MenuPage.MAIN);
//menu_page_settings_elements[3]	= new DefineMenuElement("CONTROLS",		                    e_menuElementType.PAGE_CHANGE,		e_MenuPage.CONTROLS);


// AUDIO PAGE [2]
menu_page_audio_elements[0]		= new DefineMenuElement(MenuLocalization("MASTER"),		e_menuElementType.SLIDER,			ChangeVolume,				1,	[0,1]);
menu_page_audio_elements[1]		= new DefineMenuElement(MenuLocalization("SOUNDS"),		e_menuElementType.SLIDER,			ChangeVolume,				1,	[0,1]);
menu_page_audio_elements[2]		= new DefineMenuElement(MenuLocalization("MUSIC"),		e_menuElementType.SLIDER,			ChangeVolume,				1,	[0,1]);
menu_page_audio_elements[3]		= new DefineMenuElement(MenuLocalization("BACK"),		e_menuElementType.PAGE_CHANGE,		e_MenuPage.SETTINGS);

// GRAPHICS PAGE [3]
var resolutionValue = DecideOptionBasedOnResolution(global.res.scale);
menu_page_graphics_elements[0]	= new DefineMenuElement(MenuLocalization("RESOLUTION"),	e_menuElementType.SHIFT,			ChangeResolution,			resolutionValue, ["640 x 480", "1280 x 720", "1920 x 1080"]);
menu_page_graphics_elements[1]	= new DefineMenuElement(MenuLocalization("FULLSCREEN"),	e_menuElementType.TOGGLE,			Fullscreen,					global.fullscreen, ["FULLSCREEN", "WINDOWED"]);
menu_page_graphics_elements[2]	= new DefineMenuElement(MenuLocalization("BACK"),		e_menuElementType.PAGE_CHANGE,		e_MenuPage.SETTINGS);
#endregion CREATE MENU ELEMENTS

// Variable used to access different pages
page = 0; // Starting at 0 so the default page is the main page

// Menu pages array
menuPages = [
	menu_page_main_elements,		// 0
	menu_page_settings_elements,	// 1 
	menu_page_audio_elements,		// 2
	menu_page_graphics_elements,	// 3
//	menu_page_controls_elements		// 4 (for changing input between mouse and keyboard)
];

// Create rectangle hitboxes
rectBtnInstArray[0] = []; // Main Page
rectBtnInstArray[1] = []; // Settingss Page
rectBtnInstArray[2] = []; // Audio Page
rectBtnInstArray[3] = []; // Graphics Page
rectBtnInstArray[4] = []; // Controls Page

/*
How to access
menuPages[0]		// MAIN PAGE ELEMENTS
menuPages[0][0]		// RESUME OPTION
menuPages[1]		// SETTINGS PAGE ELEMENTS
menuPages[1][0]		// AUDIO PAGE ELEMENTS
And so on
*/

// menuOption is another array and represents the selected option inside each submenu
menuOption = [];

// Loop through the number of pages we have in menuPages and update it depending on how many options there are in each page
var i = 0, array_len = array_length(menuPages); 
repeat(array_len) {
	// Selection will always be the first option on creation
	menuOption[i] = 0;
	i++;
}

// When inputting is true, it means the selection was made and we can start changing settings
inputting = false;
mouseHovering = false;

// Creating buttons for mouse input to register

// Main Page Options
for ( var i = 0; i < array_length(menuPages[0]); i++ ) {
	var inst = instance_create_layer(SCREEN_WIDTH/2 - 130, (SCREEN_HEIGHT/2) - 47 + i * 24, "Controllers", obj_rect_config);
	inst.image_alpha = 0; // 0.3 for debug
	array_push(rectBtnInstArray[0], inst);
}

// Settings Page Options
for ( var i = 0; i < array_length(menuPages[1]); i++ ) {
	var inst = instance_create_layer(SCREEN_WIDTH/2 - 130, (SCREEN_HEIGHT/2) - 47 + i * 24, "Controllers", obj_rect_config);
	inst.image_alpha = 0; // 0.3 for debug
	array_push(rectBtnInstArray[1], inst);
}

// Audio Page Options
for ( var i = 0; i < array_length(menuPages[2]); i++ ) {
	var inst = instance_create_layer(SCREEN_WIDTH/2 - 130, (SCREEN_HEIGHT/2) - 47 + i * 24, "Controllers", obj_rect_config);
	inst.image_alpha = 0; // 0.3 for debug
	array_push(rectBtnInstArray[2], inst);
}

// Graphics Page Options
for ( var i = 0; i < array_length(menuPages[3]); i++ ) {
	var inst = instance_create_layer(SCREEN_WIDTH/2 - 130, (SCREEN_HEIGHT/2) - 47 + i * 24, "Controllers", obj_rect_config);
	inst.image_alpha = 0; // 0.3 for debug
	array_push(rectBtnInstArray[3], inst);
}

mouse_prev_x = 0;