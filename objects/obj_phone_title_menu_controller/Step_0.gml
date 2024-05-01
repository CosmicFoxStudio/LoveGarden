/// @description Controller for button input

if (global.state == e_gameStates.PAUSED || global.midTransition) exit;

// Previous position to check for changes
var prevPos = pos;

pos += CheckVerticalInput();

// Check if the position has changed
if (prevPos != pos) {
	buttonArray[prevPos].keyboardSelection = false;
    audio_play_sound(snd_menu_beep, 0, false, 1, 0, random_range(0.8, 1.2));
}

// Wrap menu
if (pos >= optionLength) pos = 0; // goes back to the first pos
if (pos < 0) pos = optionLength - 1; // goes to the last pos

buttonArray[pos].keyboardSelection = true;

// Keyboard Input
if ( InputCheck("confirm", e_input.KEYBOARD) ) {
	ExecuteButtonAction(buttonArray[pos].btnType);
}


// Mouse Input - Check if the mouse is hovering any of the buttons
for (var _i = 0; _i < optionLength; _i++) {
	var currentButton = buttonArray[_i];

	// Check if the mouse is hovering over the current button
	if (IsHovering(currentButton)) {
		buttonArray[pos].keyboardSelection = false;
		currentButton.keyboardSelection = true;
		pos = _i;
		
	    if ( InputCheck("confirm", e_input.MOUSE) ) {
	        ExecuteButtonAction(currentButton.btnType);
	    }
	}
}
