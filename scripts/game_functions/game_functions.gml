// This function checks the DEBUGGING macro to allow DEBUG_DRAWER to do its magic
// When in test mode, DEBUGGING should be flagged as true to help with debug in real time
// Final build should have the DEBUGGING macro flagged as false
function Debug() {
	var d = DEBUGGING;
	if (d) return true;
}
