/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Food Court");
	
	TransitionSet(sq_out_trans_fade_black, sq_in_trans_fade_black, "CHANGE_ROOM", rm_restaurant);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Food Court")) {
	global.hoveringPlace = PlaceLocalization("Food Court");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Food Court")) {
	global.hoveringPlace = "";
}