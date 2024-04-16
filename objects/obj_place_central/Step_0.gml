/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	MakeAnnouncement("Going to Central Building");
	
	GameTransitionChangeRoom(rm_central, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Central")) {
	global.hoveringPlace = PlaceLocalization("Central");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Central")) {
	global.hoveringPlace = "";
}
