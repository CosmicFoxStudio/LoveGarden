/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to School");
	
	GameTransitionChangeRoom(rm_school, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("School")) {
	global.hoveringPlace = PlaceLocalization("School");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("School")) {
	global.hoveringPlace = "";
}
