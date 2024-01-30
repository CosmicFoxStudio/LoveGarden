// Changes the game state and updates the previous state
function GameChangeState(_newState) {
	// Store the current state as the previous state
	if (_newState != global.state) {
		global.statePrevious = global.state;
	}
	
	// Change to the new state
	global.state = _newState;
}

/*
function GameTransition(_type = sq_trans_fade_black) {
	obj_transition.type = _type;
	obj_transition.Transition();
}
*/

function GameTransitionChangeRoom(_roomTarget = room_next(room), _type = sq_trans_fade_black) {
	if (!global.midTransition) {
		obj_transition.type = _type;
		obj_transition.roomTarget = _roomTarget;
		obj_transition.ChangeRoom();
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

function GameBackToTitle() {
	room_goto(rm_title);
	GameChangeState(e_gameStates.LEAVE);
}

function GameAddAction() {
    // Get the maximum actions for the current day
    var maxActionsForDay = global.maxActions[global.day];

    // Add a new action, except if the player has reached the maximum actions for the day
    if (global.actions[global.day] < maxActionsForDay) {
        global.actions[global.day] += 1;
    }
}

// Handles keyboard input for valid letters (A-Z, a-z)
function ReceivePlayerInput(_stringToCheck) {
	if (keyboard_lastkey != -1) {
	    var pressedChar = keyboard_lastchar;

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
	    case "rm_dormroom":
			global.location = "Dormroom";
			break;
		case "rm_dormitory":
			global.location = "Dormitory";
			break;
		case "rm_restaurant":
			global.location = "Food Court";
			break;
		case "rm_courtyard":
			global.location = "Courtyard";
			break;
		case "rm_school":
			global.location = "School";
			break;
		case "rm_classroom":
			global.location = "Classroom";
			break;
		case "rm_gazebo":
			global.location = "Gazebo";
			break;
		case "rm_test":
			global.location = "Test Zone";
			break;
		case "rm_boat":
		case "rm_init":
		case "rm_lang":
		case "rm_template":
		case "rm_title":
		case "rm_dream":
		case "rm_file_selection":
		case "rm_campus_map":
	    default:
			global.location = "Nowhere";
			break;
	}
}
