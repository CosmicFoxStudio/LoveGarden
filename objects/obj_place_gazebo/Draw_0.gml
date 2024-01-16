draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

DrawFont(fnt_dialogue);
draw_text_color(x + sprite_width/2, y + sprite_height/2, PlaceLocalization("Gazebo"), TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, 1);
DrawFont(fnt_dialogue);

DrawReset();