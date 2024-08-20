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
		
		case e_btnTypes.BACK :
			GameTransitionChangeRoom(rm_title, sq_trans_fade_black);
		break;
		
		case e_btnTypes.LANG :
			// Create Lang Menu
			global.langMenu = true;
			instance_create_depth(SCREEN_WIDTH/2, SCREEN_HEIGHT/2, -9998, obj_lang_selection);
			instance_create_depth(SCREEN_WIDTH/2, SCREEN_HEIGHT/2, -9998, obj_lang_menu);			
			// GameTransitionChangeRoom(rm_lang, sq_trans_fade_black);
		break;
		
		default: break;
	}
}
