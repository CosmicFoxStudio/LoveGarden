/// @description Fade in

// Create the fade in, and also reset variables

if (global.midTransition) {

	// Create a keyframe on the Last Frame
	/*
	var _k = array_create(1);	
	_k[0] = sequence_keyframe_new(seqtracktype_moment);
	_k[0].frame = 60;
		
	// Create keyframe data
	var _d = array_create(1);
	_d[0] = sequence_keyframedata_new(seqtracktype_moment);
	_d[0].channel = 0;
	
	 // Add the moment function to the sequence struct
	_d[0].event = method(_d[0], seqEnd);
	
	// Get the sequence asset index and assign the data to it
	var _seq = sequence_get(type);
	_seq.momentKeyframes = _k;
	*/
	
	// Create the same sequence once again
	seqInst = LayerPlaceSequence(type, "Transition");
	
	// But this time with the playback starting at the middle
	// layer_sequence_headpos(seqInst, 30);
}

show_debug_message("obj_transition - Room Start Event Runs");
