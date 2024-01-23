/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering && global.state != e_gameStates.MENU) {
	show_debug_message("Map");
	
	TransitionSet(sq_out_trans_fade_black, sq_in_trans_fade_black, "CHANGE_ROOM", rm_campus_map);
}