/// @description Input checks, menu activation, etc
// TIP: Keyboard and mouse functions only register for 1 frame

// Context Config Menu
if (global.PRESSED_START) {
	global.config_menu = !global.config_menu;
}

// Pausing when Config Menu is active
global.pause = global.config_menu;

#region CONFIRM
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

#region LEFT
// pressed
if	(gamepad_button_check_pressed(0, gp_padl)) ||
	(keyboard_check_pressed(vk_left)) ||
	(keyboard_check_pressed(ord("A"))) {

	global.PRESSED_LEFT = true;
}else{ 
	global.PRESSED_LEFT = false;
}

// held
if	(gamepad_button_check(0, gp_padl)) ||
	(keyboard_check(vk_left)) ||
	(keyboard_check(ord("A"))) {

	global.HELD_LEFT = true;
}else{ 
	global.HELD_LEFT = false;
}

#endregion LEFT

#region RIGHT
// pressed
if	(gamepad_button_check_pressed(0, gp_padr)) ||
	(keyboard_check_pressed(vk_right)) ||
	(keyboard_check_pressed(ord("D"))) {

	global.PRESSED_RIGHT = true;
}else{
	global.PRESSED_RIGHT = false;
}

// held
if	(gamepad_button_check(0, gp_padr)) ||
	(keyboard_check(vk_right)) ||
	(keyboard_check(ord("D"))) {
	global.HELD_RIGHT = true;
}else{
	global.HELD_RIGHT = false;
}

#endregion right

#region START
// held
if (keyboard_check(vk_enter)) {
	global.HELD_START = true;
}else{
	global.HELD_START = false;
}

//pressed
if	(keyboard_check_pressed(vk_enter)) {
		global.PRESSED_START = true;
}else{
	global.PRESSED_START = false;
}

#endregion START
