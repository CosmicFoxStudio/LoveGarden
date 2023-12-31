function ExecuteButtonAction(_btnType) {
	switch (_btnType) {
		case e_btnTypes.PLAY : 
			room_goto(rm_dormroom);
		break;

		case e_btnTypes.QUIT : 
			game_end();
		break;
	}
}
