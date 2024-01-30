/// @description Initialize methods
global.midTransition = false;
roomTarget = undefined;
seqInst = noone;
type = noone;

// ---------------------------------- METHODS ---------------------------------- //
// OBS: Methods used as moments in sequences CANNOT have parameters

#region DO NOT CALL THESE
// Unused
//seqPause = SequencePause(seqInst);
//seqResume = SequenceUnpause(seqInst);

// Pauses the sequence for a bit
seqAction = function TransitionAction(_seq = self.elementID) {
	SequencePause(_seq);
	ExecuteTimedAction(obj_timer_transition, 0.2, SequenceUnpause, [_seq]);
	//show_debug_message("Transition Action Ran.");
}

// Destroys the sequence and resets all variables
seqEnd = function(_seq = self.elementID) {
	layer_sequence_destroy(_seq);

	global.midTransition = false;
	obj_transition.roomTarget = undefined;
	obj_transition.seqInst = noone; 
	obj_transition.type = noone;
}

// Changes room (check Room Start Event)
// WARNING: This function was added as a moment, meaning, it will run inside the scope of the sequence
seqChangeRoom = function(_seq = self.elementID) {
	SequencePause(_seq);
	room_goto(obj_transition.roomTarget);
	//show_debug_message("Changing rooms...");
}
#endregion DO NOT CALL THESE

#region CALL THESE
// For normal transition sequences (just the VFX with no room change)
Transition = function() {
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
		
		var _d2 = array_create(1);
		_d2[0] = sequence_keyframedata_new(seqtracktype_moment);
		_d2[0].channel = 0;
		
		// Add each moment functions to the sequence struct
		_d1[0].event = method(_d1[0], seqAction);
		_d2[0].event = method(_d2[0], seqEnd);
		
		// Add the data to each keyframe's channels
		_k[0].channels = _d1; // Added the seqAction to the Middle Frame
		_k[1].channels = _d2; // Added the seqEnd to the Last Frame

		// Get the sequence asset index and assign the data to it
		var _seq = sequence_get(type);
		_seq.momentKeyframes = _k;
		
		// Create the sequence
		seqInst = LayerPlaceSequence(type, "Transition");
	}
}

/// Makes a screen transition when going from one room to another
// The sequence pauses at the middle point (gets automatically destroyed in room change)
/// Returns: Boolean, indicating whether the transition was successful or not
ChangeRoom = function() {	
	if (!global.midTransition) {
        global.midTransition = true;
		
		// Create 1 keyframe to place a moment
		var _k = array_create(1);
		
		// Middle Frame
		_k[0] = sequence_keyframe_new(seqtracktype_moment);
		_k[0].frame = SEQ_MIDDLE_FRAME;

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
#endregion CALL THESE
