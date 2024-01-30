/// @description Fade in

// Create the fade in, and also reset variables
if (global.midTransition) {
	/*
	// Create a keyframe on the Last Frame
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
	
	// But this time with the playback starting one frame after the middle one
	layer_sequence_headpos(seqInst, SEQ_MIDDLE_FRAME + 1);
}
