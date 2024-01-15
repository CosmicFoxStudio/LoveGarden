/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to School");
	
	TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_school);
}

if (hovering && global.hoveringPlace != PlaceLocalization("School")) {
	global.hoveringPlace = PlaceLocalization("School");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("School")) {
	global.hoveringPlace = "";
}