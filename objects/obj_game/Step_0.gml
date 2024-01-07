/// @description Input checks, menu activation, etc
// TIP: Keyboard and mouse functions only register for 1 frame

// Context Config Menu Toggle Activation / Deactivation
if ( (global.PRESSED_START || global.PRESSED_MOUSE_MIDDLE) ) {
	//	Can only be activated/deactivated if game state is CONTINUE_GAME or MENU
	ToggleContextMenu(global.state == e_gameStates.CONTINUE_GAME || global.state == e_gameStates.MENU);
}

#region SETUP INPUTS & CONTROLS

	#region ARROWS HELD
	// Any
	if (global.HELD_UP || global.HELD_DOWN || global.HELD_LEFT || global.HELD_RIGHT) {
		global.HELD_ARROWS = true;
	} else {
		global.HELD_ARROWS = false;
	}

	// Up
	if	(gamepad_button_check(0, gp_padu)) ||
		(keyboard_check(vk_up)) ||
		(keyboard_check(ord("W"))) {
		global.HELD_UP = true;
	} else {
		global.HELD_UP = false;
	}
	
	// Down
	if	(gamepad_button_check(0, gp_padd)) ||
		(keyboard_check(vk_down)) ||
		(keyboard_check(ord("S"))) {
		global.HELD_DOWN = true;
	} else {
		global.HELD_DOWN = false;
	}

	// Left
	if	(gamepad_button_check(0, gp_padl)) ||
		(keyboard_check(vk_left)) ||
		(keyboard_check(ord("A"))) {
		global.HELD_LEFT = true;
	} else {
		global.HELD_LEFT = false;
	}

	// Right
	if	(gamepad_button_check(0, gp_padr)) ||
		(keyboard_check(vk_right)) ||
		(keyboard_check(ord("D"))) {
		global.HELD_RIGHT = true;
	} else {
		global.HELD_RIGHT = false;
	}
	#endregion ARROWS HELD

	#region ARROWS RELEASED 
	 // Up
	if	(gamepad_button_check_released(0, gp_padu)) ||
		(keyboard_check_released(vk_up)) ||
		(keyboard_check_released(ord("W"))) {
		global.RELEASED_UP = true;
	} else { 
		global.RELEASED_UP = false;
	}

	// Down
	if	(gamepad_button_check_released(0, gp_padd)) ||
		(keyboard_check_released(vk_down)) ||
		(keyboard_check_released(ord("S"))) {
		global.RELEASED_DOWN = true;
	} else {
		global.RELEASED_DOWN = false;
	}

	// Left
	if	(gamepad_button_check_released(0, gp_padl)) ||
		(keyboard_check_released(vk_left)) ||
		(keyboard_check_released(ord("A"))) {
		global.RELEASED_LEFT = true;
	} else {
		global.RELEASED_LEFT = false;
	}

	// Right
	if (gamepad_button_check_released(0, gp_padr)) ||
		(keyboard_check_released(vk_right)) ||
		(keyboard_check_released(ord("D"))) {
		global.RELEASED_RIGHT = true;
	} else {
		global.RELEASED_RIGHT = false;
	}
	#endregion ARROWS RELEASED 

	#region ARROWS PRESSED
	if	(gamepad_button_check_pressed(0, gp_padu)) ||
		(keyboard_check_pressed(vk_up)) ||
		(keyboard_check_pressed(ord("W"))) {
		global.PRESSED_UP = true;
	} else { 
		global.PRESSED_UP = false;
	}

	if	(gamepad_button_check_pressed(0, gp_padd)) ||
		(keyboard_check_pressed(vk_down)) ||
		(keyboard_check_pressed(ord("S"))) {
		global.PRESSED_DOWN = true;
	} else {
		global.PRESSED_DOWN = false;
	}

	if	(gamepad_button_check_pressed(0, gp_padl)) ||
		(keyboard_check_pressed(vk_left)) ||
		(keyboard_check_pressed(ord("A"))) {
		global.PRESSED_LEFT = true;
	} else {
		global.PRESSED_LEFT = false;
	}

	if (gamepad_button_check_pressed(0, gp_padr)) ||
		(keyboard_check_pressed(vk_right)) ||
		(keyboard_check_pressed(ord("D"))) {
		global.PRESSED_RIGHT = true;
	} else {
		global.PRESSED_RIGHT = false;
	}
	#endregion ARROWS PRESSED

	#region CONFIRM
	// Held
	if (keyboard_check(ord("Z"))) ||
		(keyboard_check(vk_space)) ||
		(gamepad_button_check(0, gp_face1)) {
		global.HELD_CONFIRM = true;
	}else{
		global.HELD_CONFIRM = false;
	}

	// Pressed
	if	(keyboard_check_pressed(ord("Z"))) ||
		(keyboard_check_pressed(vk_space)) ||
		(gamepad_button_check_pressed(0, gp_face1)) {
			global.PRESSED_CONFIRM = true;
	} else {
		global.PRESSED_CONFIRM = false;
	}

	// Released
	if	(keyboard_check_released(ord("Z"))) ||
		(keyboard_check_released(vk_space)) ||
		(gamepad_button_check_released(0, gp_face1)) {
			global.RELEASED_CONFIRM = true;
	} else {
		global.RELEASED_CONFIRM = false;
	}

	#endregion

	#region CANCEL
	// Held
	if	(gamepad_button_check(0, gp_face2)) ||
		(gamepad_button_check(0, gp_face3)) ||
		(keyboard_check(vk_backspace)) ||
		(keyboard_check(ord("X"))) {
		global.HELD_CANCEL = true;
	} else {
		global.HELD_CANCEL = false;
	}

	// Pressed
	if	(gamepad_button_check_pressed(0, gp_face2))	||
		(gamepad_button_check_pressed(0, gp_face3)) ||
		(keyboard_check_pressed(vk_backspace)) ||
		(keyboard_check_pressed(ord("X"))) {
		global.PRESSED_CANCEL = true;
	} else {
		global.PRESSED_CANCEL = false;
	}

	// Released
	if	(keyboard_check_released(vk_backspace))	||
		(keyboard_check_released(ord("X")))	||
		(gamepad_button_check_released(0, gp_face2)) ||
		(gamepad_button_check_released(0, gp_face3)) {
		global.RELEASED_CANCEL = true;
	} else {
		global.RELEASED_CANCEL = false;
	}

	#endregion CANCEL

	#region START
	// Held
	if	(gamepad_button_check(0, gp_start)) ||
		(keyboard_check(vk_enter)) ||
		(keyboard_check(ord("C"))) {
		global.HELD_START = true;
	} else {
		global.HELD_START = false;
	}

	// Pressed
	if	(keyboard_check_pressed(vk_enter)) ||
		(keyboard_check_pressed(ord("C"))) ||
		(gamepad_button_check_pressed(0, gp_start))	{
		global.PRESSED_START = true;
	} else {
		global.PRESSED_START = false;
	}

	// Released
	if	(keyboard_check_released(vk_enter))	||
		(keyboard_check_released(ord("C"))) ||
		(gamepad_button_check_pressed(0, gp_start)) {
		global.RELEASED_START = true;
	} else {
		global.RELEASED_START = false;
	}

	#endregion START
	
	#region MOUSE LEFT (CONFIRM)
	// Held
	if (mouse_check_button(mb_left)) {
		global.HELD_MOUSE_LEFT = true;
	} else {
		global.HELD_MOUSE_LEFT = false;	
	}
	
	// Released
	if (mouse_check_button_released(mb_left)) {
		global.RELEASED_MOUSE_LEFT = true;
	} else {
		global.RELEASED_MOUSE_LEFT = false;	
	}
	
	// Pressed
	if (mouse_check_button_pressed(mb_left)) {
		global.PRESSED_MOUSE_LEFT = true;
	} else {
		global.PRESSED_MOUSE_LEFT = false;
	}
	#endregion MOUSE LEFT (CONFIRM)

	#region MOUSE RIGHT (CANCEL)
	// Held
	if (mouse_check_button(mb_right)) {
		global.HELD_MOUSE_RIGHT = true;
	} else {
		global.HELD_MOUSE_RIGHT = false;	
	}
	
	// Released
	if (mouse_check_button_released(mb_right)) {
		global.RELEASED_MOUSE_RIGHT = true;
	} else {
		global.RELEASED_MOUSE_RIGHT = false;	
	}
	
	// Pressed
	if (mouse_check_button_pressed(mb_right)) {
		global.PRESSED_MOUSE_RIGHT = true;
	} else {
		global.PRESSED_MOUSE_RIGHT = false;
	}
	#endregion MOUSE RIGHT (CANCEL)
	
	#region MOUSE MIDDLE (START)
	// Pressed
	if (mouse_check_button_pressed(mb_middle)) {
		global.PRESSED_MOUSE_MIDDLE = true;
	} else {
		global.PRESSED_MOUSE_MIDDLE = false;
	}
	#endregion MOUSE MIDDLE (START)
	
#endregion SETUP INPUTS & CONTROLS
