/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	ToggleContextMenu(global.state == e_gameStates.CONTINUE_GAME);
	image_index = 0;
	hovering = false;
	global.hoveringButton = false;
}