if (global.state == e_gameStates.PAUSED) exit;

menuOptions[pos].keyboardSelection = false;

pos = (pos + CheckHorizontalInput()) % optionLength;
if (pos < 0) pos = optionLength - 1;

menuOptions[pos].keyboardSelection = true;

for(var i =0; i < optionLength; i++) {
	if(menuOptions[i].hovering) {
		menuOptions[pos].keyboardSelection = false;
		pos = i;
		break;
	}
}

var _buttonSelected = false;
for(var i =0; i < optionLength; i++) {
	if(menuOptions[i].selected) {
		_buttonSelected = true;
		break;
	}
}

if(_buttonSelected || InputCheck(e_input.KEYBOARD, "confirm")) {
	menuOptions[pos].selected = true;
	_buttonSelected = true;
	show_debug_message("Input selected. Input mode: " + string(menuOptions[pos].btnType))
	exit;
}