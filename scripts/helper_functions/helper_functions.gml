// Please always use an underscore as the first char in a function parameter

/*	Returns:
	1 if the down key is pressed, 
	-1 if the up key is pressed, 
	0 if both or neither are pressed.
*/
function CheckVerticalInput() {	
	return global.PRESSED_DOWN - global.PRESSED_UP;
}

/*	Returns:
	1 if the right key is pressed, 
	-1 if the left key is pressed, 
	0 if both or neither are pressed.
*/
function CheckHorizontalInput() {
	return global.PRESSED_RIGHT - global.PRESSED_LEFT;	
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
	var announcement = instance_create_layer(0, 0, "Special", obj_announcement);
	announcement.text = _msg;
}
