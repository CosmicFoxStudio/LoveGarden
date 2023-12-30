/// @description Controller for button input

// Re-check array length
//option_length = array_length(buttonArray);

// Previous position to check for changes
var prevPos = pos;

pos += CheckVerticalInput();

// Check if the position has changed
if (prevPos != pos) {
    audio_play_sound(snd_menu_beep, 0, false, 1, 0, random_range(0.8, 1.2));
}

// Wrap menu
if (pos >= optionLength) pos = 0; // goes back to the first pos
if (pos < 0) pos = optionLength - 1; // goes to the last pos

// Keyboard Input
if (global.SPACE_CONFIRM) {
    ExecuteButtonAction(pos);
}

// Mouse Input - Check if the mouse is hovering any of the buttons
for (var i = 0; i < optionLength; i++) {
    var currentButton = buttonArray[i];

    // Check if the mouse is hovering over the current button
    if (instance_position(mouse_x, mouse_y, currentButton)) {
        if (global.MOUSE_CONFIRM && currentButton.hovering) {
            ExecuteButtonAction(currentButton.btnType);
        }
    }
}
