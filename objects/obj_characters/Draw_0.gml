/// @description Draw the character
DrawSet(c_white, 1);

charactersOnScreen = 0;
if (chara0 != spr_noone) charactersOnScreen += 1;
if (chara1 != spr_noone) charactersOnScreen += 1;
if (chara2 != spr_noone) charactersOnScreen += 1;

// One character
if (chara0 != spr_noone && charactersOnScreen > 0) {
	draw_sprite_ext(
		chara0, 
		charactersExpression[0], 
		room_width/(charactersOnScreen+1), room_height, 
		1, 1, 0, 
		GetCharacterColor(chara0, currentSpeaker), 1
	);
}

// Two characters
if (chara1 != spr_noone && charactersOnScreen > 1) {
	draw_sprite_ext(
		chara1, 
		charactersExpression[1], 
		2*room_width/(charactersOnScreen+1), room_height, 
		1, 1, 0, 
		GetCharacterColor(chara1, currentSpeaker), 1
	);
}

// Three characters
if (chara2 != spr_noone && charactersOnScreen > 2) {
	draw_sprite_ext(
		chara2, 
		charactersExpression[2], 
		3*room_width/(charactersOnScreen+1), room_height,
		1, 1, 0, 
		GetCharacterColor(chara2, currentSpeaker), 1
	);
}

DrawReset();
