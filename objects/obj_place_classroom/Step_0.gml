/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Classroom");
	
	GameTransitionChangeRoom(rm_classroom, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Classroom")) {
	global.hoveringPlace = PlaceLocalization("Classroom");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Classroom")) {
	global.hoveringPlace = "";
}