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
		draw_text(posX, startY, PlayerCreatorLocalization(text[0]));

		// Display pronoun options 
		for (var i = 0; i < optionLength; i++) {
				optionText = phaseOptions[phase][i];
				
				// Draw cursor based on the last hovered option
				if (pos == i) {
					optionText = "[spr_arrows2] " + PlayerCreatorLocalization(optionText);
				}

		        draw_text_scribble(startX + 40 + (i * (rectWidth + PLAYER_CREATOR_BTN_MARGIN_H) - 5), startY + PLAYER_CREATOR_MARGIN_V + 5, PlayerCreatorLocalization(optionText));
		        DrawAlign();
		}	
	break;
	
	// Draw phase 2 options
	case e_phases.PHASE_2 : 
		
		DrawAlign(fa_center);
		draw_text(posX, startY, PlayerCreatorLocalization(text[1]));
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
				draw_sprite_ext(spr_name_line, 0, startX + 50 + 23*xx, startY + 45 + blink * 3 + textVersusLineOffset, scale, scale, 0, c_white, 1);
			} else {
				// Animated effect
				draw_set_halign(fa_center);
				draw_sprite_ext(spr_name_line, 0, startX + 50 + 23*xx, startY + 45 + textVersusLineOffset, scale, scale, 0, c_white, 1);
			}
			
			// --------------------------- Draw the text  --------------------------- //
			var nameInputText = string_upper(string_char_at(currentString, xx+1));
			
			/* if (pos == i) */ draw_text(startX + 58 + 23*xx, startY + 45, nameInputText);
			xx++;
		}
		
		// Display name options 
		var nameString;
		for (var i = 0; i < optionLength; i++) {
				nameString = phaseOptions[phase][i];
				
	        // Draw cursor based on the last hovered option
	        if (pos == i) {
	            nameString = "[spr_arrows2] " + PlayerCreatorLocalization(nameString);
	        }
	        draw_text_scribble(startX + 45 + (i * (rectWidth + PLAYER_CREATOR_BTN_MARGIN_H)), startY + PLAYER_CREATOR_MARGIN_V + 25, PlayerCreatorLocalization(nameString));
	    }   
	    break;
}
