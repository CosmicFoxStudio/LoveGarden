/// @description Input checks, menu activation, etc
// TIP: Keyboard and mouse functions only register for 1 frame

// Toggle fullscreen when Escape key is released
if (global.state != e_gameStates.MENU) {
	if (keyboard_check_released(vk_escape)) {
	    window_set_fullscreen(!global.fullscreen);
	    window_center();
	    // Update global.fullscreen after toggling
	    global.fullscreen = window_get_fullscreen();
	}
}

// Context Config Menu Toggle Activation / Deactivation
if ( InputCheck(e_input.KEYBOARD, "start") || InputCheck(e_input.MOUSE, "start") ) {
	//	Can only be activated/deactivated if game state is CONTINUE_GAME or MENU
	ToggleContextMenu(global.state == e_gameStates.CONTINUE_GAME || global.state == e_gameStates.MENU);
}
