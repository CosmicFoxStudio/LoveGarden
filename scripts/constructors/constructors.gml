// Define the constructor function
function EventDefinition(_eventID, _yarnPath, _type, _day, _daytime, _music, _location, _scenesArray) {
    // Create a new event object
    var newEvent = {
		eventID: _eventID,
        yarn: _yarnPath,
		type: _type,
		day: _day,
        daytime: _daytime,
		music: _music,
		location: _location, 
        scenes: _scenesArray,
        visited: 0
    };
	
	// Add the new event to the event list
	array_push(global.events, newEvent);
        
	// show_error("Invalid event type: " + string(_type), true);
}

// Character Constructor
function CharaDefinition(_id, _name, _romanceable = false) constructor {
	myid = _id;
	name = _name;
	expressions = {};
	if (_romanceable) hearts = 0;
	/* [TO-DO]
	sprite = undefined;
	spriteName = "";
	prevSprite = undefined;
	prevSpriteName = "";
	visible = false;
	x = 0;
	y = 0;
	xscale = 1;
	yscale = 1;
	rot = 0;
	col = c_white;
	alpha = 0;
	alphaIncrease = 0.1;
	prevAlpha = 0;
	data = _data;
	expression = "";
	pose = "";
	*/
	
	// Loop through the emotions list and construct the sprite names
	for (var i = 0; i < array_length(global.emotions[myid]); i++) {
	    var emotion = global.emotions[myid][i];
	    var spriteName = "spr_" + name + "_" + string(i); // + "_" + emotion
	    var spriteAsset = asset_get_index(spriteName);

	    if (spriteAsset != -1) {
			variable_struct_set(expressions, emotion, spriteAsset);
	        // expressions[$ emotion] = spriteAsset;
	    } else {
	        show_debug_message("Sprite " + spriteName + " not found.");
	    }
	}
}

function KeybindingDefinition(_confirm=-1, _cancel=-1, _start=-1, _up=-1, _down=-1, _left=-1, _right=-1) constructor {
	confirm = _confirm;
	cancel = _cancel;
	start = _start;
	up = _up;
	down = _down;
	left = _left;
	right = _right;
}
