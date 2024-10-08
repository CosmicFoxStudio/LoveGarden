// Changes the game state and updates the previous state
function GameChangeState(_newState) {
	// Store the current state as the previous state
	if (_newState != global.state) {
		global.statePrevious = global.state;
	}
	
	// Change to the new state
	global.state = _newState;
}

// For normal transition sequences (just the VFX with no room change)
function GameTransition(_type = sq_trans_fade_black) {
	obj_transition.type = _type;
	obj_transition.Transition();
}

/// Makes a screen transition when going from one room to another
/// Returns: Boolean, indicating whether the transition was successful or not
function GameTransitionChangeRoom(_roomTarget = room_next(room), _type = sq_trans_fade_black) {
	if (!global.midTransition) {
		obj_transition.type = _type;
		obj_transition.roomTarget = _roomTarget;
		return obj_transition.ChangeRoom();
	}
}

function GameCreateUI() {
	if (global.state == e_gameStates.CONTINUE_GAME) {
		// Create the obj_ui_controller if it doesn't already exist
		if (!instance_exists(obj_ui_controller)) {
			instance_create_layer(ORIGIN_X, ORIGIN_Y, "Instances_Above", obj_ui_controller);	
		}
	}
}

// Handles keyboard input for valid letters (A-Z, a-z)
function ReceivePlayerInput(_stringToCheck) {
	if (keyboard_lastkey != -1) {
	    var pressedChar = keyboard_lastchar;
		audio_play_sound(snd_cant, 1, false);

	    // Check if the pressed key's character is a valid letter (A-Z, counting uppercase and lowercase)
	    // string(ord()) returns the ASCII value of the char
	    // Allowed chars: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
	    var charCode = string(ord(pressedChar));
	    if ((charCode >= 65 && charCode <= 90) || (charCode >= 97 && charCode <= 122)) {
	        _stringToCheck += pressedChar;
	    }

	    // Reset
	    keyboard_lastkey = -1;
	    keyboard_lastchar = "";
	}	
	
	return _stringToCheck;
}

function ConvertDate(_date) {
    var day = date_get_day(_date);
    var month = date_get_month(_date);
    var year = date_get_year(_date);
    return  (day < 10 ? "0" : "") + string(day) + "/" +
            (month < 10 ? "0" : "") + string(month) + "/" +
			// Copy the 3rd and 4th characters of the year only (the last two)
            string_copy(string(year), 3, 2);
			
	// Alternative: 
	// date_datetime_string(date_current_datetime()) returns datetime and hour based on user system
}

// To display on save slot and file
function DecideRoomName() {
	switch (global.rmCurrent) {
		case "rm_dormitory":
			global.location = "Dormitory";
			break;
		case "rm_boat":
			global.location = "Boat";
			break;
		case "rm_sciences":
			global.location = "Science Dept.";
			break;
		case "rm_central":
			global.location = "Central Building";
			break;
		case "rm_lake":
			global.location = "Lake";
			break;
		case "rm_gazebo":
			global.location = "Gazebo";
			break;
		case "rm_test_dialogue":
		case "rm_test":
			global.location = "Test Zone";
			break;
		case "rm_init":
		case "rm_lang":
		case "rm_template":
		case "rm_title":
		case "rm_dream":
		case "rm_file_selection":
	    default:
			global.location = "Nowhere";
			break;
	}
}
