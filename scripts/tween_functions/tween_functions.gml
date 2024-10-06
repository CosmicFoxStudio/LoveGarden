/// @desc tween_ext(_var, _target, _duration, _type)				
/// @param _var	
/// @param _var_as_string
/// @param _end_value	
/// @param _duration			
/// @param _tween_type
// This function assigns the received arguments to the newly created tweener instance
function tween_ext(_var, _var_as_string, _target, _duration, _type) {
	// The id of the object
	var _id = id;
	var _tweener = instance_create_layer(0, 0, "Controllers", obj_tweener);
	
	with (_tweener) {
		variable = _var;
		variable_string = _var_as_string;
		end_value = _target;
		duration = _duration;
		tween_type = _type;
		
		tween_start_value = _var;
		owner = _id;
	}
	
	return  (_tweener);
}

/// @desc tween_linear(_time, _start, _change, _duration)
/// @param _time				(current time)
/// @param _start				(start value)
/// @param _change			(target - start value)	
/// @param _duration			(how long it lasts)
// No easing, no acceleration
function tween_linear(_time, _start, _change, _duration) {
		return (_change*_time/_duration + _start);
}
