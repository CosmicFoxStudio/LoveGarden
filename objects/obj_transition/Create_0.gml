/// @description 
global.midTransition = false;
roomTarget = undefined;
seqInst = noone;
type = noone;

// ---------------------------------- METHODS ---------------------------------- //
// OBS: Methods used as moments CANNOT have parameters

//seqPause = SequencePause(seqInst);
//seqResume = SequenceUnpause(seqInst);

seqTest = function TransitionTest() {
	show_debug_message("transition test!!!!");	
}

// Pauses the sequence for a bit
seqAction = function TransitionAction() {
	SequencePause(seqInst);
	ExecuteTimedAction(0.2, SequenceUnpause, [seqInst]);
	show_debug_message("Transition Action Ran.");
}

// Destroys the sequence and resets all variables
seqEnd = function TransitionFinished() {
	layer_sequence_destroy(seqInst);

	global.midTransition = false;
	roomTarget = undefined;
	seqInst = noone; 
	type = noone;
}

// Changes room (check Room Start Event)
// WARNING: This function was added as a moment, meaning, it will run inside the scope of the sequence
seqChangeRoom = function TransitionRoom() {
	show_debug_message("Should change rooms");
	// SequencePause(self.elementID);
	// room_goto(obj_transition.roomTarget);
}

// For normal transition sequences (just the VFX with no room change)
Transition = function TransitionSet() {
	if (!global.midTransition) {
        global.midTransition = true;
		
		// Call transition
		seqInst = LayerPlaceSequence(type, "Transition");
		
		// Create 2 keyframes to place moments
		var _k = array_create(2);
		
		// Middle Frame
		_k[0] = sequence_keyframe_new(seqtracktype_moment);
		_k[0].frame = 30;

		// Last Frame
		_k[1] = sequence_keyframe_new(seqtracktype_moment);
		_k[1].frame = 60;

		// Create keyframe data (needs to be an array, I think)
		var _d1 = array_create(1);
		_d1[0] = sequence_keyframedata_new(seqtracktype_moment);
		_d1[0].channel = 0;
		
		var _d2 = array_create(1);
		_d2[0] = sequence_keyframedata_new(seqtracktype_moment);
		_d2[0].channel = 0;
		
		// Add the moment function to the sequence struct
		_d1[0].event = method(_d1[0], seqAction);
		_d2[0].event = method(_d2[0], seqEnd);
		
		// Add the data to each keyframe's channels
		_k[0].channels = _d1; // Added the seqAction to the Middle Frame
		_k[1].channels = _d2; // Added the seqEnd to the Last Frame

		seqInst.momentKeyframes = _k;
	}
}

/// Makes a screen transition when going from one room to another
// Creates the transition and end at the middle point
/// Returns: Boolean, indicating whether the transition was successful or not
ChangeRoom = function TransitionSetRoom() {	
	if (!global.midTransition) {
        global.midTransition = true;
		
		// Create 2 keyframes to place moments
		var _k = array_create(2);
		
		// Middle Frame
		_k[0] = sequence_keyframe_new(seqtracktype_moment);
		_k[0].frame = 30;

		// Last Frame
		_k[1] = sequence_keyframe_new(seqtracktype_moment);
		_k[1].frame = 60;

		// Create keyframe data (needs to be an array, I think)
		var _d1 = array_create(1);
		_d1[0] = sequence_keyframedata_new(seqtracktype_moment);
		_d1[0].channel = 0;
		
		// ------------- CHANGE ROOM ------------- //
		// Add the moment function to the sequence struct
		_d1[0].event = method(_d1[0], seqChangeRoom);
		
		// Add the data to each keyframe's channels
		_k[0].channels = _d1; // Added the seqAction to the Middle Frame

		// Get the sequence asset index and assign the data to it
		var _seq = sequence_get(type);
		_seq.momentKeyframes = _k;
		
		// Create the sequence
		seqInst = LayerPlaceSequence(type, "Transition");
		
        return true;
    }
    else {
		show_debug_message("Trying to transition in the middle of another transition!");	
		return false;
	}
}
