
// Draw map box
if (global.map) {
	draw_set_halign(fa_center);
	DrawFont(fnt_menu);
	draw_text_color(room_width/2, room_height - 45, global.hoveringPlace, CYAN, CYAN, CYAN, CYAN, 1);
	DrawFont(fnt_dialogue);

	DrawReset();	
}

/*
// End Event Pop Up
if (global.state == e_gameStates.EVENT_END && global.roomType.SCENES) {
	// Create End Event Pop Up (call to map)
	instance_create_layer(ORIGIN_X + (sprite_get_width(spr_tooltip_box2)/2), ORIGIN_Y + 80, "Instances_Above", obj_ui_btn_map);
}
*/

DrawReset();	
