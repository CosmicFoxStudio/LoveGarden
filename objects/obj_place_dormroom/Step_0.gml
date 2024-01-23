/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Dormroom");
	
	TransitionSet(sq_out_trans_fade_black, sq_in_trans_fade_black, "CHANGE_ROOM", rm_dormroom);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Dormroom")) {
	global.hoveringPlace = PlaceLocalization("Dormroom");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Dormroom")) {
	global.hoveringPlace = "";
}