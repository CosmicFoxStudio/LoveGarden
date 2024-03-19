if (global.state == e_gameStates.PAUSED) exit;

menuOptions[pos].keyboardSelection = false;

pos = (pos + CheckHorizontalInput()) % optionLength;
if (pos < 0) pos = optionLength - 1;

menuOptions[pos].keyboardSelection = true;

for(var _i =0; _i < optionLength; _i++) {
	if(menuOptions[_i].hovering) {
		if(_i != pos) {
			//show_debug_message("Button hovering at pos: " + string(i));
			menuOptions[pos].keyboardSelection = false;
			pos = _i;
			break;
		}
	}
}

if((menuOptions[pos].hovering && InputCheck("confirm", e_input.MOUSE)) ||
	InputCheck("confirm", e_input.KEYBOARD) || InputCheck("start", e_input.KEYBOARD)
) {
	global.inputMode = menuOptions[pos].btnType;
	GameTransitionChangeRoom(rm_lang, sq_trans_fade_white);
}