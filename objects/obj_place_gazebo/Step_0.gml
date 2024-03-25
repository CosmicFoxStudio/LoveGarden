/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	show_debug_message("Going to Gazebo");
	
	GameTransitionChangeRoom(rm_gazebo, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Gazebo")) {
	global.hoveringPlace = PlaceLocalization("Gazebo");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Gazebo")) {
	global.hoveringPlace = "";
}