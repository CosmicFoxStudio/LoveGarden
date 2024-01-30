/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Dormitory");
	
	GameTransitionChangeRoom(rm_dormitory, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Dormitory")) {
	global.hoveringPlace = PlaceLocalization("Dormitory");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Dormitory")) {
	global.hoveringPlace = "";
}
