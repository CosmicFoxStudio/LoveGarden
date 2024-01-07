/// @description Chatterbox

// Number of options
var count = ChatterboxGetOptionCount(chatterbox);

// Typist flow control
TypistCheckPause();

if (global.state != e_gameStates.PAUSED) {
	// Waiting for user input or waiting for the user to choose an option
	if ChatterboxIsWaiting(chatterbox) {
	    if (global.PRESSED_CONFIRM || global.PRESSED_MOUSE_LEFT) {
			#region METADATA 
			var once = false;
		    var metadata = ChatterboxGetContentMetadata(chatterbox, 0);
			// If current line has metadata
			if (once == false) {
			    if (array_length(metadata) > 0) {
					// EXPRESSION - Index of the subimage (frame) of the character sprite
					if (metadata[0] != "") {
					
						// There's some fixing to do regarding expressions (probably in here?)
						CharacterExpressionOnScreen(real(metadata[0]));
						once = true;
					}
					// WILTING - Adds/removes points from the "wilting" status
			        if (metadata[1] != "") { 
						global.status.wilting = WrapInside(obj_wilting_bar.fillBar + real(metadata[1]), 0, 10); 
						obj_wilting_bar.fillBar = global.status.wilting; 
						once = true;
					}
					// GROWTH - Add/remove points from the "growth" status
			        if (metadata[2] != "") { 
						global.status.growth = WrapInside(obj_growth_bar.fillBar + real(metadata[2]), 0, 10); 
						obj_growth_bar.fillBar = global.status.growth; 
						once = true;
					}
					// BLOSSOM - Add/remove points from "blossom" status
			        if (metadata[3] != "") { 
						global.status.blossom = WrapInside(obj_blossom_bar.fillBar + real(metadata[3]), 0, 10); 
						obj_blossom_bar.fillBar = global.status.blossom; 
						once = true;
					}
					// SOM - Enter the name of the sound asset
			        if (metadata[4] != "" && metadata[4] != "0") {
						audio_play_sound(asset_get_index(metadata[4]), 10, false);
						once = true;
					}
					// FLAG - Enter the name of the flag
			        if (metadata[5] != "") {
						FlagSet(metadata[5]);
						once = true;
					}
			    }
			}
			#endregion METADATA 

	        ChatterboxContinue(chatterbox);
	        UpdateChatterbox();
	    }
	
	// If there are options to choose
	} else if count {	
		// This variable needs to be restarted on loop start (or else make it local?)
		optionHovered = -1;
	
	    // Mouse input
	    for (var i = 0; i < count; i++) {
	        var xx = room_width / 2;
	        var yy = (room_height / 6) * (i + 2) - 30;
	        var width = 450;
	        var height = 32;

	        if (point_in_rectangle(mouse_x, mouse_y, xx - width / 2, yy - height / 2, xx + width / 2, yy + height / 2)) {
	            optionHovered = i; // Records the option when hovering
				optionIndex = i; // Update optionIndex based on hovered option
			
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
	    if  (global.PRESSED_CONFIRM || (global.PRESSED_MOUSE_LEFT && optionHovered != -1)) {
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
