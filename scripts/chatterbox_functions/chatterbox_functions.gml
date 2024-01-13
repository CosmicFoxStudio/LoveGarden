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
	obj_characters.characterExpression = _num;
}

function StatsGetWilting() {
	return global.playerStats.wilting;
}

function StatsGetGrowth() {
	return global.playerStats.growth;
}

function StatsGetBlossom() {
	return global.playerStats.blossom;
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

function processMetadata(_metadata) {
	var once = false;
	
	if (once == false) {
	    if (array_length(_metadata) > 0) {
			/*
	        // EXPRESSION - Index of the subimage (frame) of the character sprite (UNUSED)
	        if (_metadata[0] != "") {
	            CharacterExpressionOnScreen(real(_metadata[0]));
	            once = true;
	        }
			*/
			
	        // WILTING - Adds/removes points from the "wilting" stats
	        if (_metadata[0] != "") { 
	            //global.playerStats.wilting = WrapInside(obj_wilting_bar.fillBar + real(_metadata[1]), 0, 10); 
	            //obj_wilting_bar.fillBar = global.playerStats.wilting; 
	            once = true;
	        }
	        // GROWTH - Add/remove points from the "growth" stats
	        if (_metadata[1] != "") { 
	            //global.playerStats.growth = WrapInside(obj_growth_bar.fillBar + real(_metadata[2]), 0, 10); 
	            //obj_growth_bar.fillBar = global.playerStats.growth; 
	            once = true;
	        }
	        // BLOSSOM - Add/remove points from "blossom" stats
	        if (_metadata[2] != "") { 
	            //global.playerStats.blossom = WrapInside(obj_blossom_bar.fillBar + real(_metadata[3]), 0, 10); 
	            //obj_blossom_bar.fillBar = global.playerStats.blossom; 
	            once = true;
	        }
	        // SOUND - Enter the name of the sound asset
	        if (_metadata[3] != "" && _metadata[3] != "0") {
	            audio_play_sound(asset_get_index(_metadata[3]), 10, false);
	            once = true;
	        }
	        // FLAG - Enter the name of the flag
	        if (_metadata[4] != "") {
				// Important: Flags are automatically set to true when used as metadata
	            FlagSet(_metadata[4]);
	            once = true;
	        }
	    }
	}
}

// Get filename dynamically
function LoadDialogueFiles() {
	show_debug_message("Looking " + working_directory + "scenes/" + "*.yarn");
	var fileCounter = 0;
	var fileName = file_find_first(working_directory + "scenes/" + "*.yarn", fa_archive);
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