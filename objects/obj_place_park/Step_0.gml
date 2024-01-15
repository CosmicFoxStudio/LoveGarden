/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Park");
	
	TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_park);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Park")) {
	global.hoveringPlace = PlaceLocalization("Park");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Park")) {
	global.hoveringPlace = "";
}