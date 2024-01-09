/// @description 

// Reset globals
//global.playerName = "";
//global.pronouns = 0;

var optionText = "";

// Display the inquiry
draw_text(startX, startY, "Choose your " + currentInputField + ":");

// Display input field or options
if (phase == e_phases.PHASE_1 || phase == e_phases.PHASE_3) {
		var textVersusLineOffset = 5;
		var cursorLeftOffset = 15;
		// Draw name letters (we should make this block of code a function tbh)
		var xx = 0;
		for (var i = 0; i < maxLetters; i++) {
			
			// Draw the lines
			if(xx == string_length(currentString)) {
				draw_sprite_ext(spr_name_line, 0, startX + 23*xx, startY + 30 + blink * 3 + textVersusLineOffset, scale, scale, 0, c_white, 1);
			} else {
				// Animated effect
				draw_sprite_ext(spr_name_line, 0, startX + 23*xx, startY + 30 + textVersusLineOffset, scale, scale, 0, c_white, 1);
			}
			
			// Draw the text
			optionText = string_upper(string_char_at(currentString, xx+1));
				// Draw cursor
				if (pos == i) {
				draw_text(startX - cursorLeftOffset, startY + 30, ">");
				draw_text(startX + 23*xx, startY + 30, optionText);
			}
			draw_text(startX + 23*xx, startY + 30, optionText);
			xx++;
		}	
		// Confirm
		optionLength = array_length(phase1Options);
		for (var i = 1; i < optionLength; i++) {
			optionText = phase1Options[i];
			// Draw cursor
			if (pos == i) {
				optionText = "> " + optionText;
			}
			draw_text(startX, startY + 60 + i * 30, optionText);	
		}
}
	
if (phase == e_phases.PHASE_2) {
	// Display pronoun options 
	optionLength = array_length(phase2Options)
	    for (var i = 0; i < optionLength; i++) {
			optionText = phase2Options[i];
			if (pos == i) {
				// Draw cursor
		        optionText = "> " + optionText;
			}
	draw_text(startX, startY + 60 + i * 30, optionText);	
	}
}
