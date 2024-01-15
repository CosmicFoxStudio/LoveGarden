/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Restaurant");
	
	TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_restaurant);
}

if (hovering && global.hoveringPlace != PlaceLocalization("Restaurant")) {
	global.hoveringPlace = PlaceLocalization("Restaurant");
} else if (!hovering && global.hoveringPlace == PlaceLocalization("Restaurant")) {
	global.hoveringPlace = "";
}