function ExecuteButtonAction(_btnType) {
	switch (_btnType) {
		case e_btnTypes.PLAY : 
		// TransitionStart(rm_dormroom, sq_out_trans_fade_black, sq_in_trans_fade_black);
		TransitionStart(rm_dream, sq_out_trans_fade_black, sq_in_trans_fade_black);
		break;

		case e_btnTypes.QUIT : 
			game_end();
		break;
	}
}
