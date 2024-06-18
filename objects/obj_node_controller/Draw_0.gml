/// @description Draw text and options

// Set halign to center and valign to the middle (center the text in the textbox)
DrawAlign(fa_center, fa_middle); 
//DrawFont(fnt_dialogue);
DrawFont(global.dialogFonts[global.fontType][global.fontSize]);
		
// Horizontal text margin
var marginText = 64; // make this a macro later?
	
if (IsChatterbox(chatterbox)) {	

	// Draw coordinates (text)
	var yy = room_height - (marginText/2) - 50;
	var xx = room_width/2 - 200;
	
	// Get speech text
	var speechText = ChatterboxGetContentSpeech(chatterbox, 0);
	
	// ------------------------- APPLY STRING SUBSTITUTIONS TO SPEECH TEXT ------------------------- //
	// Portuguese gender inflection
	speechText = GenderInflection(speechText, global.pronouns);
	
	// Check if "PLAYER" exists in the string and replace it with the value in global.playerName
	if (string_pos("PLAYER", speechText) > 0) { // > 0 means a string was found
	    // Replace "PLAYER" with global.playerName in Title Case
		var playerNameInitial = string_copy(global.playerName, 1, 1);
		var playerNameLowerRest = string_lower(string_copy(global.playerName, 2, string_length(global.playerName) - 1));
	    var playerNameTitleCase = playerNameInitial + playerNameLowerRest;
	    speechText = string_replace(speechText, "PLAYER", playerNameTitleCase);
	}
	
	// Update string length
	//textLength = scribble(speechText).get_glyph_count();
	
	// ----------------------------------- DRAW SPEECH TEXT ----------------------------------- // 
	if (!global.midTransition) {
		// Use scribble colors for the text (set in __scribble_config_colours)
		scribble(GetCharacterTextColor(speaker) + speechText).wrap(TEXT_WIDTH).draw(xx, yy, typist);
	}
	// ----------------------------------- DRAW NAMETAG TEXT ----------------------------------- // 
	// Get speaker name
	var speakerName = ChatterboxGetContentSpeaker(chatterbox, 0);	
	if ( (ChatterboxGetContentSpeaker(chatterbox, 0) == "PLAYER") ) speakerName = global.playerName;
	else speakerName = ChatterboxGetContentSpeaker(chatterbox, 0);
	if (!global.midTransition) {
		draw_text_color(
			room_width/2 - 157, 
			room_height - (marginText/2) - 72, 
			speakerName,
			GetCharacterTextColorRGB(speaker), GetCharacterTextColorRGB(speaker),
			GetCharacterTextColorRGB(speaker), GetCharacterTextColorRGB(speaker), 1
		);
	}
	// ----------------------------------- ADDING OPTIONS TO THE SCREEN ----------------------------------- //
	if ChatterboxGetOptionCount(chatterbox) {
		var width = 450;
		var height = 32;
		
		// Logic to skip the options that are conditioned to an IF statement if they return false
		for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
			if ChatterboxGetOptionConditionBool(chatterbox, i) {
				xx = room_width/2;
				yy = (room_height/6) * (i+2) - 30;
				
				DrawRectangleCenter(xx, yy, width, height, false, c_black, 0.5);
				draw_sprite(spr_saveslot2, 1, xx-width/2, yy-height/2);
				
				var icon = "";
				if (optionIndex == i) icon = "> ";
				var option = ChatterboxGetOption(chatterbox, i);
				
				
				// Portuguese gender inflection
				option = GenderInflection(option, global.pronouns);
				
				// Draw the options
				draw_text(xx, yy + 5, icon + option);
				//scribble(icon + option).wrap(300).draw(xx, yy, typist);
			} else if (optionIndex == i) {
				optionIndex++;
			}
		}
	}
}

// Reset
DrawReset();
