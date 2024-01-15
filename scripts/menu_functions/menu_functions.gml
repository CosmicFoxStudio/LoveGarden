// Title menu config submenu and context menu functions 

// Config Menu Toggle Activation / Deactivation
function ToggleContextMenu(_condition = true) {
	if (_condition) {
		// ACTIVATION - Menu doesn't exist, create it
		if ((!instance_exists(global.configMenu))) {
			global.configMenu = instance_create_layer(0, 0, "Special", obj_config_menu);
			//TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black);
			GameChangeState(e_gameStates.MENU);
			global.inputMode = e_input.KEYBOARD; 
			return show_debug_message("Config menu activated.");
		}
		// DEACTIVATION - Menu already exists, destroy it
		else if (instance_exists(global.configMenu)) {
			// Destroy the instance stored in the global. Menu is ready to be called again
			instance_destroy(global.configMenu);
			//TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black);
			
			GameChangeState(e_gameStates.CONTINUE_GAME);
			global.inputMode = e_input.MOUSE; 
			return show_debug_message("Config menu deactivated.");
		}
	}
	else {
		// Menu doesn't activate
	}
}

function ResumeGame() {
	ToggleContextMenu();
}

function ExitGame() {
	game_end();
}

function ChangeVolume(_new_volume){
	var type = menuOption[page];

	switch(type){
		case 0: audio_master_gain(_new_volume); break;
		case 1: audio_group_set_gain(audiogroup_sfx, _new_volume, 0); break;
		case 2: audio_group_set_gain(audiogroup_music, _new_volume, 0); break;
	}

show_debug_message("changed volume to " + string(_new_volume));
}

function DecideResolutionBasedOnOption(_option) {
	var resolution;
	switch (_option) {
		case 0: resolution = 1; break;
		case 1: resolution = 2; break;
		case 2: resolution = 3; break;
		default: resolution = 1; break;
	}	
	
	return resolution;
}

// Just used to initialize the shifter at the right option in config menu
function DecideOptionBasedOnResolution(_resolution) {
	var option;
	switch (_resolution) {
		case 1: option = 0; break;
		case 2: option = 1; break;
		case 3: option = 2; break;
		default: option = 0; break;
	}	
	
	return option;
}

function ChangeResolution(_option) {
	global.isResizing = true;

	// Will return the desired new resolution struct
	/*
		So, if the resolution scale was initially set to 1 (640x360)
		And the new resolution chosen is scale 2 (1280x720),
		global.res.scale is now 2, global.res width is now 1280
	*/
	
	// Set new scale
	var newResolution = DecideResolutionBasedOnOption(_option);
	global.res.scale = newResolution;
	
	// Resizing
    global.viewWidth = global.res.width * global.res.scale;
    global.viewHeight = global.res.height * global.res.scale;
	
    window_set_size(global.viewWidth, global.viewHeight);
    surface_resize(application_surface, global.viewWidth, global.viewHeight);
	
	//display_set_gui_size(global.viewWidth, global.viewHeight);
	//camera_set_view_size(view_camera[0], global.viewWidth, global.viewHeight);
			
    // Center window
    var _display_width = display_get_width();
    var _display_height = display_get_height();
	
    window_set_position(_display_width/2 - global.viewWidth/2, _display_height/2 - global.viewHeight/2);
    
    global.isResizing = false;
}

function Fullscreen(_fullscreen) {

	switch(_fullscreen) {
		case false: 
			window_set_fullscreen(false);
			global.fullscreen = false;
		break;
		
		case true: 
			window_set_fullscreen(true);
			global.fullscreen = true;
		break;
	}
}
