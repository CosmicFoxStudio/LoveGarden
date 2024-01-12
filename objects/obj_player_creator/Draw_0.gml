/// @description 

// Reset globals
//global.playerName = "";
//global.pronouns = 0;

var optionText = "";

// Display the inquiry
draw_set_halign(fa_center);
draw_text(startX, startY, "Choose your " + currentInputField + ":");

// Display input field or options
if (phase == e_phases.PHASE_1 || phase == e_phases.PHASE_3) {
	
		optionLength = array_length(phase1Options);
		var textVersusLineOffset = 5;
		// Draw name letters (we should make this block of code a function tbh)
		var xx = 0;
		for (var i = 0; i < maxLetters; i++) {
			
			// Draw the lines
			if(xx == string_length(currentString)) {
				draw_set_halign(fa_center);
				draw_sprite_ext(spr_name_line, 0, startX + 23*xx - 110, startY + 40 + blink * 3 + textVersusLineOffset, scale, scale, 0, c_white, 1);
			} else {
				// Animated effect
				draw_set_halign(fa_center);
				draw_sprite_ext(spr_name_line, 0, startX + 23*xx - 110, startY + 40 + textVersusLineOffset, scale, scale, 0, c_white, 1);
			}
			
			// Draw the text
			optionText = string_upper(string_char_at(currentString, xx+1));
				// Draw cursor
			if (pos == i) {
				draw_set_halign(fa_center);
				draw_text(startX + 23*xx + 6 - 110, startY + 40, optionText);
			}
			draw_text(startX + 23*xx + 6 - 110, startY + 40, optionText);
			xx++;
		}	
		
		// Confirm (Text + Rectangle)
		optionLength = array_length(phase1Options);
		for (var i = 0; i < optionLength; i++) {
			optionText = phase1Options[i];
			// Draw cursor
			if (pos == i) {
				optionText = "> " + optionText;
			}
			draw_set_halign(fa_center);
			
			// Draw rectangle
			draw_sprite(spr_rect, 0, startX, startY + 90 + i * 30);
			
			// Draw text
			draw_text(startX, startY + 90 + i * 30, optionText);	
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
	draw_set_halign(fa_center);
	draw_text(startX, startY + 60 + i * 30, optionText);	
	}
}
