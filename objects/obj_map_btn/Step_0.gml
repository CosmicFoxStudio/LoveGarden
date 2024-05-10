if ( InputCheck("confirm", e_input.MOUSE) && hovering ) {
	global.lastPlace = room;
	GameTransitionChangeRoom(rm_map, sq_trans_fade_black);
}