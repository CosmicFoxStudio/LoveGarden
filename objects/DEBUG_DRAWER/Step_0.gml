// Toggle debug
if Debug() {
	if (keyboard_check_pressed(ord("0"))) {
		global.debug = !global.debug;
	}
}
else exit;

if (global.debug) {
	
	// Debug Background Index
	if (global.debug && keyboard_check_pressed(ord("B"))) {
		DebugBgIndex();
	}
	// Debug Transition
	DebugTransition();
	
	// Debug Pause State
	DebugPauseState();
	
	//------------------- MOUSE ---------------------//
	if mouse_check_button_pressed(mb_left) {
		clickX = mouse_x;
		clickY = mouse_y;
	}

	// Converts mouse room coordinates to mouse GUI coordinates
	clickGuiX = device_mouse_x_to_gui(0);
	clickGuiY = device_mouse_y_to_gui(0);

	// PRESS F
	if keyboard_check_pressed(ord("F")){
		debugShowFPS = !debugShowFPS;
	}

	#region BOOLEANS

	for (var i = 0; i < array_length(debugBooleans); i++) {
	    if (keyboard_check_pressed(ord(string(i + 1)))) {
		/*
			PRESS 1 - Game Debug
			PRESS 2 - Language Debug
			PRESS 3 - Character Debug
			PRESS 4 - Cutscene Debug
		*/
	        debugBooleans[i] = !debugBooleans[i];
	    }
	}

	// Custom function to check if any element in the array is true
	if (debugRmSelectorActive || array_any(debugBooleans, function (val) { return val; })) {
	    displayInfo = false;
	} else {
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
			GameTransitionChangeRoom(target, sq_trans_fade_black);
		}
	
		// PRESS PageUp - Going to next room
		if (keyboard_check_pressed(vk_pageup) && !global.midTransition) { 
			var target = room_next(room);
			GameTransitionChangeRoom(target, sq_trans_fade_black);
		}
	
		// PRESS PageDown - Going to previous room
		if (keyboard_check_pressed(vk_pagedown) && !global.midTransition) {
			var target = room_previous(room);
			GameTransitionChangeRoom(target, sq_trans_fade_black);
		}
	
	#endregion MISC DEBUG
	
	#region ROOM SELECTOR

	if (keyboard_check_pressed(ord("R"))) {
		if (debugRmSelectorActive == false) {
			debugRmSelectorActive = true;
			GameChangeState(e_gameStates.PAUSED);
		}
		else if (debugRmSelectorActive == true) {
			debugRmSelectorActive = false;
			GameChangeState(global.statePrevious);
		}
	}
	
	// Pause other input if Room Selector is active
	if (debugRmSelectorActive) {

        if ( keyboard_check_pressed(vk_down) ) {
            selected += 1;
            if (selected >= ds_list_size(global.rmNameSorted)) {
                selected = 0;
            }
        }
        
        if ( keyboard_check_pressed(vk_up) ) {
            selected -= 1;
            if (selected < 0) {
                selected = ds_list_size(global.rmNameSorted) - 1;
            }
        }
        
	        if ( keyboard_check_pressed(vk_space) ) {
			    roomName = ds_list_find_value(global.rmNameSorted, selected);
				show_debug_message(roomName);
			    roomIndex = ds_list_find_index(global.rmName, roomName);
				show_debug_message(roomIndex);
				
				if (!IsRoomRestricted(roomName)) {
					var target;
					if (room != roomIndex){
						target = roomIndex; 
						GameTransitionChangeRoom(target, sq_trans_fade_black);
						//show_debug_message(global.roomTarget);
					}
					else {
						// Prohibit access to the same room
						MakeAnnouncement("You're already here.");
					}
				}
				else {
					// Prohibit access to restricted rooms
					MakeAnnouncement("Trying to teleport to restricted room.");
				}
	        }  
			
			// Deactivate Room Selector
			if ( keyboard_check_pressed(vk_backspace) ) {
				// Goes back to last game state
				GameChangeState(global.statePrevious);
				debugRmSelectorActive = false;
				menuTransition = 1;
			}
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
	// Reset debug overlay
	show_debug_overlay(false);
}
