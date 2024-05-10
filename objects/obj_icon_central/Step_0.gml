/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_central, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Central Building")) {
	global.hoveringPlace = PlaceLocalization("Central Building");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Central Building")) {
	global.hoveringPlace = "";
}
