// OnFinished broadcast message from sq_logo
if (event_data[? "event_type"] == "sequence event") {
	// If screen transition has finished
    if (event_data[? "message"] == "OnTransitionFinished") {
		// Start Alarms
        alarm[0] = 40; // jump to stage 2, header text moves in
		alarm[1] = 120; // After 1.20 seconds, jump to stage 3, fade in header text
    }
}
