if (canInitialize) {
	if (!initialized) {
		// Centralizar e equalizar posição com a do menu
	    x = obj_lang_menu.x;
	    targetY = obj_lang_menu.y;
	    y = targetY;
	    initialized = true;
	}
}

var selectedOption = obj_lang_menu.pos;

// Check if the selected option has changed
if (selectedOption != previousSelectedOption) {
    // Update target position based on the new selection
    targetY = obj_lang_menu.y + obj_lang_menu.optionMargin * selectedOption;
    
    // Save the current selected option for the next frame
    previousSelectedOption = selectedOption;
}
	// Apply tweening effect to the y-coordinate
	y += (targetY - y) * tweenSpeed;
