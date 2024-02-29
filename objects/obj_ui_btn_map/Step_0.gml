/// @description Button Action

if ((InputCheck(e_input.MOUSE, "confirm") && hovering && global.state != e_gameStates.MENU) || (global.inputMode == e_input.KEYBOARD && doAction && global.state != e_gameStates.MENU)) {
	show_debug_message("Map");
	//GameTransitionChangeRoom(rm_campus_map, sq_trans_fade_black);
	image_index = 0;
	hovering = false;
	global.hoveringButton = false;
	doAction = false;
}
