function ExecuteButtonAction(_btnType) {
	switch (_btnType) {
		case e_btnTypes.PLAY :
			global.newGame = true;
			GameTransitionChangeRoom(rm_file_selection, sq_trans_fade_black);
		break;
		
		case e_btnTypes.CONTINUEPLAY : 
			global.newGame = false;
			GameTransitionChangeRoom(rm_file_selection, sq_trans_fade_black);
		break;
		
		case e_btnTypes.HELP : 
			//Add Tutorial
		break;
		
		case e_btnTypes.QUIT : 
			game_end();
		break;
		
		default: break;
	}
}
