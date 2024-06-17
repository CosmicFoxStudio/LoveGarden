/// @description Place name on box

// Draw top right corner button
// draw_sprite(spr_tooltip_box, 0, room_width-85, 0);
// draw_sprite(spr_help_menumap, 1, room_width-60, 19);

draw_set_halign(fa_center);
DrawFont(fnt_menu);
draw_text_color(room_width/2, room_height - 45, global.hoveringPlace, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, 1);
draw_text_color(room_width/2, room_height - 45, global.hoveringPlace, CYAN, CYAN, CYAN, CYAN, 1);
DrawFont(fnt_dialogue);

DrawReset();
