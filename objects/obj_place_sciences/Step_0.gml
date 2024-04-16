/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	show_debug_message("Going to Sciences Building");
	
	GameTransitionChangeRoom(rm_sciences, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Sciences")) {
	global.hoveringPlace = PlaceLocalization("Sciences");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Sciences")) {
	global.hoveringPlace = "";
}
