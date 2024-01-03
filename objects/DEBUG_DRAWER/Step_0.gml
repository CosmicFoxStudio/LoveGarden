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
		debugShowInfo = displayInfo;
		
		// PRESS F
		if keyboard_check_pressed(ord("F")){
			debugShowFPS = !debugShowFPS;
		}

		// PRESS 1 - Global Game Debug
		else if keyboard_check_pressed(ord("1")){
			debugGlobalGame = !debugGlobalGame;
		}
	
		// PRESS 2 - Language Debug
		else if keyboard_check_pressed(ord("2")){
			debugLang = !debugLang;
		}
		
		// PRESS 3 - Character Debug
		else if keyboard_check_pressed(ord("3")){
			debugChara = !debugChara;
		}
		
		if (debugShowFPS || debugGlobalGame || debugLang || debugChara || debugRmSelectorActive) {
			displayInfo = false;
		}
		else {
			displayInfo = true;	
		}
		
	#endregion BOOLEANS

	#region MISC DEBUG
	
		// Press End - Exit game
		if (keyboard_check_pressed(vk_end) && !global.midTransition) {
			game_end();
		}
	
		// PRESS Home - Restart current room
		if (keyboard_check_pressed(vk_home) && !global.midTransition) { 
			var target = room;
			TransitionStart(target, sq_out_trans_fade_black, sq_in_trans_fade_black);
		}
	
		// PRESS PageUp - Going to next room
		if (keyboard_check_pressed(vk_pageup) && !global.midTransition) { 
			var target = room_next(room);
			TransitionStart(target, sq_out_trans_fade_black, sq_in_trans_fade_black);
		}
	
		// PRESS PageDown - Going to previous room
		if (keyboard_check_pressed(vk_pagedown) && !global.midTransition) {
			var target = room_previous(room);
			TransitionStart(target, sq_out_trans_fade_black, sq_in_trans_fade_black);
		}
	
	#endregion MISC DEBUG
	
	#region ROOM SELECTOR

	if keyboard_check_pressed(ord("R")) {
	    debugRmSelectorActive = !debugRmSelectorActive;
	    global.pause = debugRmSelectorActive;
	}
    
	if (debugRmSelectorActive) {
			
        if (global.PRESSED_DOWN) {
            selected += 1;
            if (selected >= ds_list_size(global.rmNameSorted)) {
                selected = 0;
            }
        }
        
        if (global.PRESSED_UP) {
            selected -= 1;
            if (selected < 0) {
                selected = ds_list_size(global.rmNameSorted) - 1;
            }
        }
        
	        if (global.SPACE_CONFIRM) {
			    roomName = ds_list_find_value(global.rmNameSorted, selected);
				show_debug_message(roomName);
			    roomIndex = ds_list_find_index(global.rmName, roomName);
				show_debug_message(roomIndex);
				
				var target;
				if (room != roomIndex){
					target = roomIndex; 
					TransitionStart(target, sq_out_trans_fade_black, sq_in_trans_fade_black);
					// The diagonal transition is looking weird, idk why yet
					//TransitionStart(target, sq_out_trans_diag_slide, sq_in_trans_diag_slide);
					show_debug_message(global.roomTarget);
				}
				else {
					if instance_exists(obj_announcement) instance_destroy(obj_announcement);
					var announcement = instance_create_layer(0, 0, "Special", obj_announcement);
					announcement.text = "You're already here.";
				}
	        }  
	    }
		
		// Deactivate Room Selector
		if (global.BACKSPACE_CANCEL) {
			debugRmSelectorActive = false;
			menuTransition = 1;
			global.pause = false;
		}
		
		// Fading
		if (debugRmSelectorActive && menuTransition < 1) {
		    menuTransition += 0.1;
		} else if (!debugRmSelectorActive && menuTransition > 0) {
		    menuTransition -= 0.1;
		}
	
	#endregion ROOM SELECTOR

}
else {
	// Reset debug configs
	show_debug_overlay(false);
	debugShowFPS			= false;
	debugGlobalGame			= false;
	debugLang				= false;
	debugChara				= false;
}
