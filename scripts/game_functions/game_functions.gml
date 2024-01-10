// Changes the game state and updates the previous state
function GameChangeState(_newState) {
	// Store the current state as the previous state
	if (_newState != global.state) {
		global.statePrevious = global.state;
	}
	
	// Change to the new state
	global.state = _newState;
}

function ConvertDate(_date) {
    var day = date_get_day(_date);
    var month = date_get_month(_date);
    var year = date_get_year(_date);
    return  (day < 10 ? "0" : "") + string(day) + "/" +
            (month < 10 ? "0" : "") + string(month) + "/" +
			// Copy the 3rd and 4th characters of the year only (the last two)
            string_copy(string(year), 3, 2);
			
	// Alternative: 
	// date_datetime_string(date_current_datetime()) returns datetime and hour based on user system
}

function DefineStats() constructor {
	wilting = 0;
	growth = 0;
	blossom = 0;
	humor = 0;
}

function DecideRoomName() {
	switch (global.rmCurrent) {
	    case "rm_dormroom":
			global.location = "Dormroom";
	    break;
		
		case "rm_init":
		case "rm_lang":
		case "rm_template":
		case "rm_title":
		case "rm_dream":
		case "rm_test":
		case "rm_file_selection":
	    default:
			global.location = "Nowhere";
	    break;
	}
}

// Called by InputCheckPressed(), InputCheckReleased() and InputCheckHeldc
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

function InputIsMouse() {
	return (global.inputMode == e_input.MOUSE);
}

function InputIsKeyboard() {
	return (global.inputMode == e_input.KEYBOARD);
}

function InputIsGamepad() {
	return (global.inputMode == e_input.GAMEPAD);
}
