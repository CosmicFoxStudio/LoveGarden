/// @description Button Action

if (InputCheck("confirm", e_input.MOUSE) && hovering) {
	GameTransitionChangeRoom(rm_gazebo, sq_trans_fade_black);
}

if (hovering && global.hoveringPlace != global.localization[$ global.lang][$ "places"][$ "Gazebo"]) {
	global.hoveringPlace = global.localization[$ global.lang][$ "places"][$ "Gazebo"];
} else if (!hovering && global.hoveringPlace == global.localization[$ global.lang][$ "places"][$ "Gazebo"]) {
	global.hoveringPlace = "";
}
