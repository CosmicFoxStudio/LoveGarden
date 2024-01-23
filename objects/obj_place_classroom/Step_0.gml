/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Classroom");
	
	TransitionSet(sq_out_trans_fade_black, sq_in_trans_fade_black, "CHANGE_ROOM", rm_classroom);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Classroom")) {
	global.hoveringPlace = PlaceLocalization("Classroom");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Classroom")) {
	global.hoveringPlace = "";
}