function ExecuteButtonAction(_btnType) {
	switch (_btnType) {
		case e_btnTypes.PLAY : 
		// TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_dormroom);
		// TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_dream);
		TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black, rm_file_selection);
		break;

		case e_btnTypes.QUIT : 
			game_end();
		break;
	}
}
