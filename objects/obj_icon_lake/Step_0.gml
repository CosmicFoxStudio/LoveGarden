/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_lake, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Lake")) {
	global.hoveringPlace = PlaceLocalization("Lake");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Lake")) {
	global.hoveringPlace = "";
}
