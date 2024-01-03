/* global.res is set in obj_game
global.view_width = global.res.width * global.res.scale;
global.view_height = global.res.height * global.res.scale;
*/

function SetResolution() {
	// Set resolution
	surface_resize(application_surface, global.view_width, global.view_height);

	// Window
	window_set_size(global.view_width, global.view_height);

	// GUI
	//with this, GUI would become larger, accounting for i.e. 640x480 or 1280x960
	//display_set_gui_size(global.view_width, global.view_height);

	// GUI here is the same size as the game (320x240), when window/resolution changes size it resizes the scaling but not the pixels
	// For Pixel Art games I think that's fitting
	display_set_gui_size(global.res.width, global.res.height);

	//Center window
	var _display_width = display_get_width();
	var _display_height = display_get_height();

	window_set_position(
		_display_width 	/ 2 - global.view_width		/ 2,
		_display_height	/ 2 - global.view_height	/ 2
	);
}
