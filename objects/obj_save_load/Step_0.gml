/// @description Load Game

if (global.state == e_gameStates.FILE_SELECTION) {

	if (!global.midTransition) {
		
		// Logic for navigating the save slots
		if ( InputCheck("down", e_input.KEYBOARD) ) {
			if (selectedOption + 1) < maxSlots selectedOption++;
			else selectedOption = 0;
		}
		else if ( InputCheck("up", e_input.KEYBOARD) ) {
			if (selectedOption - 1) >= 0 selectedOption--;	
			else selectedOption = (maxSlots - 1);
		}

		for (var slot = 0; slot < maxSlots; slot++) {
			if (position_meeting(mouse_x, mouse_y, saveSlotArray[slot])) {
				selectedOption = slot;
				mouseSelected = true;
				break;
			}
			else mouseSelected = false;
				
			// Change subimage to match
			subimage = position_meeting(mouse_x, mouse_y, obj_save_slot);
		}

		
		// ---------------------------- CONFIRM SELECTION --------------------------- //

		if	( InputCheck("confirm", e_input.KEYBOARD) ) ||
			(InputCheck("confirm", e_input.MOUSE) && mouseSelected) {
				
			// Check for existing save slot
			global.saveSlot = selectedOption;
		
			// Existing save slot found
			if file_exists("file_" + string(global.saveSlot) + ".sav") {
				LoadGame();	
				global.state = e_gameStates.CONTINUE_GAME;
			
				// Go to last saved room
				GameTransitionChangeRoom(SetRoom(global.location), sq_trans_fade_white);
			}	
		
			// NO existing save slot found
			else {
				
				// Change Game State
				GameChangeState(e_gameStates.NEW_GAME);
			
				// Go to first cutscene
				GameTransitionChangeRoom(rm_dream, sq_trans_fade_white);
				// OBS: The room_goto() function only runs after the step event has finished
			}
		}
		// ---------------------------- DELETE SAVE FILE --------------------------- //
		// Press cancel to delete the save file
		else if ( InputCheck("cancel", e_input.KEYBOARD) ) ||
			(InputCheck("cancel", e_input.MOUSE) && mouseSelected)  {
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
}
