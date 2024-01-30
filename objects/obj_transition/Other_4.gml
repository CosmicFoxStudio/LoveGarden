/// @description Fade in

// Create the fade in, and also reset variables
if (global.midTransition) {
	// Create the same sequence once again
	seqInst = LayerPlaceSequence(type, "Transition");
	
	// But this time with the playback starting one frame after the middle one
	layer_sequence_headpos(seqInst, SEQ_MIDDLE_FRAME + 1);
}
