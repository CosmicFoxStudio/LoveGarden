/// @description Load Game

if (global.state == e_gameStates.FILE_SELECTION) {

if (!global.midTransition) {
	// Logic for navigating the save slots
	if (global.PRESSED_DOWN) {
		if (selectedOption + 1) < maxSlots selectedOption++;
		else selectedOption = 0;
	}
	else if (global.PRESSED_UP) {
		if (selectedOption - 1) >= 0 selectedOption--;	
		else selectedOption = (maxSlots - 1);
	}
	else if (global.PRESSED_CONFIRM) {
		// Check for existing save slot
		global.saveSlot = selectedOption;
		
		// Existing save slot found
		if file_exists("file_" + string(global.saveSlot) + ".sav") {
			LoadGame();	
			global.state = e_gameStates.CONTINUE_GAME;
			
			// Go to last saved room
			TransitionStart(sq_out_trans_fade_white, sq_in_trans_fade_white, rm_dormroom);
		}	
		else {
			// NO existing save slot found
			// Create save slot (by saving to it) [This is done inside End Step]
			global.state = e_gameStates.NEW_GAME;
			
			// Go to first cutscene
			TransitionStart(sq_out_trans_fade_white, sq_in_trans_fade_white, rm_dream);
			// OBS: The room_goto() function only runs after the step event has finished
		}
	}
	// ---------------------------- DELETE SAVE FILE --------------------------- //
	// Press cancel to delete the save file
	else if (global.PRESSED_CANCEL) {
		global.saveSlot = selectedOption;
		
		// Delete the file
		if file_exists("file_" + string(global.saveSlot) + ".sav") {
			file_delete("file_" + string(global.saveSlot) + ".sav");	
		}
		
		// Delete the display stats file (name / level / money)
		if file_exists("save_stats_" + string(global.saveSlot) + ".sav") {
			file_delete("save_stats_" + string(global.saveSlot) + ".sav"); 	
		}
	}
} // End of: if (!global.midTransition) 
	
	// Update sprite image index (for save slots that have a save file)
	spriteImage += 0.1;
	if (spriteImage > sprite_get_number(spr_sprout)) spriteImage = 0;
}
