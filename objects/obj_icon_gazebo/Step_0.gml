/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_gazebo, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Gazebo")) {
	global.hoveringPlace = PlaceLocalization("Gazebo");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Gazebo")) {
	global.hoveringPlace = "";
}
