/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_central, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != global.localization[$ global.lang][$ "places"][$ "Central Building"]) {
	global.hoveringPlace = global.localization[$ global.lang][$ "places"][$ "Central Building"];
} else if (!hovering && global.hoveringPlace == global.localization[$ global.lang][$ "places"][$ "Central Building"]) {
	global.hoveringPlace = "";
}
