// This script is for adding custom functions to be used with Scribble

// Typist flow control (pause the text if any of these conditions)
function TypistCheckPause() {
	if (global.state == e_gameStates.PAUSED || 
		global.state == e_gameStates.MENU || 
		global.state == e_gameStates.LEAVE || 
		global.midTransition) {
		typist.pause();
	}
	else typist.unpause();
}
