/// @description Draw the character
DrawSet(c_white, 1);

charactersOnScreen = 0;

// Count characters on screen
for (var i = 0; i < array_length(chara); i++) {
    if (chara[i] != spr_noone) {
        charactersOnScreen += 1;
    }
}

// Draw each character
for (var i = 0; i < array_length(chara); i++) {
    if (chara[i] != spr_noone && charactersOnScreen > i) {
        draw_sprite_ext(
            chara[i], 
            charactersExpression[i], 
            (i + 1) * room_width / (charactersOnScreen + 1), room_height, 
            1, 1, 0, 
            GetCharacterColor(chara[i], currentSpeaker), 1
        );
    }
}

DrawReset();
