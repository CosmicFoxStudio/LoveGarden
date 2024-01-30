// Create a sequence in a specified layer
function LayerPlaceSequence(_type, _layer = "Sequence") {
	// Places the sequences in the specified temporary layer in the room
	if (layer_exists(_layer)) {
		_layer = layer_get_id(_layer);
	}
	else {
		_layer = layer_create(-9999, _layer);
	}
	
	// Returns the sequence element ID
	return layer_sequence_create(_layer, ORIGIN_X, ORIGIN_Y, _type);	
}

function SequencePause(_seq = self.elementID) {
	layer_sequence_pause(_seq);
}

function SequenceUnpause(_seq = self.elementID) {
	layer_sequence_play(_seq);	
}

// function CreateTransitionSequence() {} 
