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
	    case "ype":
			global.routes[e_SO.YPE] = true;
	    break;
	    case "caru":
			global.routes[e_SO.CARU] = true;
	    break;
	    case "rose":
			global.routes[e_SO.ROSE] = true;
	    break;
	    case "clove":
			global.routes[e_SO.CLOVE] = true;
	    break;
	    case "hydra":
			global.routes[e_SO.HYDRA] = true;
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

// Function to put character on screen
function CharacterOnScreen(_name, _position = 0) {
    // Set the character sprite based on the provided name and position
	switch (_position) {
		case 0: obj_characters.chara0 = global.characterSprites[$ _name]; break;
		case 1: obj_characters.chara1 = global.characterSprites[$ _name]; break;
		case 2: obj_characters.chara2 = global.characterSprites[$ _name]; break;
		default: break;
	}
}

// Function to choose a character's expression to be displayed
function CharacterExpressionOnScreen(_num, _position = 0) {
	obj_characters.charactersExpression[_position] = _num;
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
function ChangeRelationshipBar(_name, _value = 1) {
	switch (_name) {
	    case "player":
			global.playerStats.hearts += _value;
			if (global.playerStats.hearts > 8) global.playerStats.hearts = 8;
			if (global.playerStats.hearts < -8) global.playerStats.hearts = -8;
	    break;
	    case "ype":
			global.NPCs[e_SO.YPE].hearts += _value;
			if (global.NPCs[e_SO.YPE].hearts > 8) global.NPCs[e_SO.YPE].hearts = 8;
			if (global.NPCs[e_SO.YPE].hearts < -8) global.NPCs[e_SO.YPE].hearts = -8;
	    break;
	    case "caru":
			global.NPCs[e_SO.CARU].hearts += _value;
			if (global.NPCs[e_SO.CARU].hearts > 8) global.NPCs[e_SO.CARU].hearts = 8;
			if (global.NPCs[e_SO.CARU].hearts < -8) global.NPCs[e_SO.CARU].hearts = -8;
	    break;
	    case "rose":
			global.NPCs[e_SO.ROSE].hearts += _value;
			if (global.NPCs[e_SO.ROSE].hearts > 8) global.NPCs[e_SO.ROSE].hearts = 8;
			if (global.NPCs[e_SO.ROSE].hearts < -8) global.NPCs[e_SO.ROSE].hearts = -8;
	    break;
	    case "clove":
			global.NPCs[e_SO.CLOVE].hearts += _value;
			if (global.NPCs[e_SO.CLOVE].hearts > 8) global.NPCs[e_SO.CLOVE].hearts = 8;
			if (global.NPCs[e_SO.CLOVE].hearts < -8) global.NPCs[e_SO.CLOVE].hearts = -8;
	    break;
	    case "hydra":
			global.NPCs[e_SO.HYDRA].hearts += _value;
			if (global.NPCs[e_SO.HYDRA].hearts > 8) global.NPCs[e_SO.HYDRA].hearts = 8;
			if (global.NPCs[e_SO.HYDRA].hearts < -8) global.NPCs[e_SO.HYDRA].hearts = -8;
	    break;
	    default:
	       show_debug_message("(ERROR) Incorrect name.");
	    break;
	}
}

// Checks relationship bars of romanceable characters (and player for now)
function GetRelationshipBar(_name) {
	switch (_name) {
	    case "player":
			return global.playerStats.hearts;
	    break;
	    case "ype":
			return global.NPCs[e_SO.YPE].hearts;
	    break;
	    case "caru":
			return global.NPCs[e_SO.CARU].hearts;
	    break;
	    case "rose":
			return global.NPCs[e_SO.ROSE].hearts;
	    break;
	    case "clove":
			return global.NPCs[e_SO.CLOVE].hearts;
	    break;
	    case "hydra":
			return global.NPCs[e_SO.HYDRA].hearts;
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
}

// Increments by 1 global.currentDaytime
function NextDaytime(_manual = 0) {
	if (_manual == 0) {
		// Automatic daytime
		switch (global.currentDaytime) {
			case e_daytime.MORNING: global.currentDaytime = e_daytime.NOON; break;
			case e_daytime.NOON: global.currentDaytime = e_daytime.AFTERNOON; break;
			case e_daytime.AFTERNOON: global.currentDaytime = e_daytime.NIGHT; break;
			case e_daytime.NIGHT: break;
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

// Function to prevent repeating these lines
function UpdateChatterbox() {
	node = ChatterboxGetCurrent(chatterbox);
	text = ChatterboxGetContent(chatterbox, 0);
	obj_characters.currentSpeaker = ChatterboxGetContentSpeaker(chatterbox, 0);
	speaker = ChatterboxGetContentSpeaker(chatterbox, 0);
	global.textComplete = false;
}

// Get filename dynamically
function LoadDialogueFiles() {
	show_debug_message("Looking " + working_directory + "scenes/" + "*.yarn");
	var fileCounter = 0;
	var fileName = file_find_first(working_directory + "scenes/" + "*.yarn", fa_none);
	show_debug_message("File found: " + string(fileName));
	ChatterboxLoadFromFile("scenes/" + fileName);
	array_push(global.dialogueList, "scenes/" + fileName);
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

function GetCharacterColor(_sprite, _speaker) {
	if (_speaker == "" || _speaker == "PLAYER" || _speaker == "???") return c_white;
	else if ((_sprite == spr_ype) && (_speaker == "YPE" || _speaker == "IPÊ")) return c_white;
	else if ((_sprite == spr_caru) && (_speaker == "CARU" || _speaker == "CARU")) return c_white;
	else if ((_sprite == spr_rose) && (_speaker == "ROSE" || _speaker == "ROSA")) return c_white;
	else if ((_sprite == spr_clove) && (_speaker == "CLOVE" || _speaker == "CRAVO")) return c_white;
	else if ((_sprite == spr_hydra) && (_speaker == "HYDRANGEA" || _speaker == "HORTÊNSIA")) return c_white;
	else if ((_sprite == spr_fern) && (_speaker == "FERN" || _speaker == "MAMBA")) return c_white;
	else if ((_sprite == spr_orange) && (_speaker == "MR. ORANGE" || _speaker == "LARANJEIRA")) return c_white;
	else if ((_sprite == spr_maple) && (_speaker == "MAPLE" || _speaker == "MAPLE")) return c_white;
	else if ((_sprite == spr_noone) && (_speaker == "" || _speaker == "")) return c_white;
	else return #808080;
}

function GetCharacterTextColor(_currentSpeaker) {
	if (_currentSpeaker == "PLAYER" || _currentSpeaker == "PLAYER") return "[c_text_player]";
	if (_currentSpeaker == "YPE" || _currentSpeaker == "IPÊ") return "[c_text_ype]";
	else if (_currentSpeaker == "CARU" || _currentSpeaker == "CARU") return "[c_text_caru]";
	else if (_currentSpeaker == "ROSE" || _currentSpeaker == "ROSA") return "[c_text_rose]";
	else if (_currentSpeaker == "CLOVE" || _currentSpeaker == "CRAVO") return "[c_text_clove]";
	else if (_currentSpeaker == "HYDRANGEA" || _currentSpeaker == "HORTÊNSIA") return "[c_text_hydra]";
	else if (_currentSpeaker == "FERN" || _currentSpeaker == "MAMBA") return "[c_text_fern]";
	else if (_currentSpeaker == "MR. ORANGE" || _currentSpeaker == "LARANJEIRA") return "[c_text_orange]";
	else if (_currentSpeaker == "MAPLE" || _currentSpeaker == "MAPLE") return "[c_text_cyan]";
	else if (_currentSpeaker == "" || _currentSpeaker == "") return "[c_text_cyan]";
	else return "[c_text_cyan]";
}

function GetCharacterTextColorRGB(_currentSpeaker) {
	if (_currentSpeaker == "PLAYER" || _currentSpeaker == "PLAYER") return TEXT_PLAYER;
	if (_currentSpeaker == "YPE" || _currentSpeaker == "IPÊ") return TEXT_YPE;
	else if (_currentSpeaker == "CARU" || _currentSpeaker == "CARU") return TEXT_CARU;
	else if (_currentSpeaker == "ROSE" || _currentSpeaker == "ROSA") return TEXT_ROSE;
	else if (_currentSpeaker == "CLOVE" || _currentSpeaker == "CRAVO") return TEXT_CLOVE;
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
