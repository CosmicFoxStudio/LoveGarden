// Changes the game state and updates the previous state
function GameChangeState(_newState) {
	// Store the current state as the previous state
	if (_newState != global.state) {
		global.statePrevious = global.state;
	}
	
	// Change to the new state
	global.state = _newState;
}

function GameCreateUI() {
	if (global.state == e_gameStates.CONTINUE_GAME) {
		// Create the obj_ui_controller if it doesn't already exist
		if (!instance_exists(obj_ui_controller)) {
			instance_create_layer(0, 0, "Instances_Above", obj_ui_controller);	
		}
	}
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

function DefineStats() constructor {
	wilting = 0;
	growth = 0;
	blossom = 0;
	humor = 0;
}

function DecideRoomName() {
	switch (global.rmCurrent) {
	    case "rm_dormroom":
			global.location = "Dormroom";
	    break;
		case "rm_dormitory":
			global.location = "Dormitory Orange";
	    break;
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
