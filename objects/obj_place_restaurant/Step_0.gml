/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Food Court");
	
	GameTransitionChangeRoom(rm_restaurant, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Food Court")) {
	global.hoveringPlace = PlaceLocalization("Food Court");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Food Court")) {
	global.hoveringPlace = "";
}
