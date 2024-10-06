/// @description 

if (!instance_exists(owner)) instance_destroy();

var _tween_value;	// Init var
var _tween_change = (end_value - tween_start_value);

#region Tweening
if (tween_time < duration) {
	// Do the tween
	_tween_value = script_execute(tween_type, tween_time, tween_start_value, _tween_change, duration);
	tween_time++;
	
	variable_instance_set(owner, variable_string, _tween_value);
}
else { // Tweening is over (tween_time == duration)
	variable_instance_set(owner, variable_string, end_value);
	instance_destroy();
}

lifetime++;

#endregion Tweening