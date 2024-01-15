// Called by InputCheckPressed(), InputCheckReleased() and InputCheckHeld()
function InputVerb(_verb, _func) {
	switch (_verb) {
		case "confirm" :
			return _func(global.keybind.confirm);
		break;
		case "cancel" :
			return _func(global.keybind.cancel);
		break;
		case "start" :
			return _func(global.keybind.start);
		break;
		case "up" :
			return _func(global.keybind.up);
		break;
		case "down" :
			return _func(global.keybind.down);
		break;
		case "left" :
			return _func(global.keybind.left);
		break;
		case "right" : 
			return _func(global.keybind.right);
		break;
		case "confirm2" :
			return _func(global.keybind.confirm2);
		break;
		case "cancel2" :
			return _func(global.keybind.cancel2);
		break;
		case "start2" :
			return _func(global.keybind.start2);
		break;
		default: 
			show_debug_message("Invalid input verb.");
			return false;
		break;
	}
}

function InputCheck(_inputMode, _verb, _pressType = "pressed") {
	if (_inputMode != global.inputMode) {
		//show_debug_message("Trying to call input from a different mode.");	
		return false;
	}
	
	var func;
	if (_pressType == "pressed") func = InputCheckPressed;
	else if (_pressType == "released") func = InputCheckReleased;
	else if (_pressType == "held") func =  InputCheckHeld;
	
	return func(_inputMode, _verb);
}

// Called by InputCheck()
function InputCheckPressed(_inputMode, _verb) {
	var func;
	if _inputMode == e_input.MOUSE func = mouse_check_button_pressed;
	else if _inputMode == e_input.KEYBOARD func = keyboard_check_pressed;
	else if _inputMode == e_input.GAMEPAD func = gamepad_button_check_pressed;
	
	return InputVerb(_verb, func);
}

// Called by InputCheck()
function InputCheckReleased(_inputMode, _verb) {
	var func;
	if _inputMode == e_input.MOUSE func = mouse_check_button_released;
	else if _inputMode == e_input.KEYBOARD func = keyboard_check_released;
	else if _inputMode == e_input.GAMEPAD func = gamepad_button_check_released;
	
	return InputVerb(_verb, func);
}

// Called by InputCheck()
function InputCheckHeld(_inputMode, _verb) {
	var func;
	if _inputMode == e_input.MOUSE func = mouse_check_button;
	else if _inputMode == e_input.KEYBOARD func = keyboard_check;
	else if _inputMode == e_input.GAMEPAD func = gamepad_button_check;
	
	return InputVerb(_verb, func);
}

function IsHovering(_inst) {
	return instance_position(mouse_x, mouse_y, _inst);
}

/*
function InputIsMouse() {
	return (global.inputMode == e_input.MOUSE);
}

function InputIsKeyboard() {
	return (global.inputMode == e_input.KEYBOARD);
}

function InputIsGamepad() {
	return (global.inputMode == e_input.GAMEPAD);
}
*/
