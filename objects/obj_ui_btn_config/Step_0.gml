/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	ToggleContextMenu(global.state == e_gameStates.CONTINUE_GAME);
}