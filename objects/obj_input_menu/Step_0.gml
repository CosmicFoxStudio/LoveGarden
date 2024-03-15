if (global.state == e_gameStates.PAUSED) exit;


if(InputCheck("confirm", e_input.MOUSE)) {
	show_debug_message("confirm pressed");
}
if(InputCheck("cancel", e_input.KEYBOARD)) {
	show_debug_message("cancel pressed");
}
if(InputCheck("start", e_input.GAMEPAD)) {
	show_debug_message("start pressed");
}
if(InputCheck("up")) {
	show_debug_message("up pressed");
}
if(InputCheck("down")) {
	show_debug_message("down pressed");
}
if(InputCheck("left")) {
	show_debug_message("left pressed");
}
if(InputCheck("right")) {
	show_debug_message("right pressed");
}

//menuOptions[pos].keyboardSelection = false;

//pos = (pos + CheckHorizontalInput()) % optionLength;
//if (pos < 0) pos = optionLength - 1;

//menuOptions[pos].keyboardSelection = true;

//for(var i =0; i < optionLength; i++) {
//	if(menuOptions[i].hovering) {
//		menuOptions[pos].keyboardSelection = false;
//		pos = i;
//		break;
//	}
//}

//var _buttonSelected = false;
//for(var i =0; i < optionLength; i++) {
//	if(menuOptions[i].selected) {
//		_buttonSelected = true;
//		break;
//	}
//}

//if(_buttonSelected || 
//	InputCheck("confirm", e_input.KEYBOARD) || 
//	InputCheck("start", e_input.KEYBOARD)
//) {
//	menuOptions[pos].selected = false;
//	_buttonSelected = false;
//	global.inputMode = menuOptions[pos].btnType;
//	global.keybind = obj_game.KeybindingCreate(global.inputMode);
//	GameTransitionChangeRoom(rm_lang, sq_trans_fade_white);
//}