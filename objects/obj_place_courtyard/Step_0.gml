/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	show_debug_message("Going to Courtyard");
	
	GameTransitionChangeRoom(rm_courtyard, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Courtyard")) {
	global.hoveringPlace = PlaceLocalization("Courtyard");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Courtyard")) {
	global.hoveringPlace = "";
}
