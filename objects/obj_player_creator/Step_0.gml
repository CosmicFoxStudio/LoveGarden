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

// Check for keyboard input in PHASE 1
if (phase == e_phases.PHASE_1 || phase == e_phases.PHASE_3) {
	letterCount = string_length(currentString);
	
	// Check for maximum letter count
	if (letterCount >= 10) {
		maxLettersReached = true;
	} else {
		maxLettersReached = false;
	}
	
	if (pos == 0 && !maxLettersReached) {
		// Add keyboard input
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
		
	// Erase
	if (pos == 1 && global.PRESSED_CONFIRM) {
		//show_debug_message("Erased");
		// Check there's at least 1 letter in the name, and if so, delete it
		if (letterCount >= 1) {
			currentString = string_delete(currentString, letterCount, 1);
			audio_play_sound(snd_cant, 1, false);
		}
	}
}


// Advance through phases / Switch to the next input field 
if (global.PRESSED_CONFIRM) {
    // Add input to globals
	switch (phase) {
        case e_phases.PHASE_1 :
			if (pos == 2) { // Selecting "Confirm"
				// Reset position
				pos = 0;
				global.playerName = string_upper(currentString);
				phase = e_phases.PHASE_2;
			}
            break;
        case e_phases.PHASE_2 : 
			if (pos == 3) {
				// Reset position
				pos = 0;
				global.pronouns = phase2Options[pos];
				phase = e_phases.PHASE_3;
			}
            break;
        case e_phases.PHASE_3 : 
			if (pos == 2) {
				// Reset position
				pos = 0;
				// End cutscene, advance to the next room
				obj_dream.finishedPlayer = true;
			}
            // Job done
            instance_destroy();
            break;
    }
}
