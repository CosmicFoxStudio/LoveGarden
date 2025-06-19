
// Draw map box
if (global.map) {
	draw_set_halign(fa_center);
	DrawFont(fnt_menu);
	draw_text_color(room_width/2, room_height - 45, global.hoveringPlace, CYAN, CYAN, CYAN, CYAN, 1);
	DrawFont(fnt_dialogue);

	DrawReset();	
}

DrawReset();	
