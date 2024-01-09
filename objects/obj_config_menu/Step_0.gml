/// @description Execute Actions

/*
How to access each property:
	menuPages[page][menuOption[page]].text		----> text
	menuPages[page][menuOption[page]].type		----> type
	menuPages[page][menuOption[page]].action	----> action
	menuPages[page][menuOption[page]].param1	----> param1
	menuPages[page][menuOption[page]].param2	----> param2
*/

var currentPage = menuPages[page];

// Can be 1 (moves down) or -1 (moves up) or 0 (not moving)
var verticalInput = global.PRESSED_DOWN - global.PRESSED_UP;

// Prevents moving to other elements when inputting in subpages
if (inputting) { 
	//var currentOption = menuOption[page]; // MAYBE PLACE THIS HERE?
	
	// REGISTERING ALTERNATIVE INPUTS AND AUDIO RESPONSE
	// (Usually when on a subpage and the element type is one of the following)
	switch(currentPage[menuOption[page]].type) {
		
		case e_menuElementType.SCRIPT_RUNNER :
			// No case for SCRIPT_RUNNER
		break;
		
		case e_menuElementType.PAGE_CHANGE :
			// No case for PAGE_CHANGE
		break;
		
		case e_menuElementType.SHIFT : // ( << >> )
			var horizontalInput = global.PRESSED_RIGHT - global.PRESSED_LEFT;
			if(horizontalInput != 0) {
				// Play audio
				audio_play_sound(snd_menu_beep, 1, false);

				currentPage[menuOption[page]].param1 += horizontalInput;
				
				// To clamp the value between the lenght of the options property 
				// The -1 at the end is to make it equal to the resulting value of var horizontalInput
				currentPage[menuOption[page]].param1 = clamp(
					currentPage[menuOption[page]].param1, 
					0, 
					array_length(currentPage[menuOption[page]].param2) - 1
				);
			}
		break;
		
		case e_menuElementType.SLIDER : // ( <------o---> )
			// Sound test
		//	switch(menuOption[page]) {
		//		case 0: 
		//			if (!audio_is_playing(snd_config_test_master)) { 
		//				audio_play_sound(snd_config_test_master, 1, false);	
		//			} 
		//		break; 
		//		case 1: 
		//			if(!audio_is_playing(snd_config_test_sfx))	{ 
		//				audio_play_sound(snd_config_test_sfx, 1, false);		
		//			} 
		//		break;
		//		case 2: 
		//			if(!audio_is_playing(snd_config_test_music)) { 
		//				audio_play_sound(snd_config_test_music, 1, false);	
		//			}
		//		break;
		//	}
			// Held input instead of pressed here for smooth gameplay
			var horizontalInput = global.HELD_RIGHT - global.HELD_LEFT;
			if(horizontalInput != 0) {
				// Makes the value a floating value between 0-1 (same as 0% to 100%)
				currentPage[menuOption[page]].param1 += horizontalInput*0.01; 
				
				// Clamping the value between 0 and 1
				currentPage[menuOption[page]].param1 = clamp(currentPage[menuOption[page]].param1, 0, 1);
				
				// Executes the ChangeVolume() script - Audio plays whenever input is happening for the slider
				script_execute(currentPage[menuOption[page]].action, currentPage[menuOption[page]].param1); 
			}
		break;

		case e_menuElementType.TOGGLE :
			var horizontalInput = global.PRESSED_RIGHT - global.PRESSED_LEFT;
			if(horizontalInput != 0) {
				// Play audio
				audio_play_sound(snd_menu_beep, 1, false);
				
				currentPage[menuOption[page]].param1 += horizontalInput;
				
				// To check whether the value is between index0, index1 and index2
				// And the "-1" at the end is to make it equal to the resulting value of var horizontalInput
				currentPage[menuOption[page]].param1 = clamp(
					currentPage[menuOption[page]].param1, 
					0, 
					array_length(currentPage[menuOption[page]].param2) - 1
				);
			}
		break;
	}
// If not currently inputting...
} else { 	
	// To stop misplaced music (sliders)
//	if audio_is_playing(snd_config_test_master) audio_stop_sound(snd_config_test_master);
//	if audio_is_playing(snd_config_test_sfx) audio_stop_sound(snd_config_test_sfx);
//	if audio_is_playing(snd_config_test_music) audio_stop_sound(snd_config_test_music);
	
	// Wrapping menu
	if(verticalInput != 0) {
		menuOption[page] += verticalInput;
		
		// If selection goes beyond last option, 
		if(menuOption[page] > array_length(currentPage) - 1) {
			// Go back to the top
			menuOption[page] = 0;		
		}
		
		// If selection goes beyond first option,
		if(menuOption[page] < 0) { 
			// Go back to the bottom
			menuOption[page] = array_length(currentPage) - 1;
		}
	}
}
// --------------------------------------------------------------------------------- //
// MAKE THINGS HAPPEN (EXECUTING SCRIPTS)
// Setting up scripts so they run and impact/change variables in the game 
if(global.PRESSED_CONFIRM) {
	// Checks for the type
	switch(currentPage[menuOption[page]].type) { 
		
		// Run a script assigned to the action property
		case e_menuElementType.SCRIPT_RUNNER : script_execute(currentPage[menuOption[page]].action); break;
		
		// Access a page assigned in type property of elements with the PAGE_CHANGE type
		case e_menuElementType.PAGE_CHANGE : 
			page = currentPage[menuOption[page]].action;
			break;
			
		case e_menuElementType.SLIDER :
		case e_menuElementType.SHIFT :
		case e_menuElementType.TOGGLE : 
			if (inputting) { 
				// Execute the action with the param1 value
				script_execute(currentPage[menuOption[page]].action, currentPage[menuOption[page]].param1); 
			}
		inputting = !inputting;
		// case e_menuElementType.input : inputting = !inputting;
	}

	// Play lil audio
	audio_play_sound(snd_menu_beep, 1, false);
}
