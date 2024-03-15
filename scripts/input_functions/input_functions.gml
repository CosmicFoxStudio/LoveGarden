// Called by InputCheckPressed(), InputCheckReleased() and InputCheckHeld()
function InputVerb(_verb, _func) {
	var _checkInput = false;
	var _funcLenght = array_length(_func)
	for (var _i = 0; _i < _funcLenght; _i++) {
	    switch (_verb) {
	        case "confirm":
	            _checkInput = (_checkInput || 
					(global.keybind[_i].confirm == -1 ?
						false : _func[_i](global.keybind[_i].confirm)
					)
				);
	            break;
	        case "cancel":
	            _checkInput = (_checkInput || 
					(global.keybind[_i].cancel == -1 ? 
						false : _func[_i](global.keybind[_i].cancel)
					)
				);
	            break;
	        case "start":
	            _checkInput = (
					_checkInput || (global.keybind[_i].start == -1 ? 
						false : _func[_i](global.keybind[_i].start)
					)
				);
	            break;
	        case "up":
	            _checkInput = (
					_checkInput || (global.keybind[_i].up == -1 ? 
						false : _func[_i](global.keybind[_i].up)
					)
				);
	            break;
	        case "down":
	            _checkInput = (
					_checkInput || (global.keybind[_i].down == -1 ? 
						false : _func[_i](global.keybind[_i].down)
					)
				);
	            break;
	        case "left":
	            _checkInput = (
					_checkInput || (global.keybind[_i].left == -1 ? 
						false : _func[_i](global.keybind[_i].left)
					)
				);
	            break;
	        case "right":
	            _checkInput = (
					_checkInput || (global.keybind[_i].right == -1 ? 
						false : _func[_i](global.keybind[_i].right)
					)
				);
	            break;
	        default:
	            show_debug_message("Invalid input verb.");
	            return false;
	    }
	}

	return _checkInput;
}

function InputCheck(_verb, _inputMode = -1,  _pressType = "pressed") {
	//if (_inputMode != global.inputMode) {
	//	//show_debug_message("Trying to call input from a different mode.");	
	//	return false;
	//}
	
	var func;
	if (_pressType == "pressed") func = InputCheckPressed;
	else if (_pressType == "released") func = InputCheckReleased;
	else if (_pressType == "held") func =  InputCheckHeld;
	
	return func(_inputMode, _verb);
}

// Called by InputCheck()
function InputCheckPressed(_inputMode, _verb) {
	var func = array_create(3, function(_numb) {
			return false;
		}
	);
	if _inputMode == e_input.MOUSE func[e_input.MOUSE] = mouse_check_button;
	else if _inputMode == e_input.KEYBOARD func[e_input.KEYBOARD] = keyboard_check;
	else if _inputMode == e_input.GAMEPAD func[e_input.GAMEPAD] = gamepad_button_check;
	else {
		func[e_input.MOUSE] = mouse_check_button; 
		func[e_input.KEYBOARD] = keyboard_check;
		func[e_input.GAMEPAD] = gamepad_button_check;
	}
	
	return InputVerb(_verb, func);
}

// Called by InputCheck()
function InputCheckReleased(_inputMode, _verb) {
	var func;
	if _inputMode == e_input.MOUSE func = [mouse_check_button];
	else if _inputMode == e_input.KEYBOARD func = [keyboard_check];
	else if _inputMode == e_input.GAMEPAD func = [gamepad_button_check];
	else func = [mouse_check_button, keyboard_check, gamepad_button_check];
	
	return InputVerb(_verb, func);
}

// Called by InputCheck()
function InputCheckHeld(_inputMode, _verb) {
	var func;
	if _inputMode == e_input.MOUSE func = [mouse_check_button];
	else if _inputMode == e_input.KEYBOARD func = [keyboard_check];
	else if _inputMode == e_input.GAMEPAD func = [gamepad_button_check];
	else func = [mouse_check_button, keyboard_check, gamepad_button_check];
	
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
