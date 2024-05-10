/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_sciences, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Science Dept.")) {
	global.hoveringPlace = PlaceLocalization("Science Dept.");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Science Dept.")) {
	global.hoveringPlace = "";
}
