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
			"Cutscene Debug: 4",
			"Dialogue Debug: 5",
			"Show FPS: F",
			"Room Selector: R",
			"Pause Game: P",
			"Restart Room: Home",
			"Next Room: PageUp",
			"Previous Room: PageDown",
			"End Game: End"
		];
		
		DebugDrawBox(10, 10, "INFO", info_debug_strings);
		DrawReset();
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
		var gameDebugStrings = [
			"Last click (x): " + string(clickX),
			"Last click (y): " + string(clickY),
			"mouse pos: " + "(" + string(mouse_x) + " / " + string(mouse_y) + ")",
			"mouse GUI pos: " + "(" + string(clickGuiX) + " / " + string(clickGuiY) + ")",
			"Last Font: " + string(global.lastFontUsed),
			"Toggle Pause: " + string(togglePause),
			"Game State: " + string(global.state),
			"Previous State: " + string(global.statePrevious),
			"Current input: " + string(global.inputMode),
			"Pressed Confirm (Mouse): " + string( InputCheck(e_input.MOUSE, "confirm") ),
			"Pressed Confirm (Keyboard): " + string( InputCheck(e_input.KEYBOARD, "confirm") ),
			"Current Room: " + global.rmCurrent,
			"Location string: " + global.location,
			"Resolution scale: " + string(global.res.scale),
			"Fullscreen?: " + string(global.fullscreen),
			"Transition Room Target: " + string(obj_transition.roomTarget),
			"Mid Transition?: " + string(obj_transition.midTransition),
			"Transition Sequence Inst: " + string(obj_transition.seqInst),
		];
		
		DebugDrawBox(10, 10, "GAME DEBUG", gameDebugStrings);
	}
	#endregion GAME
	
	#region LANGUAGE --- Press 2
	if (debugBooleans[e_DebugOptions.LANG]) {
		var langDebugStrings = ["Language: " + global.lang];
		
		// Language Menu
		if (instance_exists(obj_lang_menu) && instance_exists(obj_lang_selection)) {
			array_push(langDebugStrings,
			"Menu pos: " + "(" + string(obj_lang_menu.x) + " / " + string(obj_lang_menu.y) + ")",
			"Phase: " + string(obj_lang_menu.phase),
			"Button Position: " + string(obj_lang_menu.posButtons),
			"Button Selected: " + string(obj_lang_menu.selectedButton),
			"Hovering over CancelBTN: " + string(obj_lang_menu.cancelButtonIsHovering),
			"Hovering over ConfirmBTN: " + string(obj_lang_menu.confirmButtonIsHovering),
			"Selection box pos: " + "(" + string(obj_lang_selection.x) + " / " + string(obj_lang_selection.y) + ")",
			"Tween end y pos: " + string(obj_lang_selection.targetY),
			"Cancel Button selected? " + string(obj_lang_menu.cancelButton.selected),
			"Confirm Button selected? " + string(obj_lang_menu.confirmButton.selected)
			);	
		
			// Checking boundaries for the lang menu based on variables
			with(obj_lang_menu) draw_rectangle(x, y, x + width, y + height, true);
		}
		
		DebugDrawBox(10, 10, "LANGUAGE DEBUG", langDebugStrings);
	}
	#endregion LANGUAGE
	
	#region CHARACTERS --- Press 3
	if (debugBooleans[e_DebugOptions.CHARA]) {
		var charaDebugStrings = [];
		
		if (instance_exists(obj_characters)) {
			array_push(charaDebugStrings, 
				"Current sprite: " + sprite_get_name(obj_characters.chara),
				"Current expression: " + string(obj_characters.characterExpression)
			);
		}
		
		DebugDrawBox(10, 10, "CHARACTERS DEBUG", charaDebugStrings);
	}
	#endregion CHARACTERS
	
	#region CUTSCENES --- Press 4
	if (debugBooleans[e_DebugOptions.CUTSCENE]) {
		var cutsceneDebugStrings = [];
		
		if (instance_exists(obj_intro)) {
			array_push(cutsceneDebugStrings, 
				"INTRO SCENE",
				"Typist position: " + string(obj_intro.typist.get_position()),
				"Current page: " + string(obj_intro.page)
			);
		}
		if (instance_exists(obj_player_creator)) {
			array_push(cutsceneDebugStrings,
				"PLAYER CREATOR",
				"Is mouse hovering? " + string(obj_player_creator.mouseHovering),
				"Position: " + string(obj_player_creator.pos),
				"Hovered option: " + string(obj_player_creator.lastHoveredOption),
				"Option length: " + string(obj_player_creator.optionLength),
				"Current Phase: " + string(obj_player_creator.phase),
			);
		}
		
		DebugDrawBox(10, 10, "CUTSCENE DEBUG", cutsceneDebugStrings);
	}
	#endregion CUTSCENES
	
	#region DIALOGUE --- Press 5
	if (debugBooleans[e_DebugOptions.DIALOGUE]) {
		var dialogueDebugStrings = [];
		if (instance_exists(obj_node_controller)) {
			array_push(dialogueDebugStrings, 
				"Typist position: " + string(obj_node_controller.typist.get_position()),
				"Text Length: " + string(obj_node_controller.textLength)
			);
		}
		DebugDrawBox(10, 10, "DIALOGUE DEBUG", dialogueDebugStrings);
	}
	
	#endregion DIALOGUE
	
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
