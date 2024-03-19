// Turn on map during a scene
if (global.isMapOn && mapButtonOn == false && global.roomType == e_roomTypes.SCENES) {
	instance_create_layer(560, ORIGIN_Y, "Instances_Above", obj_ui_btn_map);
	mapButtonOn = true;
}

// Turn off map during a scene
if (!global.isMapOn && mapButtonOn == true && global.roomType == e_roomTypes.SCENES) {
	array_delete(buttonsList, 1, 1);
	instance_destroy(obj_ui_btn_map);
	mapButtonOn = false;
}

// Keyboard input to use the buttons
if (global.roomType == e_roomTypes.SCENES && global.inputMode == e_input.KEYBOARD && global.state != e_gameStates.MENU) {
	if (InputCheck("start", e_input.KEYBOARD))
		global.keyboardIcons = !global.keyboardIcons;
		
	// Move through options
	pos += CheckHorizontalInput();

	// Wrap menu
	optionLength = array_length(buttonsList);
	if (pos >= optionLength) pos = 0; // goes back to first pos
	if (pos < 0) pos = optionLength - 1; // goes to last pos
		
	if (global.keyboardIcons) {
		for (var i = 0; i < array_length(buttonsList); ++i) {
			if (i == pos)
				buttonsList[i].image_index = 1;
			else
				buttonsList[i].image_index = 0;
		}
		
		// Choose the button
		if (InputCheck("confirm", e_input.KEYBOARD) && global.state == e_gameStates.CONTINUE_GAME) {
			buttonsList[pos].doAction = true;
		} else if (global.state == e_gameStates.RESUME) {
			GameChangeState(e_gameStates.CONTINUE_GAME);
		}
		
	} else {
		for (var i = 0; i < array_length(buttonsList); ++i) {
			buttonsList[i].image_index = 0;
		}
	}
}

// Changing game state after closing menu when using mouse
if (global.inputMode == e_input.MOUSE && global.state == e_gameStates.RESUME) {
	GameChangeState(e_gameStates.CONTINUE_GAME);
}