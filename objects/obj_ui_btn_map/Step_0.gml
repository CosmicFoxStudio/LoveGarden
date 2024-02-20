/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering && global.state != e_gameStates.MENU) {
	show_debug_message("Map");
	
	//GameTransitionChangeRoom(rm_campus_map, sq_trans_fade_black);
}
