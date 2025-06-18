/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_dormitory, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != Localize("places", "Dormitory")) {
	global.hoveringPlace = global.localization[$ global.lang][$ "places"][$ "Dormitory"];
} else if (!hovering && global.hoveringPlace == global.localization[$ global.lang][$ "places"][$ "Dormitory"]) {
	global.hoveringPlace = "";
}
