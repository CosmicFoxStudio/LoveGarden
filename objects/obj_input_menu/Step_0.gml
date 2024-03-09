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

if(_buttonSelected || 
	InputCheck(e_input.KEYBOARD, "confirm") || 
	InputCheck(e_input.KEYBOARD, "start")
) {
	menuOptions[pos].selected = false;
	_buttonSelected = false;
	global.inputMode = menuOptions[pos].btnType;
	global.keybind = obj_game.KeybindingCreate(global.inputMode);
	GameTransitionChangeRoom(rm_lang, sq_trans_fade_white);
}