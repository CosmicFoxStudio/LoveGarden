/// @description Controller for button input

if (global.state == e_gameStates.PAUSED || global.midTransition) exit;

// Previous position to check for changes
var prevPos = pos;

if (global.inputMode == e_input.KEYBOARD) {
	pos += CheckVerticalInput();
}

// Check if the position has changed
if (prevPos != pos) {
    audio_play_sound(snd_menu_beep, 0, false, 1, 0, random_range(0.8, 1.2));
}

// Wrap menu
if (pos >= optionLength) pos = 0; // goes back to the first pos
if (pos < 0) pos = optionLength - 1; // goes to the last pos

// Keyboard Input
if (global.inputMode == e_input.KEYBOARD) {
	if ( InputCheck(e_input.KEYBOARD, "confirm") ) {
	    ExecuteButtonAction(pos);
	}
}

// Mouse Input - Check if the mouse is hovering any of the buttons
if (global.inputMode == e_input.MOUSE) {
	for (var i = 0; i < optionLength; i++) {
	    var currentButton = buttonArray[i];

	    // Check if the mouse is hovering over the current button
	    if (IsHovering(currentButton)) {
	        if ( InputCheck(e_input.MOUSE, "confirm") ) {
	            ExecuteButtonAction(currentButton.btnType);
	        }
	    }
	}
}