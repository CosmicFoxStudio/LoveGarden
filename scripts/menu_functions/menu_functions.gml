// Title menu config submenu and context menu functions 

// Context Config Menu Toggle Activation / Deactivation
function ToggleContextMenu(_condition = true) {
	if (_condition) {
		// ACTIVATION
		if (global.configMenu == false) {
			global.configMenu = true;
			GameChangeState(e_gameStates.MENU);
			return "Activated";
		}
		// DEACTIVATION
		else if (global.configMenu == true) {
			global.configMenu = false;
			GameChangeState(e_gameStates.CONTINUE_GAME);
			return "Deactivated";
		}
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

function ChangeResolution(_scale) {
	switch(_scale) {
		case 0: // 640x360
			global.isResizing = true;
			global.res.scale = 1;
			
			global.view_width = global.res.width * global.res.scale;
			global.view_height = global.res.height * global.res.scale;

			window_set_size(global.view_width, global.view_height);
			surface_resize(application_surface, global.view_width, global.view_height);
			
			//display_set_gui_size(global.view_width, global.view_height);
			//camera_set_view_size(view_camera[0], global.view_width, global.view_height);
			
			//Center window
			var _display_width = display_get_width();
			var _display_height = display_get_height();

			window_set_position(
				_display_width 	/ 2 - global.view_width		/ 2,
				_display_height	/ 2 - global.view_height	/ 2
			);
			global.isResizing = false;
		break;
		
		case 1: // 1280x720
			global.isResizing = true;
			global.res.scale = 2;
			
			global.view_width = global.res.width * global.res.scale;
			global.view_height = global.res.height * global.res.scale;
			
			window_set_size(global.view_width, global.view_height);
			surface_resize(application_surface, global.view_width, global.view_height);
			
			//display_set_gui_size(global.view_width, global.view_height);
			//camera_set_view_size(view_camera[0], global.view_width, global.view_height);
			
			//Center window
			var _display_width = display_get_width();
			var _display_height = display_get_height();

			window_set_position(
				_display_width 	/ 2 - global.view_width		/ 2,
				_display_height	/ 2 - global.view_height	/ 2
			);
			global.isResizing = false;
		break;
	}
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
