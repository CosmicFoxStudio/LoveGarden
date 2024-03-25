/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	show_debug_message("Going to Dormroom");
	
	GameTransitionChangeRoom(rm_dormroom, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Dormroom")) {
	global.hoveringPlace = PlaceLocalization("Dormroom");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Dormroom")) {
	global.hoveringPlace = "";
}