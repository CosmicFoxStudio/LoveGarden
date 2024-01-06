if (Debug() && global.debug == false) {
	DrawSet();
	draw_text(10, 10, "Debug Mode: Press 0");
	DrawReset();
}

if (global.debug) {
	#region INFO
	if (displayInfo) {
		var info_debug_strings = [
			"Show Grid: G",
			"Game Debug: 1",
			"Language Debug: 2",
			"Character Debug: 3", 
			"Show FPS: F",
			"Room Selector: R"
		];
		DebugDrawBox(10, 10, "INFO", info_debug_strings);
	}
	#endregion INFO
	
	#region FPS
	if (debugShowFPS) {
		// PRESS F - FPS
		show_debug_overlay(true);
		DrawSet(c_green);
		draw_text(475, 300, "FPS: " + string(fps));
		draw_text(475, 310, "Room Speed: " + string(room_speed)); // Same as FPS, I believe
		draw_text(475, 320, "Real FPS: " + string(fps_real));
		DrawReset();
	}
	else show_debug_overlay(false);
	#endregion FPS
	
	#region GAME --- Press 1
	if (debugBooleans[e_DebugOptions.GAME]) {
		draw_text(20, 10, "Last click (x): " + string(clickX));
		draw_text(20, 20, "Last click (y): " + string(clickY));
		draw_text(20, 30, "mouse pos: " + "(" + string(mouse_x) + " / " + string(mouse_y) + ")");
		draw_text(20, 40, "mouse GUI pos: " + "(" + string(clickGuiX) + " / " + string(clickGuiY) + ")");
		draw_text(20, 50, "Last Font: " + string(global.lastFontUsed));	
	}
	#endregion GAME
	
	#region LANGUAGE --- Press 2
	if (debugBooleans[e_DebugOptions.LANG]) {
		draw_text(20, 10, "LOCALIZATION DEBUG");
		draw_text(20, 20, "LANG: " + global.lang); 	
		// Language Menu
		if (instance_exists(obj_lang_menu) && instance_exists(obj_lang_selection)) {
			draw_text(20, 30, "Menu pos: " + "(" + string(obj_lang_menu.x) + " / " + string(obj_lang_menu.y) + ")");
			draw_text(20, 40, "Phase: " + string(obj_lang_menu.phase));
			draw_text(20, 50,"Button Position: " + string(obj_lang_menu.posButtons));
			draw_text(20, 60, "Button Selected: " + string(obj_lang_menu.selectedButton));
			draw_text(20, 70, "Hovering over CancelBTN: " + string(obj_lang_menu.cancelButtonIsHovering));
			draw_text(20, 80, "Hovering over ConfirmBTN: " + string(obj_lang_menu.confirmButtonIsHovering));
			draw_text(20, 90, "Selection box pos: " + "(" + string(obj_lang_selection.x) + " / " + string(obj_lang_selection.y) + ")");
			draw_text(20, 100, "target_y: " + string(obj_lang_selection.targetY));
			draw_text(20, 110, "Cancel Button selected? " + string(obj_lang_menu.cancelButton.selected));
			draw_text(20, 120, "Confirm Button selected? " + string(obj_lang_menu.confirmButton.selected));
			
			// Checking boundaries for the lang menu based on variables
			draw_rectangle(obj_lang_menu.x, obj_lang_menu.y, obj_lang_menu.x + obj_lang_menu.width, obj_lang_menu.y + obj_lang_menu.height, true);
		}
	}
	#endregion LANGUAGE
	
	#region CHARACTERS --- Press 3
	if (debugBooleans[e_DebugOptions.CHARA]) {
			draw_text(20, 10, "CHARACTER DEBUG");
		if (instance_exists(obj_characters)) {
			draw_text(20, 20, "Current sprite: " + sprite_get_name(obj_characters.chara));
			draw_text(20, 30, "Current subimg: " + string(obj_characters.characterExpression));
		}
	}
	#endregion CHARACTERS
	
	#region CUTSCENES --- Press 4
	if (debugBooleans[e_DebugOptions.CUTSCENE]) {
		if (instance_exists(obj_intro)) {
			draw_text(20, 10, "CUTSCENE DEBUG");
			with(obj_intro) {
				draw_text(20, 20, "INTRO SCENE");
				draw_text(20, 30, "Typist position: " + string(typist.get_position()));
				draw_text(20, 40, "Text length: " + string(text_length));
				draw_text(20, 50, "Fade Out State: " + string(tw_fade_out_state));
				draw_text(20, 60, "Current page: " + string(page));
			}
		}
	}
	#endregion CUTSCENES
	
	#region ROOM SELECTOR
	DrawSet(c_white, 1);
	draw_set_alpha(menuTransition);
	if (debugRmSelectorActive) {
	    var yy = 40;
		var maxLines = 6;
		var start = clamp(selected - (maxLines - 1), 0, ds_list_size(global.rmNameSorted) - maxLines);
	    for (var i = start; i < start + maxLines; i++) {
			// Check if i is a valid index for the sorted list before drawing
			if (i >= 0 && i < ds_list_size(global.rmNameSorted)) {
		        roomName = ds_list_find_value(global.rmNameSorted, i);
		        if (i == selected) {
					draw_set_color(c_fuchsia);
					// Unselectable rooms
					if (IsRoomRestricted(roomName)) {
	                    draw_set_color(c_gray);
	                }
		            draw_text(10, yy, "> " + roomName);
		        } else {
					draw_set_color(c_white);
					// Unselectable rooms
	                if (IsRoomRestricted(roomName)) {
	                    draw_set_color(c_gray);
	                }
		            draw_text(10, yy, roomName);
		        }
		        yy += 20;
			}
	    }
	}
	#endregion ROOM SELECTOR
	
	// Reset
	DrawReset();
}
