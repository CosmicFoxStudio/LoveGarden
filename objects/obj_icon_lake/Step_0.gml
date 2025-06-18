/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_lake, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != global.localization[$ global.lang][$ "places"][$ "Lake"]) {
	global.hoveringPlace = global.localization[$ global.lang][$ "places"][$ "Lake"];
} else if (!hovering && global.hoveringPlace == global.localization[$ global.lang][$ "places"][$ "Lake"]) {
	global.hoveringPlace = "";
}
