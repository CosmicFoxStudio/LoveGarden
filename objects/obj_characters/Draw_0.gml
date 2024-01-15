/// @description Draw the character

// Only perform the drawing if the array is not empty
if (array_length(characters) != 0) {
	
	for (var chara = 0; chara < amount; chara++) { 
		// One character onscreen
		if (amount == 0) {
			draw_sprite_ext(
				characters[chara], 
				characterExpressions[chara], 
				room_width/2, room_height, 
				1, 1, 0, 
				c_white, 1
			);
		}

		// Two characters onscreen
		else if (amount == 1) {
			draw_sprite_ext(
				characters[chara], 
				characterExpressions[chara], 
				room_width/4 + chara*180, room_height, 
				1, 1, 0, 
				c_white, 1
			);	
		}
	}
}
