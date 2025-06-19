/// @description Save Game

// Check for new game

// As soon as the FIRST_ACESS state is updated, it will create obj_ui_controller
if (global.state == e_gameStates.FIRST_ACESS || global.state == e_gameStates.CONTINUE_GAME) {
	GameCreateUI();
}
