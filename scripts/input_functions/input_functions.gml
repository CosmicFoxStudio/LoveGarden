// Called by InputCheckPressed(), InputCheckReleased() and InputCheckHeld()
function InputVerb(_verb, _func) {
	var _checkInput = false;
	var _funcLenght = array_length(_func);
	
	for (var _i = 0; _i < _funcLenght; _i++) {
	    switch (_verb) {
	        case "confirm":
	            _checkInput = (_checkInput || 
					(global.primaryKeybind[_i].confirm == -1 ?
						false : _func[_i](global.primaryKeybind[_i].confirm)
					) ||
					(global.secondaryKeybind[_i].confirm == -1 ?
						false : _func[_i](global.secondaryKeybind[_i].confirm)
					)
				);
	            break;
	        case "cancel":
	            _checkInput = (_checkInput || 
					(global.primaryKeybind[_i].cancel == -1 ? 
						false : _func[_i](global.primaryKeybind[_i].cancel)
					) ||
					(global.secondaryKeybind[_i].cancel == -1 ? 
						false : _func[_i](global.secondaryKeybind[_i].cancel)
					)
				);
	            break;
	        case "start":
	            _checkInput = (_checkInput || 
					(global.primaryKeybind[_i].start == -1 ? 
						false : _func[_i](global.primaryKeybind[_i].start)
					) ||
					(global.secondaryKeybind[_i].start == -1 ? 
						false : _func[_i](global.secondaryKeybind[_i].start)
					)
				);
	            break;
	        case "up":
	            _checkInput = (_checkInput || 
					(global.primaryKeybind[_i].up == -1 ? 
						false : _func[_i](global.primaryKeybind[_i].up)
					) ||
					(global.secondaryKeybind[_i].up == -1 ? 
						false : _func[_i](global.secondaryKeybind[_i].up)
					)
				);
	            break;
	        case "down":
	            _checkInput = (_checkInput || 
					(global.primaryKeybind[_i].down == -1 ? 
						false : _func[_i](global.primaryKeybind[_i].down)
					) ||
					(global.secondaryKeybind[_i].down == -1 ? 
						false : _func[_i](global.secondaryKeybind[_i].down)
					)
				);
	            break;
	        case "left":
	            _checkInput = (_checkInput || 
					(global.primaryKeybind[_i].left == -1 ? 
						false : _func[_i](global.primaryKeybind[_i].left)
					) ||
					(global.secondaryKeybind[_i].left == -1 ? 
						false : _func[_i](global.secondaryKeybind[_i].left)
					)
				);
	            break;
	        case "right":
	            _checkInput = (_checkInput || 
					(global.primaryKeybind[_i].right == -1 ? 
						false : _func[_i](global.primaryKeybind[_i].right)
					) ||
					(global.secondaryKeybind[_i].right == -1 ? 
						false : _func[_i](global.secondaryKeybind[_i].right)
					)
				);
	            break;
	        default:
	            show_debug_message("Invalid input verb.");
	            return false;
	    }
		
		if(_checkInput) {
			break;
		}
	}
	
	return _checkInput;
}

function InputCheck(_verb, _inputMode = -1,  _pressType = "pressed") {
	var func;
	if (_pressType == "pressed") func = InputCheckPressed;
	else if (_pressType == "released") func = InputCheckReleased;
	else if (_pressType == "held") func =  InputCheckHeld;
	
	//var _returnValue = func(_inputMode, _verb);
	//if(_returnValue) {
	//	show_debug_message("InputCheck verb: " + string(_verb));
	//	show_debug_message("InputCheck input mode: " + string(_inputMode));
	//	show_debug_message("InputCheck press type: " + string(_pressType));
	//}
	
	return func(_inputMode, _verb);
}

// Called by InputCheck()
function InputCheckPressed(_inputMode, _verb) {
	var func = array_create(3, function(_numb) {
			return false;
		}
	);
	if _inputMode == e_input.MOUSE func[e_input.MOUSE] = mouse_check_button_pressed;
	else if _inputMode == e_input.KEYBOARD func[e_input.KEYBOARD] = keyboard_check_pressed;
	else if _inputMode == e_input.GAMEPAD func[e_input.GAMEPAD] = gamepad_button_check_pressed;
	else {
		func[e_input.MOUSE] = mouse_check_button_pressed; 
		func[e_input.KEYBOARD] = keyboard_check_pressed;
		func[e_input.GAMEPAD] = gamepad_button_check_pressed;
	}
	
	return InputVerb(_verb, func);
}

// Called by InputCheck()
function InputCheckReleased(_inputMode, _verb) {
	var func = array_create(3, function(_numb) {
			return false;
		}
	);
	if _inputMode == e_input.MOUSE func[e_input.MOUSE] = mouse_check_button_released;
	else if _inputMode == e_input.KEYBOARD func[e_input.KEYBOARD] = keyboard_check_released;
	else if _inputMode == e_input.GAMEPAD func[e_input.GAMEPAD] = gamepad_button_check_released;
	else {
		func[e_input.MOUSE] = mouse_check_button_released; 
		func[e_input.KEYBOARD] = keyboard_check_released;
		func[e_input.GAMEPAD] = gamepad_button_check_released;
	}

	return InputVerb(_verb, func);
}

// Called by InputCheck()
function InputCheckHeld(_inputMode, _verb) {
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

function IsHovering(_inst) {
	return instance_position(mouse_x, mouse_y, _inst);
}
