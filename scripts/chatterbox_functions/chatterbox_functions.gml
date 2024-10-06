// Adds a certain number of actions
function AddAction(_actionsToAdd = 1) {
    // Get the maximum actions for the current day
    var maxActionsForDay = global.maxActions[global.day];
	
	// Add new actions
	global.actions[global.day] += _actionsToAdd;

    // If the player has reached the maximum actions for the day
    if (global.actions[global.day] >= maxActionsForDay)
        global.actions[global.day] = maxActionsForDay;
	
	// Actions cannot be a negative number
	if (global.actions[global.day] < 0)
        global.actions[global.day] = 0;
}

// Assign a character route
function RouteAssign(_SOName) {
	switch (_SOName) {
	    case "ipe":
			global.routes[e_chara.IPE] = true;
	    break;
	    case "caru":
			global.routes[e_chara.CARU] = true;
	    break;
		case "carna":
			global.routes[e_chara.CARNA] = true;
	    break;
	    case "rose":
			global.routes[e_chara.ROSE] = true;
	    break;
	    case "hydra":
			global.routes[e_chara.HYDRA] = true;
	    break;
	    default:
	       show_debug_message("(ERROR) Incorrect SO name.");
	    break;
	}
}

// Searches for the background layer and changes to it
function BackgroundSetIndex(_index) {
	var lay_id = layer_get_id("Bg");
	var arr = layer_get_all_elements(lay_id);
	
	// Debug1
	var sprite;
	for (var i = 0; i < array_length(arr); i++;) {
		sprite = arr[i];
		if (layer_get_element_type(sprite) == layerelementtype_sprite) {
			var name = sprite_get_name(sprite);
			show_debug_message("Last BG was: " + name);
		}
	}
	
	// Change sprite BG
	layer_sprite_change(sprite, global.roomBGMap[? global.rmCurrent][_index]);
	
	// Debug2
	for (var i = 0; i < array_length(arr); i++;) {
		if (layer_get_element_type(sprite) == layerelementtype_sprite) {
			var name = sprite_get_name(sprite);
			show_debug_message("Current BG is: " + name);
		}
	}
}

// Function to manage the characters on the screen
function CharacterOnScreen(_position = 0, _name_or_expression = "", _name = "") {
    // Validate position
    if (_position < 0 || _position > 2) {
        show_debug_message("(ERROR) Invalid position: " + string(_position));
        return false;
    }

    // Handle "void" case
    if (_name_or_expression == "void") {
		obj_characters.chara[_position] = noone;
		obj_characters.charaExpression[_position] = spr_noone;
		return true;
    }

    var character, expression;
    
    // Determine if the input is for clearing or setting character
    if (_name == "") {
        // If no _name is provided, last character is kept
        character = obj_characters.chara[_position];
        expression = _name_or_expression;
    } else {
        // If _name is provided, character is replaced
        character = global.chara[$ _name];
        expression = _name_or_expression; 
    }

    // Validate character
    if (character == noone || character == undefined) {
        show_debug_message("(ERROR) Character not defined: " + string(character));
        return false;
    }

    // Get the sprite index for the given expression
    var spriteAsset = character.expressions[$ expression];

    // Validate sprite asset
    if (spriteAsset == undefined) {
        show_debug_message("(ERROR) Expression not found: " + expression);
        return false;
    }

    // Set the character's sprite and expression at the given position
    obj_characters.chara[_position] = character;
    obj_characters.charaExpression[_position] = spriteAsset;
    return true;
}


/// Use time sources to make the dialogue wait. 
/// Useful when running an animation, a transition or showing a cutscene. 
function DialogueWait(_seconds) {
    // Convert seconds to frames
    var frames = _seconds * DT; // 60 frames per second
	
    ChatterboxWait(CHATTERBOX_CURRENT);
	
    show_debug_message("Waiting chatterbox for " + string(frames) + " frames...");
	
    time_source_start(time_source_create(time_source_game, frames, time_source_units_frames, function(_chatterbox) {
        show_debug_message("...continuing chatterbox!");
        ChatterboxContinue(_chatterbox);
    },
    [CHATTERBOX_CURRENT]));
}

// Adds or removes hearts to romanceable characters relationship bars (and player for now)
function ChangeRelationship(_name, _value = 1) {
	switch (_name) {
	    case "player":
			global.my_hearts += _value;
			if (global.my_hearts > 8) global.my_hearts = 8;
			if (global.my_hearts < -8) global.my_hearts = -8;
	    break;
	    case "ipe":
			global.chara.ipe.hearts += _value;
			if (global.chara.ipe.hearts > 8) global.chara.ipe.hearts = 8;
			if (global.chara.ipe.hearts < -8) global.chara.ipe.hearts = -8;
	    break;
	    case "caru":
			global.chara.caru.hearts += _value;
			if (global.chara.caru.hearts > 8) global.chara.caru.hearts = 8;
			if (global.chara.caru.hearts < -8) global.chara.caru.hearts = -8;
	    break;
	    case "carna":
			global.chara.carna.hearts += _value;
			if (global.chara.carna.hearts > 8) global.chara.carna.hearts = 8;
			if (global.chara.carna.hearts < -8) global.chara.carna.hearts = -8;
	    break;
		case "rose":
			global.chara.rose.hearts += _value;
			if (global.chara.rose.hearts > 8) global.chara.rose.hearts = 8;
			if (global.chara.rose.hearts < -8) global.chara.rose.hearts = -8;
	    break;
	    case "hydra":
			global.chara.hydra.hearts += _value;
			if (global.chara.hydra.hearts > 8) global.chara.hydra.hearts = 8;
			if (global.chara.hydra.hearts < -8) global.chara.hydra.hearts = -8;
	    break;
	    default:
	       show_debug_message("(ERROR) Incorrect name.");
	    break;
	}
}

// Checks relationship bars of romanceable characters (and player for now)
function GetRelationship(_name) {
	switch (_name) {
	    case "player":
			return global.my_hearts;
	    break;
	    case "ipe":
			return global.chara.ipe.hearts;
	    break;
	    case "caru":
			return global.chara.caru.hearts;
	    break;
	    case "carna":
			return global.chara.carna.hearts;
	    break;		
	    case "rose":
			return global.chara.rose.hearts;
	    break;
	    case "hydra":
			return global.chara.hydra.hearts;
	    break;
	    default:
	       show_debug_message("(ERROR) Incorrect name.");
	    break;
	}
}

// Increments by 1 global.day and set global.currentDaytime to morning
function NextDay() {
	global.day += 1;
	global.currentDaytime = e_daytime.MORNING;
	UpdateRoomYarnMap();
	show_debug_message("Next Day");
}

// Increments by 1 global.currentDaytime
function NextDaytime(_manual = 0) {
	if (_manual == 0) {
		// Automatic daytime
		switch (global.currentDaytime) {
			case e_daytime.MORNING: global.currentDaytime = e_daytime.NOON; break;
			case e_daytime.NOON: global.currentDaytime = e_daytime.AFTERNOON; break;
			case e_daytime.AFTERNOON: global.currentDaytime = e_daytime.NIGHT; break;
			case e_daytime.NIGHT: global.currentDaytime = e_daytime.MORNING; break;
			default: break;
		}
	}
	else {
		// Manually assign daytime
		global.currentDaytime = _manual;
	}
}

// Chatterbox function to change rooms
function NextRoom(_room) {
	if (asset_get_type(_room) == asset_room) {
		GameTransitionChangeRoom(asset_get_index(_room), sq_trans_fade_black);
	}
	else {
		show_debug_message("(ERROR) Wrong asset name.")
	}
}

// Sets a value to a flag
function FlagSet(_name, _value = true) {
    // Check if _value is a boolean (true or false)
    if (is_bool(_value)) {
        // Assign the boolean value directly to the flag
        global.flags[$ _name] = _value;
    } else {
        // Increment the numeric flag based on the sign of _value
        global.flags[$ _name] += sign(_value);
    }
}

// Returns the value of a given flag
function FlagGet(_name) {
    // Check if the flag exists before attempting to retrieve its value
    if (struct_exists(global.flags, _name)) {
        return global.flags[$ _name];
    } else {
        // Flag doesn't exist
        return undefined;
    }
}

// Transition VFX
function DialogueTransition() {
	GameTransition(sq_trans_fade_black);
}

// Change background using transition
function BackgroundWaitTransition(_index) {
	var seq = sequence_get(sq_trans_fade_black);
	var frames = seq.length;
	
    ChatterboxWait(CHATTERBOX_CURRENT);
	
    show_debug_message("Waiting chatterbox for " + string(frames) + " frames...");
	
	GameTransition(sq_trans_fade_black);
	
    time_source_start(time_source_create(time_source_game, frames, time_source_units_frames, function(_chatterbox) {
        show_debug_message("...continuing chatterbox!");
        ChatterboxContinue(_chatterbox);
		obj_node_controller.UpdateChatterbox();
    },
    [CHATTERBOX_CURRENT]));
	
	time_source_start(time_source_create(time_source_game, frames, time_source_units_frames, function(_indexBG) {
		BackgroundSetIndex(_indexBG);
		global.changeCalendarDaytime = true;
	},
	[_index]));
}

// Get current place
function GetCurrentPlace() {
	return global.location;
}

// -----------------------------------------------------------------------------  //
// Useful functions that are not called in .yarn files

// Get filename dynamically
function LoadDialogueFiles() {
	show_debug_message("Looking " + working_directory + "scenes/" + "*.yarn");
	var fileCounter = 0;
	var fileName = file_find_first(working_directory + "scenes/" + "*.yarn", fa_none);
	show_debug_message("File found: " + string(fileName));
	ChatterboxLoadFromFile("scenes/" + fileName);
	array_push(global.dialogueList, "scenes/" + fileName); // Add to dialogueList array
	while (fileName != "") {
		fileName = file_find_next();
		if (fileName == "") break;
		show_debug_message("File found: " + string(fileName));
		ChatterboxLoadFromFile("scenes/" + fileName);
		array_push(global.dialogueList, "scenes/" + fileName);
		fileCounter += 1;
	}
	file_find_close();
}

function UpdateRoomYarnMap() {
	// Assign yarn files based on game mode
	var yarnPrefix;
	var dayPrefix = string(global.day);

    // Initialize yarnPrefix based on game mode
    switch (global.gameMode) {
        case e_gameMode.DEMO:
            yarnPrefix = "scenes/demo_";
            global.roomYarnMap[? "rm_test_dialogue"] = yarnPrefix + "day0_test.yarn";
            global.roomYarnMap[? "rm_dormitory"] = yarnPrefix + "day1_dormitory.yarn";
            global.roomYarnMap[? "rm_boat"] = yarnPrefix + "day1_boat.yarn";
            global.roomYarnMap[? "rm_sciences"] = yarnPrefix + "day1_sciences.yarn";
            global.roomYarnMap[? "rm_central"] = yarnPrefix + "day1_central.yarn";
            break;

        case e_gameMode.TEASER:
            yarnPrefix = "scenes/teaser.yarn";
            global.roomYarnMap[? "rm_dormitory"] = yarnPrefix;
            global.roomYarnMap[? "rm_boat"] = yarnPrefix;
            global.roomYarnMap[? "rm_sciences"] = yarnPrefix;
            global.roomYarnMap[? "rm_central"] = yarnPrefix;
            break;

        case e_gameMode.RELEASE:
        default:
            yarnPrefix = "scenes/main_";
            global.roomYarnMap[? "rm_test_dialogue"] = yarnPrefix + "day0_test.yarn";
            global.roomYarnMap[? "rm_dormitory"] = yarnPrefix + "day" + dayPrefix + "_dormitory.yarn";
            global.roomYarnMap[? "rm_boat"] = yarnPrefix + "day" + dayPrefix + "_boat.yarn";
            global.roomYarnMap[? "rm_sciences"] = yarnPrefix + "day" + dayPrefix + "_sciences.yarn";
            global.roomYarnMap[? "rm_central"] = yarnPrefix + "day" + dayPrefix + "_central.yarn";
            break;
    }
}

// Function to get initial node based on daytime
function InitialNode() {
	switch (global.currentDaytime) {
		case e_daytime.MORNING: return "Morning"; break;
		case e_daytime.NOON: return "Noon"; break;
		case e_daytime.AFTERNOON: return "Afternoon"; break;
		case e_daytime.NIGHT: return "Night"; break;
		default: return "Dawn"; break;
	}
}

// (TO-DO) The character who's not currently talking will be drawn with a grey overlay
function GetCharacterColor(_sprite, _speaker) {
	if (_speaker == "" || _speaker == "PLAYER" || _speaker == "???") return c_white;
	else if (_speaker == "IPE" || _speaker == "IPÊ") return c_white;
	else if (_speaker == "CARU" || _speaker == "CARU") return c_white;
	else if (_speaker == "ROSE" || _speaker == "ROSA") return c_white;
	else if (_speaker == "CARNA" || _speaker == "CRAVO") return c_white;
	else if (_speaker == "HYDRANGEA" || _speaker == "HORTÊNSIA") return c_white;
	else if (_speaker == "FERN" || _speaker == "MAMBA") return c_white;
	else if (_speaker == "MR. ORANGE" || _speaker == "LARANJEIRA") return c_white;
	else if (_speaker == "MAPLE" || _speaker == "MAPLE") return c_white;
	else if (_speaker == "" || _speaker == "") return c_white;
	else return #808080;
}

function GetCharacterTextColor(_currentSpeaker) {
	if (_currentSpeaker == "PLAYER" || _currentSpeaker == "PLAYER") return "[c_text_player]";
	if (_currentSpeaker == "IPE" || _currentSpeaker == "IPÊ") return "[c_text_ipe]";
	else if (_currentSpeaker == "CARU" || _currentSpeaker == "CARU") return "[c_text_caru]";
	else if (_currentSpeaker == "ROSE" || _currentSpeaker == "ROSA") return "[c_text_rose]";
	else if (_currentSpeaker == "CARNA" || _currentSpeaker == "CRAVO") return "[c_text_carna]";
	else if (_currentSpeaker == "HYDRANGEA" || _currentSpeaker == "HORTÊNSIA") return "[c_text_hydra]";
	else if (_currentSpeaker == "FERN" || _currentSpeaker == "MAMBA") return "[c_text_fern]";
	else if (_currentSpeaker == "MR. ORANGE" || _currentSpeaker == "LARANJEIRA") return "[c_text_orange]";
	else if (_currentSpeaker == "MAPLE" || _currentSpeaker == "MAPLE") return "[c_text_cyan]";
	else if (_currentSpeaker == "" || _currentSpeaker == "") return "[c_text_cyan]";
	else return "[c_text_cyan]";
}

function GetCharacterTextColorRGB(_currentSpeaker) {
	if (_currentSpeaker == "PLAYER" || _currentSpeaker == "PLAYER") return TEXT_PLAYER;
	if (_currentSpeaker == "IPE" || _currentSpeaker == "IPÊ") return TEXT_IPE;
	else if (_currentSpeaker == "CARU" || _currentSpeaker == "CARU") return TEXT_CARU;
	else if (_currentSpeaker == "ROSE" || _currentSpeaker == "ROSA") return TEXT_ROSE;
	else if (_currentSpeaker == "CARNA" || _currentSpeaker == "CRAVO") return TEXT_CARNA;
	else if (_currentSpeaker == "HYDRANGEA" || _currentSpeaker == "HORTÊNSIA") return TEXT_HYDRA;
	else if (_currentSpeaker == "FERN" || _currentSpeaker == "MAMBA") return TEXT_FERN;
	else if (_currentSpeaker == "MR. ORANGE" || _currentSpeaker == "LARANJEIRA") return TEXT_ORANGE;
	else if (_currentSpeaker == "MAPLE" || _currentSpeaker == "MAPLE") return CYAN;
	else if (_currentSpeaker == "" || _currentSpeaker == "") return CYAN;
	else return CYAN;
}

function EndGame() {
	game_end();
}

function EventProgress(_eventID = global.eventID) {
	// Next event
	_eventID = _eventID + 1;
	global.event = global.events[_eventID];
	global.eventID = _eventID;
}

function EventFinished() {
	
}