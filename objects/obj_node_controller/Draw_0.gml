/// @description Draw text and options

// Set halign to center and valign to the middle (center the text in the textbox)
DrawAlign(fa_center, fa_middle); 

draw_text(325, 15, "Typist position: " + string(typist.get_position()));
draw_text(325, 30, "Text Length: " + string(textLength));
// Horizontal text margin
var marginText = 64;     
textLength = scribble(ChatterboxGetContentSpeech(chatterbox, 0)).get_glyph_count();

if IsChatterbox(chatterbox) and text != undefined {

	
	// Draw text
	var yy = room_height - (marginText/2) - 50;
	
	// Textbox (In case we need one made by code only)
	// DrawRectangleCenter(room_width/2, yy, room_width - 190, marginText,  false, c_black, 0.5);
	
	var xx = room_width/2 - 200;
	
	// Draw dialogue text
	DrawFont(fnt_dialogue);
	
	scribble("[c_text_green]" + ChatterboxGetContentSpeech(chatterbox, 0)).wrap(TEXT_WIDTH).draw(xx, yy, typist);
	
	// Draw nametag
	var speakerName;
	if ( (ChatterboxGetContentSpeaker(chatterbox, 0) == "PLAYER") ) speakerName = global.playerName;
	else speakerName = ChatterboxGetContentSpeaker(chatterbox, 0);

		
	DrawFont(fnt_dialogue);
	draw_text_color(
		room_width/2 - 163, 
		room_height - (marginText/2) - 73, 
		speakerName,
		TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, 1
	);

	if (speakerName != "")
		layer_set_visible(layer_get_id("UI_Above"), true);
	else
		layer_set_visible(layer_get_id("UI_Above"), false);
	
	// Adding options to the screen
	if ChatterboxGetOptionCount(chatterbox) {
		var width = 450;
		var height = 32;
		
		// Logic to always have 3 options (?)
		for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
			if ChatterboxGetOptionConditionBool(chatterbox, i) {
				xx = room_width/2;
				yy = (room_height/6) * (i+2) - 30;
				
				DrawRectangleCenter(xx, yy, width, height, false, c_black, 0.5);
				
				var icon = "";
				if (optionIndex == i) icon = "> ";
				var option = ChatterboxGetOption(chatterbox, i);
				
				draw_text(xx, yy, icon + option);
				//scribble(icon + option).wrap(300).draw(xx, yy, typist);
			}
		}
	}
}
		
// Reset
DrawReset();
