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
	    active = !active;
	    global.pause = active;
	}
    
	if (active) {
			
        if (global.PRESSED_DOWN) {
            selected += 1;
            if (selected >= ds_list_size(global.rm_name_sorted)) {
                selected = 0;
            }
        }
        
        if (global.PRESSED_UP) {
            selected -= 1;
            if (selected < 0) {
                selected = ds_list_size(global.rm_name_sorted) - 1;
            }
        }
        
	        if (global.SPACE_CONFIRM) {
			    var room_name = ds_list_find_value(global.rm_name_sorted, selected);
				show_debug_message(room_name);
			    var room_index = ds_list_find_index(global.rm_name, room_name);
				show_debug_message(room_index);
				
				var target;
				if (room != room_index){
					target = room_index; 
					TransitionStart(target, sq_out_trans_fade_black, sq_in_trans_fade_black);
					// The diagonal transition is looking weird, idk why yet
					//TransitionStart(target, sq_out_trans_diag_slide, sq_in_trans_diag_slide);
					global.room_target = room_index;
					show_debug_message(global.room_target);
				}
				else{
					if instance_exists(obj_announcement) instance_destroy(obj_announcement);
					var announcement = instance_create_layer(0, 0, "Special", obj_announcement);
					announcement.text = "You're already here.";
				}
				
	        }
       
	    }
		
		// Deactivate Room Selector
		if (global.BACKSPACE_CANCEL) {
			active = false;
			menu_transition = 1;
		}
		
		// Fading
		if (active && menu_transition < 1) {
		    menu_transition += 0.1;
		} else if (!active && menu_transition > 0) {
		    menu_transition -= 0.1;
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
