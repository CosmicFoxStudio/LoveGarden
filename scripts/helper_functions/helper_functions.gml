function ConvertGameModeToSaveFileString() {
	var mode;
	switch (global.gameMode) {
		case e_gameMode.RELEASE: mode ="save"; break;	
		case e_gameMode.DEMO: mode = "demo"; break;	
		case e_gameMode.TEASER: mode = "teaser"; break;
	}
	
	return mode;
}

/*	Returns:
	1 if the down key is pressed, 
	-1 if the up key is pressed, 
	0 if both or neither are pressed.
*/
function CheckVerticalInput() {
	var _returnValue = InputCheck("down") - InputCheck("up");
	//if(_returnValue != 0)
	//	show_debug_message("CheckVerticalInput: " + string(_returnValue));
	return _returnValue;
}

/*	Returns:
	1 if the right key is pressed, 
	-1 if the left key is pressed, 
	0 if both or neither are pressed.
*/
function CheckHorizontalInput() {
	var _returnValue = InputCheck("right") - InputCheck("left");
	//if(_returnValue != 0)
	//	show_debug_message("CheckHorizontalInput: " + string(_returnValue));
	return _returnValue;
}

// Goes back to the title screen and changes game state
function BackToTitle() {
	GameTransitionChangeRoom(rm_title, sq_trans_fade_black);
	
	GameChangeState(e_gameStates.LEAVE);
}

// Draws a rectangle starting from center, colors are changed and then reset
// Useful for creating textboxes
function DrawRectangleCenter(_xx, _yy, _width, _height, _outline, _color, _alpha) {
	var oldColor = draw_get_color();
	var oldAlpha = draw_get_alpha();
	
	draw_set_color(_color);
	draw_set_alpha(_alpha);
	
	draw_rectangle(_xx - _width/2, _yy - _height/2, _xx + _width/2, _yy + _height/2, _outline);
	
	draw_set_color(oldColor);
	draw_set_alpha(oldAlpha);
}

function MakeAnnouncement(_msg) {
	if instance_exists(obj_announcement) instance_destroy(obj_announcement);
	var announcement = instance_create_layer(ORIGIN_X, ORIGIN_Y, "Special", obj_announcement);
	announcement.text = _msg;
}

/// @description Executes a given function with a variable number of arguments as passed by an array
/// @param ind {function}		Function to execute
/// @param [arg1, arg2,...]		The argument array
function ScriptExecuteAlt(_func, _argx) {
	var s = _func;
	var a = _argx;

	switch(array_length(_argx)) {
	    case 0  : script_execute(s); break; // No arguments
	    case 1  : script_execute(s, a[0]); break;
	    case 2  : script_execute(s, a[0], a[1]); break;
	    case 3  : script_execute(s, a[0], a[1], a[2]); break;
	    case 4  : script_execute(s, a[0], a[1], a[2], a[3]); break;
	    case 5  : script_execute(s, a[0], a[1], a[2], a[3], a[4]); break;
	    case 6  : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5]); break;
	    case 7  : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6]); break;
	    case 8  : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7]); break;
	    case 9  : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8]); break;
	    case 10 : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9]); break;
	    case 11 : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10]); break;
	    case 12 : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11]); break;
	    case 13 : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12]); break;
	    case 14 : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13]); break;
	    case 15 : script_execute(s, a[0], a[1], a[2], a[3], a[4], a[5], a[6], a[7], a[8], a[9], a[10], a[11], a[12], a[13], a[14]); break;
		// 16 is the maximum number of arguments in GM. 15 is the maximum number of arguments in script_execute
	}
}

/// Executes a given function after user defined amount of time

/// Returns: Nothing
/// @param _timer {asset}		The obj_timer or children of obj_timer to use
/// @param _duration {real}		The time in seconds
/// @param _func {function}		The function to be executed
/// @param _args {array}		The amount of args to be executed in the passed function
function ExecuteTimedAction(_timer = obj_timer, _duration = 1.0, _func = undefined, _args = undefined) {
	instance_create_layer(ORIGIN_X, ORIGIN_Y, "Special", _timer);
	if (_func != undefined) _timer.func = _func;
	_timer.args = _args;
	_timer.seconds = _duration;
}
