/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_dormitory, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Dormitory")) {
	global.hoveringPlace = PlaceLocalization("Dormitory");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Dormitory")) {
	global.hoveringPlace = "";
}
