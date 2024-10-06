if (global.state == e_gameStates.PAUSED) exit;

if (is_animating) {
    // Animate the scale by increasing until it reaches 1
    scale_x = lerp(scale_x, 1, animation_speed);
    scale_y = lerp(scale_y, 1, animation_speed);
    
    // Stop animating once the scale reaches close to 1
    if (scale_x > 0.99 && scale_y > 0.99) {
        scale_x = 1;
        scale_y = 1;
        is_animating = false;
    }
}

/*
// Select Phase
if (phase == "SELECT") {
	
	// ----------------------------- KEYBOARD INPUT ----------------------------- //
	pos += CheckVerticalInput();

	// Wrap menu
	if (pos >= optionLength) pos = 0; // goes back to first pos
	if (pos < 0) pos = optionLength - 1; // goes to last pos
	
	
	// ---------------------- ------- MOUSE INPUT ------------------------------- //
	// Mouse Input - Handle mouse hover
	var isMouseHoveringMenu = false;
	for (var i = 0; i < optionLength; i++) {
		var button_y = y + optionMargin * i;

		// Checking if mouse cursor is inside boundaries of lang menu
		if (mouse_x >= x && mouse_x <= x + width &&
		    mouse_y >= button_y && mouse_y <= button_y + optionMargin) {
			isMouseHoveringMenu = true;
		    pos = i;
			break; // Exit the loop once it finds a hovered option
		}
		else {
			isMouseHoveringMenu = false;
		}	
	}
	
	// -------------------------------------------------------------------------- //

	// Choose a language
	if	( InputCheck("confirm", e_input.MOUSE) && isMouseHoveringMenu ) || 
		(InputCheck("confirm", e_input.KEYBOARD) ) {
		switch(pos) {
			case 0: 
				phase = "CONFIRM";
				global.lang = "en";
				exit;
			break;
	
			case 1: 
				phase = "CONFIRM";
				global.lang = "pt";
				exit;
			break;
		}
	}
}

// Confirm Phase
if (phase == "CONFIRM") {
	
	// Make buttons available
	cancelButton.unavailable = false;
	confirmButton.unavailable = false;
	
	// ---------------------- ------- MOUSE INPUT ------------------------------- //
	cancelButtonIsHovering = cancelButton.hovering;
	confirmButtonIsHovering = confirmButton.hovering;

	// MOUSE ENTER LOGIC
	if (cancelButtonIsHovering) { // Mouse entered left button area
		// Change appearance when hovering
		cancelButton.selected = true; 
		posButtons = 0;
		
		// Player cancelled the selection
		if ( InputCheck("confirm", e_input.MOUSE) ) {
			selectedButton = "CANCEL";
		}
			
	} else if (confirmButtonIsHovering) { // Mouse entered right button area
		// Change appearance when hovering
		confirmButton.selected = true;
		posButtons = 1;
	    
		// Player confirmed the selection
		if ( InputCheck("confirm", e_input.MOUSE) ) {
			selectedButton = "CONFIRM";
		}
	}
		
	// ----------------------------- KEYBOARD INPUT ----------------------------- //
	posButtons += CheckHorizontalInput();
	
	// Wrap buttons
	var numberOfButtons = 2;
	if (posButtons >= numberOfButtons) posButtons = 0; // goes back to first pos
	if (posButtons < 0) posButtons = numberOfButtons - 1; // goes to last pos
	
	// Confirm
	if ( InputCheck("confirm", e_input.KEYBOARD) ) {
		// Player cancelled the selection
		if (posButtons == 0) {
			selectedButton = "CANCEL";
		}
		// Player confirmed the selection
		else if (posButtons == 1) {
			selectedButton = "CONFIRM";
		}
	}
	
	// Cancel
	if ( InputCheck("cancel", e_input.KEYBOARD) ) {
		selectedButton = "CANCEL";
	}
}

// ------------------------ BACK TO SELECT PHASE ------------------------ //
if (selectedButton == "CANCEL") {
	phase = "SELECT";
	selectedButton = "NONE";
}

// ----------------------------- NEXT ROOM  ----------------------------- //
if (selectedButton == "CONFIRM") {
	phase = "SELECT";
	selectedButton = "NONE";
	
	// Destroy itself
	global.langMenu = false;
	instance_destroy(obj_lang_selection);
	instance_destroy(obj__btn);
	instance_destroy();
}
*/