/* global.res is set in obj_game */

function SetResolution() {
	// Set resolution
	surface_resize(application_surface, global.viewWidth, global.viewHeight);

	// Window
	window_set_size(global.viewWidth, global.viewHeight);

	// GUI
	//with this, GUI would become larger, accounting for e.g. 1280x720
	//display_set_gui_size(global.viewWidth, global.viewHeight);

	// GUI here is the same size as the game (640x360), when window/resolution changes size it resizes the scaling but not the pixels
	// For Pixel Art games I think that's fitting, but if it becomes a problem we can change
	display_set_gui_size(global.res.width, global.res.height);

	//Center window
	var _display_width = display_get_width();
	var _display_height = display_get_height();

	window_set_position(
		_display_width 	/ 2 - global.viewWidth	/ 2,
		_display_height	/ 2 - global.viewHeight	/ 2
	);
}
