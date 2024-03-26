/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	show_debug_message("Going to Food Court");
	
	GameTransitionChangeRoom(rm_restaurant, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Food Court")) {
	global.hoveringPlace = PlaceLocalization("Food Court");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Food Court")) {
	global.hoveringPlace = "";
}
