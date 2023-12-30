#region CONFIRM

// TIP: Keyboard and mouse functions only register for 1 frame

// Mouse
if	(mouse_check_button_pressed(mb_left)) {
		global.MOUSE_CONFIRM = true;
}else{
	global.MOUSE_CONFIRM = false;
}

// Space Bar
if (keyboard_check_pressed(vk_space)) {
	global.SPACE_CONFIRM = true;
}else{
	global.SPACE_CONFIRM = false;
}

#endregion CONFIRM

#region CANCEL

// Backspace
if (keyboard_check_pressed(vk_backspace)) {
	global.BACKSPACE_CANCEL = true;
}else{
	global.BACKSPACE_CANCEL = false;
}

#endregion  CANCEL

#region UP / DOWN

if	(gamepad_button_check_pressed(0, gp_padu)) ||
	(keyboard_check_pressed(vk_up)) ||
	(keyboard_check_pressed(ord("W"))){

	global.PRESSED_UP = true;
}else{ 
	global.PRESSED_UP = false;
}

if	(gamepad_button_check_pressed(0, gp_padd)) ||
	(keyboard_check_pressed(vk_down)) ||
	(keyboard_check_pressed(ord("S"))){

	global.PRESSED_DOWN = true;
}else{
	global.PRESSED_DOWN = false;
}

#endregion UP / DOWN

#region LEFT / RIGHT

if	(gamepad_button_check_pressed(0, gp_padl)) ||
	(keyboard_check_pressed(vk_left)) ||
	(keyboard_check_pressed(ord("A"))){

	global.PRESSED_LEFT = true;
}else{ 
	global.PRESSED_LEFT = false;
}

if	(gamepad_button_check_pressed(0, gp_padr)) ||
	(keyboard_check_pressed(vk_right)) ||
	(keyboard_check_pressed(ord("D"))){

	global.PRESSED_RIGHT = true;
}else{
	global.PRESSED_RIGHT = false;
}

#endregion LEFT / RIGHT
