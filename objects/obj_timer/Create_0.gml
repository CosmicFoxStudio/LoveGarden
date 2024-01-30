/// Change the duration in seconds and the function + its arguments by calling ExecuteTimedAction()
seconds = 2;
timer = seconds;
name = (object_index == obj_timer) ? "obj_timer" : "obj_timer_children";
args = undefined;
func = function() {
	show_debug_message("Counter has ended but " + name + " has no assigned function.")
};
