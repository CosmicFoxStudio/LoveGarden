// Adds a certain number of actions
function GameAddAction(_actionsToAdd) {
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

// Goes back to the title screen and changes game state
function GameBackToTitle() {
	room_goto(rm_title);
	GameChangeState(e_gameStates.LEAVE);
}

// Searches for the background layer and changes to it
function BackgroundSetIndex(_index) {
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	
	layer_background_index(back_id, _index);
	show_debug_message("Bg index should be: " + string(_index));
}

// Function to choose character on screen
function CharacterOnScreen(_name) {
    // Set the character sprite based on the provided name
    obj_characters.chara = global.characterSprites[$ _name];
}

// Function to draw shadow character
function CharacterShadowOnScreen(_name) {
    // Set the character sprite based on the provided name
    obj_characters.chara = global.characterSprites[$ _name];
}

// Function to choose the character's expression to be displayed
function CharacterExpressionOnScreen(_num) {
	obj_characters.characterExpression = _num;
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

// Adds or removes hearts to romanceable characters relationship bars
function ChangeRelationshipBar(_name, _value) {
	// TO DO
}

// Checks relationship bars of romanceable characters
function GetRelationshipBar(_name) {
	// TO DO
}

// Increments by 1 global.day and set global.currentDaytime to morning
function NextDay() {
	global.day += 1;
	global.currentDaytime = e_daytime.MORNING;
}

// Increments by 1 global.currentDaytime
function NextDaytime() {
	switch (global.currentDaytime) {
		case e_daytime.MORNING: global.currentDaytime = e_daytime.NOON; break;
		case e_daytime.NOON: global.currentDaytime = e_daytime.AFTERNOON; break;
		case e_daytime.AFTERNOON: global.currentDaytime = e_daytime.NIGHT; break;
		case e_daytime.NIGHT: break;
		default: break;
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

// -----------------------------------------------------------------------------  //
// Useful functions that are not called in .yarn files

// Function to prevent repeating these lines
function UpdateChatterbox() {
	node = ChatterboxGetCurrent(chatterbox);
	text = ChatterboxGetContent(chatterbox, 0);
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