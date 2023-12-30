if (DEBUGGING && global.debug == false) {
	draw_text(10, 10, "Debug Mode: Press 0");
}

if (global.debug) {
	DrawSet();
	draw_set_font(fnt_dialogue);
	
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
	if (debugGlobalGame) {
		draw_text(20, 10, "Last click (x): " + string(clickX));
		draw_text(20, 20, "Last click (y): " + string(clickY));
		draw_text(20, 30, "mouse pos: " + "(" + string(mouse_x) + " / " + string(mouse_y) + ")");
		draw_text(20, 40, "mouse GUI pos: " + "(" + string(clickGuiX) + " / " + string(clickGuiY) + ")");
		draw_text(20, 50, "Directory: " + filename_dir(GM_project_filename));	
	}
	#endregion GAME
	
	#region LANGUAGE --- Press 2
	if (debugLang) {
		draw_text(20, 70, "LANG: " + global.lang); 	
		// Language Menu
		if (instance_exists(obj_lang_menu) && instance_exists(obj_lang_selection)) {
			draw_text(20, 80, "Menu pos: " + "(" + string(obj_lang_menu.x) + " / " + string(obj_lang_menu.y) + ")");
			draw_text(20, 120, "Phase: " + string(obj_lang_menu.phase));
			draw_text(20, 130, "Pressed Space: " + string(global.SPACE_CONFIRM));
			draw_text(20, 140, "Pressed Cancel: " + string(global.BACKSPACE_CANCEL));
			draw_text(20, 150,"Button Position: " + string(obj_lang_menu.posButtons));
			draw_text(20, 160, "Button Selected: " + string(obj_lang_menu.selectedButton));
			draw_text(20, 170, "Hovering over CancelBTN: " + string(obj_lang_menu.cancelButtonIsHovering));
			draw_text(20, 180, "Hovering over ConfirmBTN: " + string(obj_lang_menu.confirmButtonIsHovering));
			draw_text(20, 190, "Selection box pos: " + "(" + string(obj_lang_selection.x) + " / " + string(obj_lang_selection.y) + ")");
			draw_text(20, 200, "target_y: " + string(obj_lang_selection.targetY));
			draw_text(20, 210, "Cancel Button selected? " + string(obj_lang_menu.cancelButton.selected));
			draw_text(20, 220, "Confirm Button selected? " + string(obj_lang_menu.confirmButton.selected));
			
			// Checking boundaries for the lang menu based on variables
			draw_rectangle(obj_lang_menu.x, obj_lang_menu.y, obj_lang_menu.x + obj_lang_menu.width, obj_lang_menu.y + obj_lang_menu.height, true);
		}
	}
	#endregion LANGUAGE
	
	#region CHARACTERS --- Press 3
	if (debugChara) {
		if (instance_exists(obj_characters)) {
			draw_text(20, 60, "Current sprite: " + sprite_get_name(obj_characters.chara));
			draw_text(20, 70, "Current subimg: " + string(obj_characters.characterExpression));
		}
	}
	#endregion CHARACTERS
	
	// Reset
	DrawReset();
}
