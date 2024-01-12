/// @description Save Game

// Check for new game

// As soon as the NEW_GAME state is updated, it will create obj_ui_controller
if (global.state == e_gameStates.NEW_GAME || global.state == e_gameStates.CONTINUE_GAME) {
	GameCreateUI();
}
