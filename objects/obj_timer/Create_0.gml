/// Change the duration in seconds and the function + its arguments by calling ExecuteTimedAction()
seconds = 2;
timer = seconds * DT; // 60 FPS
args = undefined;
func = function() {
	show_debug_message("Counter has ended but obj_timer has no assigned function.")
};
