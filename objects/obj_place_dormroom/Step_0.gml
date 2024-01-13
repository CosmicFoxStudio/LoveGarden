/// @description Button Action

if (InputCheck(e_input.MOUSE, "confirm") && hovering) {
	show_debug_message("Going to Dormroom");
	
	TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_dormroom);
}