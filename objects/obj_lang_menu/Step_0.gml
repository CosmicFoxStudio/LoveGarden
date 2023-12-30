// Select Phase
if (phase == "SELECT") {
	// Keyboard Input - Move inside menu
	pos += CheckVerticalInput();

	// Wrap menu
	if (pos >= optionLength) pos = 0; // goes back to first pos
	if (pos < 0) pos = optionLength - 1; // goes to last pos

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

	// Choose a language
	if ( (isMouseHoveringMenu && global.MOUSE_CONFIRM) || global.SPACE_CONFIRM) {
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
	    if (global.MOUSE_CONFIRM) {
			selectedButton = "CANCEL";
			
		}
	} else if (confirmButtonIsHovering) { // Mouse entered right button area
		// Change appearance when hovering
		confirmButton.selected = true;
		posButtons = 1;
	    
		// Player confirmed the selection
		if (global.MOUSE_CONFIRM) {
			selectedButton = "CONFIRM";
		}
	}

	// MOUSE LEAVE LOGIC
	/*
	if (!cancelButtonIsHovering) {  
		// Mouse left the left button - Button goes back to unselected appearance
		cancelButton.selected = false;
	}
	
	if (!confirmButtonIsHovering) { 
		//  Mouse left the right button - Button goes back to unselected appearance
		confirmButton.selected = false;
	}
	*/
	
	// Keyboard Input
	posButtons += CheckHorizontalInput();
	
	// Wrap buttons
	var numberOfButtons = 2;
	if (posButtons >= numberOfButtons) posButtons = 0; // goes back to first pos
	if (posButtons < 0) posButtons = numberOfButtons - 1; // goes to last pos
	
	// ------------------------- Confirm Input ------------------------- //
	if (global.SPACE_CONFIRM) {
		// Player cancelled the selection
		if (posButtons == 0) {
			selectedButton = "CANCEL";
		}
		// Player confirmed the selection
		else if (posButtons == 1) {
			selectedButton = "CONFIRM";
	    }
	}
	
	// ------------------------- Cancel Input ------------------------- //
	if (global.BACKSPACE_CANCEL) {
		selectedButton = "CANCEL";
	}
}

// Goes back to Select Phase
if (selectedButton == "CANCEL") {
	phase = "SELECT";
	selectedButton = "NONE";
			
	// Reset Button State
	// confirmButton.unavailable = true;	
}

// Goes to next room
if (selectedButton == "CONFIRM") {
	phase = "SELECT";
	selectedButton = "NONE";
	
	// (Should probably call a screen transition in here)
	room_goto_next();
}
