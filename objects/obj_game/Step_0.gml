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

// LMAO
if (global.day > 4 && global.state == e_gameStates.CONTINUE_GAME) {
	show_error("BRO. 4 IS TOO MANY ALREADY.", true);	
	game_end();
}
