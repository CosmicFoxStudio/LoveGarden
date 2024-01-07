// Changes the game state and updates the previous state
function GameChangeState(_newState) {
	// Store the current state as the previous state
	if (_newState != global.state) {
		global.statePrevious = global.state;
	}
	
	// Change to the new state
	global.state = _newState;
}
