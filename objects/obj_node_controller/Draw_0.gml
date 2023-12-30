/// @description Draw text and options

draw_set_font(fnt_dialogue);

// Set valign to the middle
DrawAlign(fa_left, fa_middle); 

// Horizontal text margin
var marginText = 64;     

if IsChatterbox(chatterbox) and text != undefined {
	// Draw text
	var yy = room_height - (marginText/2) - 22;
	
	// Textbox (In case we need one made by code only)
	//draw_rectangle_center(room_width/2, yy, room_width - 190, marginText,  false, c_black, 0.5);
	
	DrawAlign(fa_center);
	var xx = room_width/2 + 22;
	
	// Draw dialogue text
	draw_text(xx, yy, ChatterboxGetContentSpeech(chatterbox, 0));
	
	// Draw nametag
	draw_text(room_width/2 - 230, room_height - (marginText/2) - 8, ChatterboxGetContentSpeaker(chatterbox, 0));
	
	// If there are options to choose, put them in the middle of the screen
	if ChatterboxGetOptionCount(chatterbox) {
		DrawAlign(fa_center);
		
		var width = 450;
		var height = 32;
		
		// Logic to always have 3 options (?)
		for (var i = 0; i < ChatterboxGetOptionCount(chatterbox); i++) {
			if ChatterboxGetOptionConditionBool(chatterbox, i) {
				xx = room_width/2;
				yy = (room_height/6) * (i+2) - 30;
				
				draw_rectangle_center(xx, yy, width, height, false, c_black, 0.5);
				
				var icon = "";
				if (optionIndex == i) icon = "> ";
				var option = ChatterboxGetOption(chatterbox, i);
				
				draw_text(xx, yy, icon + option);
			}
		}
	}
}
		
// Reset
DrawReset();
