/// @description Chatterbox

// Number of options
var count = ChatterboxGetOptionCount(chatterbox);

// Typist flow control
TypistCheckPause();

// Fast-forwarding
/*
if (InputCheck("confirm", e_input.MOUSE, "held")) {
	ChatterboxFastForward(chatterbox);
}
*/

if (global.state != e_gameStates.PAUSED && global.state != e_gameStates.MENU && global.hoveringButton == false) {
	// Waiting for user input or waiting for the user to choose an option
	if (ChatterboxIsWaiting(chatterbox)) {
	    if ((InputCheck("confirm", e_input.KEYBOARD) && global.keyboardIcons == false) || (InputCheck("confirm", e_input.MOUSE) && global.hoveringTextbox == true)) {
			// Debug text
			//show_debug_message(text);
			
			//  ------------------- SKIP TEXT ------------------- //
			// Means the page is fully typed out
			if ((typist.get_position() - 1) == textLength) {
				ChatterboxContinue(chatterbox);
				// Advance to next dialogue line
				UpdateChatterbox();
			}
			else {
				// Typist auto-complete
				if (typist.get_position() < textLength) {
					typist.skip();
				}				
			}
	    }
	
	// If there are options to choose
	} else if count {	
		// This variable needs to be restarted on loop start (or else make it local?)
		optionHovered = -1;
	
	    // Mouse input
		for (var _i = 0; _i < count; _i++) {
		    var xx = room_width / 2;
		    var yy = (room_height / 6) * (_i + 2) - 30;
		    var width = 450;
		    var height = 32;

		    if (point_in_rectangle(mouse_x, mouse_y, xx - width / 2, yy - height / 2, xx + width / 2, yy + height / 2)) {
		        optionHovered = _i; // Records the option when hovering
				optionIndex = _i; // Update optionIndex based on hovered option
			
				// Found a selected option, exits the loop
				break;
		    }
			else {
				optionHovered = -1;	
			}
		}

		// Keyboard input
		var key = CheckVerticalInput();
		repeat(1 + (ChatterboxGetOptionConditionBool(chatterbox, Wrap(optionIndex + key, 0, count - 1)) == false)) {
			optionIndex = Wrap(optionIndex + key, 0, count - 1);
		}
	
	    // Option confirmation
	    if  (InputCheck("confirm", e_input.MOUSE) && optionHovered != -1) ||
			( InputCheck("confirm", e_input.KEYBOARD) ) {
	        ChatterboxSelect(chatterbox, optionIndex);
	        audio_play_sound(snd_option_beep, 0, false, 1, 0, random_range(0.8, 1.2));
		
	        optionIndex = 0;
	        UpdateChatterbox();
	    }
	}
}

// End of chatterbox
if ChatterboxIsStopped(chatterbox) {
    instance_destroy();
}
