/// Called whenever we want to go from one room to another, using any combination of in/out sequences

/// Returns: Boolean, indicating whether the transition was successful or not
/// @param _typeOut		"Out" transition sequence
/// @param _typeIn		"In" transition sequence
/// @param _roomTarget  The room to teleport to
function TransitionSetRoom(_typeOut, _typeIn, _roomTarget) {	
	if (!global.midTransition) {
        global.midTransition = true;
        global.roomTarget = _roomTarget;
        TransitionPlaceSequence(_typeOut);
		
		// Assures it will call the in-transition only when next room loads
        if (_roomTarget != undefined) layer_set_target_room(_roomTarget);
        TransitionPlaceSequence(_typeIn);
		
		// Resets target room
        if (_roomTarget != undefined) layer_reset_target_room();
		
        return true;
    }
    else {
		show_debug_message("Trying to transition in the middle of another transition!");	
		return false;
	}
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

// Called as a moment at the end of an "Out" transition sequence
function TransitionChangeRoom() {
	room_goto(global.roomTarget);
}

//Called as a moment at the end of an "In" transition sequence or in normal transition sequences
function TransitionFinished() {
	layer_sequence_destroy(self.elementID);
	// Every sequence placed in the layer is destroyed when the layer is destroyed
	//if (layer_exists("Transition")) layer_destroy("Transition");
	global.midTransition = false;
	global.roomTarget = undefined;
}

function TransitionPause(_seq = self.elementID) {
	layer_sequence_pause(_seq);
}

function TransitionUnpause(_seq = self.elementID) {
	layer_sequence_play(_seq);	
}

function TransitionAction(_seq = self.elementID) {
	TransitionPause(_seq);
	ExecuteTimedAction(0.5, TransitionUnpause, [_seq]);
	show_debug_message("Transition Action Ran.");
}

// For normal transition sequences
function TransitionSet(_type = sq_trans_fade_white) {
	if (!global.midTransition) {
        global.midTransition = true;
		// Call transition
		TransitionPlaceSequence(_type);
	}
}

// function CreateTransitionSequence() {} 



/* 
OBS: 
	Don't forget to call the appropriate "moment" function in the last frame of the sequence
	Usually it will be TransitionFinished() in the fade in transition sequence or normal transition sequences
	And TransitionChangeRoom() in the fade out sequence
*/