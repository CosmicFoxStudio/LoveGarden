// Define the constructor function
function EventDefinition(_yarnPath, _location, _scenesArray, _eventType) {
    // Create a new event object
    var newEvent = {
        yarn: _yarnPath,
        location: _location,
        scenes: _scenesArray,
        visited: false
    };
    
    // Add the new event to the appropriate event type list
    switch (_eventType) {
        case "canon":
            array_push(global.events.canon, newEvent);
            break;
        case "bonus":
            array_push(global.events.bonus, newEvent);
            break;
        default:
            show_error("Invalid event type: " + string(_eventType), true);
    }
}

// Character Constructor
function CharaDefinition(_id, _name, _romanceable = false) constructor {
	myid = _id;
	name = _name;
	expressions = {};
	if (_romanceable) hearts = 0;
	
	// Loop through the emotions list and construct the sprite names
	for (var i = 0; i < array_length(global.emotions[myid]); i++) {
	    var emotion = global.emotions[myid][i];
	    var spriteName = "spr_" + name + "_" + string(i); // + "_" + emotion
	    var spriteAsset = asset_get_index(spriteName);

	    if (spriteAsset != -1) {  // Check if the sprite exists
			struct_set(expressions, emotion, spriteAsset);
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
