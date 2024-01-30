/// @description Check if ended

if (layer_sequence_is_finished(seqInst)) {
	layer_sequence_destroy(seqInst);

	global.midTransition = false;
	roomTarget = undefined;
	seqInst = noone; 
	type = noone;	
}
