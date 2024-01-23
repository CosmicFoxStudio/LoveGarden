/// @description Decrement timer

if (timer > 0) {
	timer--;
	
     var s = timer / DT;

    show_debug_message("(TIMER) Seconds remaining: " + string(s));
}
else {
	// Execute function with args
	if (is_array(args)) ScriptExecuteAlt(func, args);
	
	// Destroy object if timer ends
	instance_destroy();	
}
