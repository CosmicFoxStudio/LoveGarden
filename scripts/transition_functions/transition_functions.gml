// Called whenever we want to go from one room to another, using any combination of in/out sequences
function TransitionStart(_room_target, _type_out, _type_in) {
	if (!global.midTransition) {
		global.midTransition = true;
		global.roomTarget = _room_target;
		TransitionPlaceSequence(_type_out);
		layer_set_target_room(_room_target)
		TransitionPlaceSequence(_type_in);
		layer_reset_target_room();
		return true;
	}
	else return false
}

// Places the sequences in the room
function TransitionPlaceSequence(_type) {
	if (layer_exists("Transition")) layer_destroy("Transition")
	var _layer = layer_create(-9999,"Transition")
	layer_sequence_create(_layer, 0, 0, _type);	
}

//Called as a moment at the end of an "Out" transition sequence
function TransitionChangeRoom() {
	room_goto(global.roomTarget);
}

//Called as a moment at the end of an "In" transition sequence
function TransitionFinished() {
	layer_sequence_destroy(self.elementID);
	global.midTransition = false;
}


/* 
OBS: 
	Don't forget to call the appropriate "moment" function in the last frame of the sequence
	Usually it will be TransitionFinished() in the fade in sequence
	And TransitionChangeRoom() in the fade out sequence
*/