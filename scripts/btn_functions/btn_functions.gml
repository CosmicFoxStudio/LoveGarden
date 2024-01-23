function ExecuteButtonAction(_btnType) {
	switch (_btnType) {
		case e_btnTypes.PLAY : 
			TransitionSet(sq_out_trans_fade_black, sq_in_trans_fade_black, "CHANGE_ROOM", rm_file_selection);
		break;
		
		case e_btnTypes.HELP : 
			//Add Tutorial
		break;
		
		case e_btnTypes.QUIT : 
			game_end();
		break;
	}
}
