// This script is for adding custom functions to be used with Scribble

// Typist flow control (pause the text if any of these conditions)
function TypistCheckPause(_typist) {
	if (global.state == e_gameStates.PAUSED || 
		global.state == e_gameStates.MENU || 
		global.state == e_gameStates.LEAVE || 
		global.midTransition) {
		_typist.pause();
		
		return true;
	}
	else {
		if (_typist.get_paused()) {
			_typist.unpause();
			
			// Clear the current keyboard and mouse states
			io_clear();
		}
	}
	return false;
}
