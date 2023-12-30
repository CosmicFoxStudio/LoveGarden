// Toggle debug
if Debug() {
	if (keyboard_check_pressed(ord("0"))) {
		global.debug = !global.debug;
	}
}
else exit;

if (global.debug) {
	
	//------------------- MOUSE ---------------------//
	if mouse_check_button_pressed(mb_left) {
		clickX = mouse_x;
		clickY = mouse_y;
	}

	// Converts mouse room coordinates to mouse GUI coordinates
	clickGuiX = device_mouse_x_to_gui(0);
	clickGuiY = device_mouse_y_to_gui(0);

	#region BOOLEANS
	
		// PRESS F
		if keyboard_check_pressed(ord("F")){
			debugShowFPS = !debugShowFPS;
		}

		// PRESS 1 - Global Game Debug
		if keyboard_check_pressed(ord("1")){
			debugGlobalGame = !debugGlobalGame;
		}
	
		// PRESS 2 - Language Debug
		if keyboard_check_pressed(ord("2")){
			debugLang = !debugLang;
		}
		
		// PRESS 3 - Character Debug
		if keyboard_check_pressed(ord("3")){
			debugChara = !debugChara;
		}
		
	#endregion BOOLEANS

	#region MISC DEBUG
	
		// Press End - Exit game
		if (keyboard_check_pressed(vk_end)) { // && !global.midTransition
			game_end();
		}
	
		// PRESS Home - Restart current room
		if (keyboard_check_pressed(vk_home)) { // && !global.midTransition
			var target = room;
			//transitionStart(target, sq_out_trans_fade, sq_in_trans_fade);
			//room_restart();
		}
	
		// PRESS PageUp - Going to next room
		if (keyboard_check_pressed(vk_pageup)) { // && !global.midTransition
			var target = room_next(room);
			//transitionStart(target, sq_out_trans_fade, sq_in_trans_fade);
		}
	
		// PRESS PageDown - Going to previous room
		if (keyboard_check_pressed(vk_pagedown)) { // && !global.midTransition
			var target = room_previous(room);
			//transitionStart(target, sq_out_trans_fade, sq_in_trans_fade);
		}
	
	#endregion MISC DEBUG
}
else {
	// Reset debug configs
	show_debug_overlay(false);
	debugShowFPS			= false;
	debugGlobalGame			= false;
	debugLang				= false;
	debugChara				= false;
}
