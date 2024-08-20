/// @description Global messages
if (event_data[? "event_type"] == "sequence event") {
    switch (event_data[? "message"]) {
		// OnFinished broadcast message from sq_logo
        case "OnFinished":
		if (os_browser == browser_not_a_browser) {
			// Doesn`t select a language if first access
			if (file_exists(global.saveFileName + "_" + string(global.saveSlot) + ".sav")){
				GameTransitionChangeRoom(rm_title, sq_trans_fade_black);
			}
			else GameTransitionChangeRoom(rm_lang, sq_trans_fade_black);
		}
		else GameTransitionChangeRoom(rm_dream, sq_trans_fade_black);
        break;
    }
}
