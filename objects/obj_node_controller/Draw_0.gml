/// @description Draw text and options

// Set halign to center and valign to the middle (center the text in the textbox)
DrawAlign(fa_center, fa_middle); 

// Horizontal text margin
var marginText = 64;     

if IsChatterbox(chatterbox) and text != undefined {
	// Draw text
	var yy = room_height - (marginText/2) - 50;
	
	// Textbox (In case we need one made by code only)
	// DrawRectangleCenter(room_width/2, yy, room_width - 190, marginText,  false, c_black, 0.5);
	
	var xx = room_width/2 - 155;
	
	// Draw dialogue text
	DrawFont(fnt_dialogue);
	//draw_text(xx, yy, ChatterboxGetContentSpeech(chatterbox, 0));
	scribble(ChatterboxGetContentSpeech(chatterbox, 0)).wrap(380).draw(xx, yy, typist);
	
	// Draw nametag
	DrawFont(fnt_dialogue);
	draw_text(room_width/2 - 230, room_height - (marginText/2) - 8, ChatterboxGetContentSpeaker(chatterbox, 0));
	
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
				
				//draw_text(xx, yy, icon + option);
				scribble(icon + option).wrap(300).draw(xx, yy, typist);
			}
		}
	}
}
		
// Reset
DrawReset();
