/// @description 

// Little animation in the input lines
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

if (phase == e_phases.PHASE_1) currentInputField = "name";
if (phase == e_phases.PHASE_2) currentInputField = "pronouns";
if (phase == e_phases.PHASE_3) currentInputField = "favorite place";

// Keyboard Input - Move through options
pos += CheckVerticalInput();

// Wrap menu
if (pos >= optionLength) pos = 0; // goes back to first pos
if (pos < 0) pos = optionLength - 1; // goes to last pos

//  PHASE 1 & PHASE 3
if (phase == e_phases.PHASE_1 || phase == e_phases.PHASE_3) {
	letterCount = string_length(currentString);
	
	// Check for maximum letter count
	if (letterCount >= 10) {
		maxLettersReached = true;
	} else {
		maxLettersReached = false;
	}
	
	// Keyboard input
	if (!maxLettersReached) {
		if (keyboard_lastkey != -1) {
		    var pressedChar = keyboard_lastchar;
    
		    // Check if the pressed key's character is a valid letter (A-Z, counting uppercase and lowercase)
			//  string(ord()) returns the ASCII value of the char
			// Allowed chars: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
			var charCode = string(ord(pressedChar));
			if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)) {
			        currentString += pressedChar;
			}
    
			// Reset
		    keyboard_lastkey = -1;
			keyboard_lastchar = "";
		}
	}
	
	if ( InputCheck(e_input.KEYBOARD, "confirm") ) {	
		// Delete
		if (pos == 0) {
			//show_debug_message("Erased");
			// Make string empty again
			if (letterCount >= 1) {
				currentString = "";
				audio_play_sound(snd_cant, 1, false);
			}
		}
	
		// Confirm
		if (pos == 1 && string_length(currentString) > 0) {
			if (phase == e_phases.PHASE_1) {
				// Assign to global
				global.playerName = string_upper(currentString);
			
				// Reset position
				pos = 0;
				
				// End of phase flag
				endPhase1 = true;
				currentString = "";
			}		
			// It's PHASE 3, job is done
			else {
				// Assign to global
				global.favePlace = currentString;
				
				// End cutscene, advance to the next room
				obj_dream.finishedPlayer = true;
				instance_destroy();	
			}
		}
	}
}

// PHASE 2
if (phase == e_phases.PHASE_2) {
	optionLength = array_length(phase2Options);
	
	if ( InputCheck(e_input.KEYBOARD, "confirm") ) {
		switch(phase2Options[pos]) {
			case "They" :
				currentPronouns = e_pronouns.ELU;
			break;
			case "She" :
				currentPronouns = e_pronouns.ELA;
			break;
			case "He" :
				currentPronouns = e_pronouns.ELE;
			break;
		}	
		
		// Assign to global
		global.pronouns = currentPronouns;
		
		// Reset position
		pos = 0;
		
		// End of phase flag
		endPhase2 = true;
	}
}

// The phase transitions should be at the bottom to avoid conflicts
if ( InputCheck(e_input.KEYBOARD, "confirm") && 
(phase == e_phases.PHASE_1 || phase == e_phases.PHASE_2) ) {
    // Transition to the next phase based on the current phase
    if (phase == e_phases.PHASE_1 && endPhase1) {
        phase = e_phases.PHASE_2;
    } else if (phase == e_phases.PHASE_2 && endPhase2) {
        phase = e_phases.PHASE_3;
    }
}
