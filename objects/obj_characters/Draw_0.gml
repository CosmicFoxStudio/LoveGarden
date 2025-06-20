/// @description Draw the character
DrawSet(c_white, 1);

charactersOnScreen = 0;

// Count characters on screen
for (var i = 0; i < array_length(charaExpression); i++) {
    if (charaExpression[i] != spr_noone) {
        charactersOnScreen += 1;
    }
}

// Draw each character
for (var i = 0; i < array_length(charaExpression); i++) {
    if (charaExpression[i] != spr_noone && charactersOnScreen > i) {
        draw_sprite_ext(
            charaExpression[i], 
            image_speed, 
            (i + 1) * room_width / (charactersOnScreen + 1), room_height, 
            1, 1, 0, 
            GetCharacterColor(charaExpression[i], currentSpeaker), 1
        );
    }
}

DrawReset();

/* THE DATA BEHIND IT:
chara[0]: { 
	expressions : { neutral : 85, surprise : 86, happy : 87, annoyed : 88, awkward : 89, sidelook : 90, scared : 91 }, 
	name : "ipe", 
	hearts : 0, 
	myid : 1 
} 
chara[1]: -4 
chara[2]: -4

charaExpression[0]: 85 
charaExpression[1]: 115 
charaExpression[2]: 115

85 -> spr_ipe_0 (neutral)
115 -> probably spr_noone, because the positions 1 and 2 were empty
*/