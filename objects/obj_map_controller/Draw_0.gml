/// @description Place name on box

draw_set_halign(fa_center);
DrawFont(fnt_menu);
draw_text_color(room_width/2, room_height - 45, global.hoveringPlace, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, 1);
DrawFont(fnt_dialogue);

DrawReset();