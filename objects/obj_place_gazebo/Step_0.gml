/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Gazebo");
	
	TransitionSetRoom(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_gazebo);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Gazebo")) {
	global.hoveringPlace = PlaceLocalization("Gazebo");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Gazebo")) {
	global.hoveringPlace = "";
}