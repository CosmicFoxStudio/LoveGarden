if (global.state == e_gameStates.PAUSED) exit;

// Select Phase
if (phase == "SELECT") {
	// ----------------------------- KEYBOARD INPUT ----------------------------- //
	pos += CheckVerticalInput();

	// Wrap menu
	if (pos >= optionLength) pos = 0; // goes back to first pos
	if (pos < 0) pos = optionLength - 1; // goes to last pos
	
	// ----------------------------- MOUSE INPUT ----------------------------- //


	// Mouse Input - Handle mouse hover
	if (global.inputMode == e_input.MOUSE) {
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
	}
	
	// ------------------------------------------------------------------------ //

	// Choose a language
	if	( InputCheck(e_input.MOUSE, "confirm") && isMouseHoveringMenu ) || 
		(InputCheck(e_input.KEYBOARD, "confirm") ) {
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
		
	// Mouse Input
	cancelButtonIsHovering = cancelButton.hovering;
	confirmButtonIsHovering = confirmButton.hovering;
	
	// Make buttons available
	cancelButton.unavailable = false;
	confirmButton.unavailable = false;

	// MOUSE ENTER LOGIC
	if (cancelButtonIsHovering) { // Mouse entered left button area
		// Change appearance when hovering
		cancelButton.selected = true; 
		posButtons = 0;
		
	    // Player cancelled the selection
	    if ( InputCheck("mouse", "confirm") ) {
			selectedButton = "CANCEL";
			
		}
	} else if (confirmButtonIsHovering) { // Mouse entered right button area
		// Change appearance when hovering
		confirmButton.selected = true;
		posButtons = 1;
	    
		// Player confirmed the selection
		if ( InputCheck("mouse", "confirm") ) {
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
	if ( InputCheck(e_input.KEYBOARD, "confirm") ) {
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
	if ( InputCheck(e_input.KEYBOARD, "cancel")) {
		selectedButton = "CANCEL";
	}
}

// ------------------------ BACK TO SELECT PHASE ------------------------ //
if (selectedButton == "CANCEL") {
	phase = "SELECT";
	selectedButton = "NONE";
}

//  ------------------------ NEXT ROOM  ------------------------ //
if (selectedButton == "CONFIRM") {
	phase = "SELECT";
	selectedButton = "NONE";
	
	// Call a screen transition
	if (!global.midTransition) {
		var target = room_next(room);
		TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, target);
	}
}
