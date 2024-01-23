/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Courtyard");
	
	TransitionSet(sq_out_trans_fade_black, sq_in_trans_fade_black, "CHANGE_ROOM", rm_courtyard);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Courtyard")) {
	global.hoveringPlace = PlaceLocalization("Courtyard");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Courtyard")) {
	global.hoveringPlace = "";
}