/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_sciences, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != global.localization[$ global.lang][$ "places"][$ "Science Dept."]) {
	global.hoveringPlace = global.localization[$ global.lang][$ "places"][$ "Science Dept."];
} else if (!hovering && global.hoveringPlace == global.localization[$ global.lang][$ "places"][$ "Science Dept."]) {
	global.hoveringPlace = "";
}
