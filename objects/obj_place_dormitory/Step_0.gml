/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	show_debug_message("Going to Dormitory");
	
	GameTransitionChangeRoom(rm_dormitory, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Dormitory")) {
	global.hoveringPlace = PlaceLocalization("Dormitory");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Dormitory")) {
	global.hoveringPlace = "";
}
