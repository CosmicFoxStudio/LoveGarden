// Called whenever we want to go from one room to another, using any combination of in/out sequences
function TransitionSet(_typeOut, _typeIn, _style = "", _roomTarget = undefined) {
	global.transitionTypeOut = _typeOut;
	global.transitionTypeIn = _typeIn;
	switch(_style) {
		case "CHANGE_ROOM":
			global.roomTarget = _roomTarget;
			
			// Call out-transition
			TransitionOut();
			
			// Assures it will call the in-transition only when next room loads
			if (_roomTarget != undefined) layer_set_target_room(_roomTarget);
			TransitionIn();
			
			if (_roomTarget != undefined) {
	            layer_reset_target_room();
	        }
		break;
		
		// Just do the effect
		default:
			TransitionOut();
		break;
	}
}

function TransitionAction() {
	if (global.roomTarget != undefined) {
		TransitionChangeRoom();
	}
	else {
		TransitionPlaceSequence(global.transitionTypeIn);
	}
	layer_sequence_destroy(self.elementID);
}

function TransitionOut() {
	if (!global.midTransition) {
		global.midTransition = true;
		TransitionPlaceSequence(global.transitionTypeOut);
	}
}

function TransitionIn() {
	TransitionPlaceSequence(global.transitionTypeIn);
}

function TransitionPlaceSequence(_type) {
	var _layer;
	// Places the sequences in the specified temporary layer in the room
	if (layer_exists("Transition")) {
		_layer = layer_get_id("Transition");
	}
	else {
		_layer = layer_create(-9999,"Transition");
	}
	layer_sequence_create(_layer, 0, 0, _type);	
}

//Called as a moment at the end of an "Out" transition sequence
function TransitionChangeRoom() {
	// Change Room if target room is not undefined
	room_goto(global.roomTarget);
}

//Called as a moment at the end of an "In" transition sequence
function TransitionFinished() {
	layer_sequence_destroy(self.elementID);
	// Every sequence placed in the layer is destroyed when the layer is destroyed
	//if (layer_exists("Transition")) layer_destroy("Transition");
	global.midTransition = false;
	global.roomTarget = undefined;
	global.transitionTypeOut = noone;
	global.transitionTypeIn = noone;
}


/* 
OBS: 
	Don't forget to call the appropriate "moment" function in the last frame of the sequence
	Usually it will be TransitionFinished() in the fade in sequence
	And TransitionChangeRoom() in the fade out sequence
*/