/// @description 

#region Input lines animation
if (!flash) {
	blink += 0.05;
	
	if(blink > 1) {
		flash = true;
	}
} else if (flash) {
	blink -= 0.05;
	if(blink < 0) {
		flash = false;
	}
}
#endregion Input lines animation

// Store number of options in current phase
optionLength = array_length(phaseOptions[phase]);

// Store the previous phase
var startPhase = phase;

// Handle Player's Keyboard Input 
if (phase == e_phases.PHASE_2) {
	// Before performing anything else, get the current letter count of inputted string
	letterCount = string_length(currentString);
	
	// Check for maximum letter count
	if (letterCount >= 10) maxLettersReached = true else maxLettersReached = false;
						
	// Keyboard input (only if "Write" option is selected)
	if (!maxLettersReached) {
		currentString = ReceivePlayerInput(currentString);
	}	
}

if (global.inputMode == e_input.KEYBOARD) {
	// Keyboard Input - Move through options
	pos += CheckHorizontalInput();

	// Wrap menu
	if (pos >= optionLength) pos = 0; // goes back to first pos
	if (pos < 0) pos = optionLength - 1; // goes to last pos
}

// ---------------------------- MOUSE INPUT  ---------------------------- //
if (global.inputMode == e_input.MOUSE) {
	var arr;
	// Checking the correct array
	if (phase == e_phases.PHASE_1) {
		arr = rectBtnInstArray[e_phases.PHASE_1];
	}
	else {
		arr = rectBtnInstArray[e_phases.PHASE_2];
	}
	
	// Update option length 
	optionLength = array_length(phaseOptions[phase]);
	
	var inst;
	// Loop to check if mouse is hovering any of the instances
	for (var i = 0; i < optionLength; i++) {
		inst = arr[i];
		
		// Check if mouse is hovering
		mouseHovering = instance_position(mouse_x, mouse_y, inst);
		
		// Visual effect when hovering
		// inst.image_alpha = mouseHovering ? 0.5 : 0.3;

		// ------------ CHECKING MOUSE HOVERING ------------ //
		if (mouseHovering) {
			// Assign position to mouse
			lastHoveredOption = i;
			pos = i;
			
			 // Confirm Input
			if (InputCheck(e_input.MOUSE, "confirm")) {
				
				if (phase == e_phases.PHASE_1) {
				    // Assign selected option to global
				    global.pronouns = pos;

				    // Reset position
				    pos = 0;

				    // Advance to next phase
				    phase = e_phases.PHASE_2;
				}
				else if (phase == e_phases.PHASE_2 && pos == 2) {
					// Assign to global
					global.playerName = string_upper(currentString);
			
					// Reset
					//pos = 0;
					//currentString = "";
				
					// End cutscene, advance to the next room
					obj_dream.finishedPlayer = true;
					instance_destroy();	
				}
			}
            
			break;
		}
	} // End of: For loop
}


// Action Loop
switch(phase) {
			
	// PHASE 1 - Pronouns
	case e_phases.PHASE_1 :
	
		// Keyboard Input
		if ( InputCheck(e_input.KEYBOARD, "confirm") ) {
			// Assign selected option to global
			global.pronouns = pos;
			// Reset position
			pos = 0;
			// Advance to next phase
			phase = e_phases.PHASE_2;
		}			
	break;
			
	// PHASE 2 - Name
	case e_phases.PHASE_2 : 
		
		switch (pos) {		
			// Delete
			case 0 :
				// Keyboard delete
                if (InputCheck(e_input.KEYBOARD, "confirm")) {
                    show_debug_message("Deleting");
                    
                    // Checking if there's at least one char
                    if (letterCount >= 1) {
                        currentString = string_delete(currentString, letterCount, 1);
                        audio_play_sound(snd_cant, 1, false);
                    }
                }
                
                // Mouse delete
                if (InputCheck(e_input.MOUSE, "confirm")) {
                    show_debug_message("Deleting");
                    
                    // Checking if there's at least one char
                    if (letterCount >= 1) {
                        currentString = string_delete(currentString, letterCount, 1);
                        audio_play_sound(snd_cant, 1, false);
                    }
                }
                break;
				
			// Delete All
			case 1 :
				// Keyboard delete
                if (InputCheck(e_input.KEYBOARD, "confirm")) {
                    show_debug_message("Deleting All");
                    
                    // Checking if there's at least one char
                    if (letterCount >= 1) {
                        currentString = "";
                        audio_play_sound(snd_cant, 1, false);
                    }
                }
                
                // Mouse delete
                if (InputCheck(e_input.MOUSE, "confirm")) {
                    show_debug_message("Deleting All");
                    
                    // Checking if there's at least one char
                    if (letterCount >= 1) {
                        currentString = "";
                        audio_play_sound(snd_cant, 1, false);
                    }
                }
                break;
					
			// Confirm
			case 2: 		
				if ( /*( InputCheck(e_input.MOUSE, "confirm") || */ InputCheck(e_input.KEYBOARD, "confirm") && string_length(currentString) > 0) {
					// Assign to global
					global.playerName = string_upper(currentString);
			
					// Reset
					//pos = 0;
					//currentString = "";
				
					// End cutscene, advance to the next room
					obj_dream.finishedPlayer = true;
					instance_destroy();	
				}
			break; 
					
		} // End of: switch(pos)
						
	break; // End of : case e_phases.PHASE_2 
		
} // End of : switch(phase)
	
// The phase transitions should be at the bottom to avoid conflicts
// Reset after switching phase
if (startPhase != phase) pos = 0;		
// Correct option length
optionLength = array_length(phaseOptions[phase]);
	

// Delete with cancel input (keyboard only)
if  ( (phase == e_phases.PHASE_2 && pos == 0 ) ) {
	if (InputCheck(e_input.KEYBOARD, "cancel") ) {
		if (letterCount >= 1) {
			currentString = string_delete(currentString, letterCount, 1);
			audio_play_sound(snd_cant, 1, false);
		}
	}
}

