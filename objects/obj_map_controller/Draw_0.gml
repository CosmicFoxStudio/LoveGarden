/// @description Place name on box

draw_sprite(spr_tooltip_box, 0, room_width-85, 0);
draw_sprite(spr_help_interact2, 0, room_width-60, 19);

draw_set_halign(fa_center);
DrawFont(fnt_menu);
draw_text_color(room_width/2, room_height - 45, global.hoveringPlace, CYAN, CYAN, CYAN, CYAN, 1);
DrawFont(fnt_dialogue);

DrawReset();