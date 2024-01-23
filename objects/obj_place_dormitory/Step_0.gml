/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Dormitory");
	
	TransitionSetRoom(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_dormitory);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Dormitory")) {
	global.hoveringPlace = PlaceLocalization("Dormitory");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Dormitory")) {
	global.hoveringPlace = "";
}
