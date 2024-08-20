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
			if (file_exists(global.saveFileName + "_" + string(global.saveSlot) + ".sav") && !global.newGame) {
				LoadGame();	
				global.state = e_gameStates.CONTINUE_GAME;
			
				// Go to last saved room
				GameTransitionChangeRoom(SetRoom(global.location), sq_trans_fade_white);
			}	
		
			// NO existing save slot found
			else if (global.newGame && !file_exists(global.saveFileName + "_" + string(global.saveSlot) + ".sav")) {
				
				// Change Game State
				GameChangeState(e_gameStates.NEW_GAME);
			
				// Start the game from first scene
				GameTransitionChangeRoom(rm_dream, sq_trans_fade_black);
			/*
			// Go to Lang Selection
			if (file_exists(global.saveFileName + "_" + string(global.saveSlot) + ".sav")) GameTransitionChangeRoom(rm_dream, sq_trans_fade_black);
			else GameTransitionChangeRoom(rm_lang, sq_trans_fade_black);
			*/
			}
		}
		// ---------------------------- DELETE SAVE FILE --------------------------- //
		// Press cancel to delete the save file
		else if ( InputCheck("cancel", e_input.KEYBOARD) && global.newGame ) ||
			(InputCheck("cancel", e_input.MOUSE) && mouseSelected && global.newGame )  {
			global.saveSlot = selectedOption;
		
			// Delete the file
			if file_exists(global.saveFileName + "_" + string(global.saveSlot) + ".sav") {
				file_delete(global.saveFileName + "_" + string(global.saveSlot) + ".sav");	
			}
		
			// Delete the display stats file (name / level / money)
			if file_exists("info_" + string(global.saveSlot) + ".sav") {
				file_delete("info_" + string(global.saveSlot) + ".sav"); 	
			}
		}
	} // End of: if (!global.midTransition) 
}
