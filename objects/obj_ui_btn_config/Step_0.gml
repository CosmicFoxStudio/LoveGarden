/// @description Button Action

if ((InputCheck("confirm", e_input.MOUSE) && hovering && global.state != e_gameStates.MENU) || (doAction && global.state != e_gameStates.MENU)) {
	show_debug_message("Menu");
	ToggleContextMenu();
	image_index = 0;
	hovering = false;
	global.hoveringButton = false;
	doAction = false;
}
