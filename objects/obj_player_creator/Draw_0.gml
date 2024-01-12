/// @description 

// Reset globals
//global.playerName = "";
//global.pronouns = 0;

DrawSet();
var optionText = "";
var posX = room_width / 2;

switch (phase) {
	// Draw Phase 1 options
	case e_phases.PHASE_1 :
	
		DrawAlign(fa_center);
		draw_text(posX, startY, "Which one do you prefer:");

		// Display pronoun options 
		for (var i = 0; i < optionLength; i++) {
				optionText = phaseOptions[phase][i];
				
				if (global.inputMode == e_input.KEYBOARD || (global.inputMode == e_input.MOUSE && lastHoveredOption == i) ) {
					// Draw cursor based on the last hovered option
		            if (pos == i || (mouseHovering && i == lastHoveredOption)) {
		                optionText = "> " + optionText;
		            }
		        }
		        draw_text(startX + 16 + (i * (rectWidth + PLAYER_CREATOR_BTN_MARGIN_H)), startY + PLAYER_CREATOR_MARGIN_V + 2, optionText);
		        DrawAlign();
		}	
	break;
	
	// Draw phase 2 options
	case e_phases.PHASE_2 : 
		
		DrawAlign(fa_center);
		draw_text(posX, startY, "Do you have a favorite plant?");
		DrawAlign();
		
		// Display input field or options
		var textVersusLineOffset = 5;
		
		// ------------------------- DRAW NAME STRING ------------------------- //
		optionLength = array_length(phaseOptions[phase]);
		var xx = 0;
		for (var i = 0; i < maxLetters; i++) {
			
			// Draw the lines
			if(xx == string_length(currentString)) {
				draw_set_halign(fa_center);
				draw_sprite_ext(spr_name_line, 0, startX + 23*xx, startY + 40 + blink * 3 + textVersusLineOffset, scale, scale, 0, c_white, 1);
			} else {
				// Animated effect
				draw_set_halign(fa_center);
				draw_sprite_ext(spr_name_line, 0, startX + 23*xx, startY + 40 + textVersusLineOffset, scale, scale, 0, c_white, 1);
			}
			
			// --------------------------- Draw the text  --------------------------- //
			var nameInputText = string_upper(string_char_at(currentString, xx+1));
			
			/* if (pos == i) */ draw_text(startX + 23*xx, startY + 40, nameInputText);
			xx++;
		}
		
		// Display name options 
		var nameString;
		for (var i = 0; i < optionLength; i++) {
				nameString = phaseOptions[phase][i];
				
	        // Draw cursor based on the last hovered option
	        if (pos == i || (lastHoveredOption == i)) {
	            nameString = "> " + nameString;
	        }
	        draw_text(startX + 32 + (i * (rectWidth + PLAYER_CREATOR_BTN_MARGIN_H)), startY + PLAYER_CREATOR_MARGIN_V + 2, nameString);
	    }   
	    break;
}
