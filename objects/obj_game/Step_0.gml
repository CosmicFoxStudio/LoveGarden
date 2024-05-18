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

// Quickly restart game (to make our lives easier)
if (global.gameMode == e_gameMode.DEMO) {
	if (keyboard_check_released(vk_f4)) {
		game_restart();	
	}
}
