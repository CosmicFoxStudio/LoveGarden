// Feather disable all

// Function to prevent repeating these lines
function UpdateChatterbox() {
	node = ChatterboxGetCurrent(chatterbox);
	text = ChatterboxGetContent(chatterbox, 0);
}

// Searches for the background layer and changes to it
function BackgroundSetIndex(_index) {
	var lay_id = layer_get_id("Background");
	var back_id = layer_background_get_id(lay_id);
	
	layer_background_index(back_id, _index);
}

// Chatterbox function to change rooms
function NextRoom(_room) {
	//show_debug_message(_room);
	if (asset_get_type(_room) == asset_room) {
		TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, asset_get_index(_room)); 
	}
	else {
		show_debug_message("(ERROR) Wrong asset name.")
		return false;
	}
}

function SetMap(_mapBool) {
	global.isMapOn = _mapBool;
}

// Function to choose character on screen
function CharacterOnScreen(_name) {
	var sprite = noone;
	if (_name) == "maple" {
		sprite = spr_maple;
	}
	else if (_name) == "ype" {
		sprite = spr_ype;
	}
	else if (_name) == "caru" {
		sprite = spr_caru;
	}
	else if (_name) == "mamba" {
		sprite = spr_fern;
	}
	else if (_name) == "orange" {
		sprite = spr_orange;
	}
	else if (_name) == "nanne" {
		sprite = spr_nanne;
	}
	else if (_name) == "cali" {
		sprite = spr_cali;
	}
	else if (_name) == "void" {
		sprite = spr_noone;
	}
	//else {
	//	sprite = spr_noone;
	//}

	obj_characters.chara = sprite;
}

// Function to choose the character's expression to be displayed (needs improvements!!)
function CharacterExpressionOnScreen(_num) {
	array_push(obj_characters.characterExpression, _num);
}

// PLAYER STATS
function StatsGetWilting() {
	return global.playerStats.wilting;
}

// PLAYER STATS
function StatsGetGrowth() {
	return global.playerStats.growth;
}

// SO STATS
function StatsGetBlossom(_SOName) {
	switch (_SOName) {
	    case "ype":
			return global.NPCs[e_SO.YPE].blossom;
	    break;
	    case "caru":
			return global.NPCs[e_SO.CARU].blossom;
	    break;
	    case "rose":
			return global.NPCs[e_SO.ROSE].blossom;
	    break;
	    case "clove":
			return global.NPCs[e_SO.CLOVE].blossom;
	    break;
	    case "hydra":
			return global.NPCs[e_SO.HYDRA].blossom;
	    break;
	    default:
			show_debug_message("(ERROR) Incorrect SO name.");
	    break;
	}
	
	return -1;
}


// SO STATS
function StatsAddBlossom(_SOName, _value) {
		switch (_SOName) {
	    case "ype":
			global.NPCs[e_SO.YPE].blossom += _value;
	    break;
	    case "caru":
			global.NPCs[e_SO.CARU].blossom += _value;
	    break;
	    case "rose":
			global.NPCs[e_SO.ROSE].blossom += _value;
	    break;
	    case "clove":
			global.NPCs[e_SO.CLOVE].blossom += _value;
	    break;
	    case "hydra":
			global.NPCs[e_SO.HYDRA].blossom += _value;
	    break;
	    default:
			show_debug_message("(ERROR) Incorrect SO name.");
	    break;
	}
	
	return true;
}

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
	return true;
}

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

function FlagGet(_name) {
    // Check if the flag exists before attempting to retrieve its value
    if (struct_exists(global.flags, _name)) {
        return global.flags[_name];
    } else {
        // Flag doesn't exist
        return undefined;
    }
}

function ProcessMetadata(_metadata) {
	var once = false;
	
	if (once == false) {
	    if (array_length(_metadata) > 0) {
	        // WILTING - Adds/removes points from PLAYER'S "wilting" stats
	        if (_metadata[0] != "") { 
	            //global.playerStats.wilting = WrapInside(obj_wilting_bar.fillBar + real(_metadata[0]), 0, 10); 
	            //obj_wilting_bar.fillBar = global.playerStats.wilting; 
	            once = true;
	        }
	        // GROWTH - Add/remove points from PLAYER'S "growth" stats
	        if (_metadata[1] != "") { 
	            //global.playerStats.growth = WrapInside(obj_growth_bar.fillBar + real(_metadata[1]), 0, 10); 
	            //obj_growth_bar.fillBar = global.playerStats.growth; 
	            once = true;
	        }
	        // FLAG - Enter the name of the flag
	        if (_metadata[2] != "") {
				// Important: Flags are automatically set to true when used as metadata
	            FlagSet(_metadata[2]);
	            once = true;
	        }
	    }
	}
}

function NextDay() {
	global.day += 1;
	global.currentDaytime = e_daytime.MORNING;
}

function NextDaytime() {
	global.currentDaytime += 1;
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