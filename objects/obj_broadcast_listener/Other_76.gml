/// @description Global messages
if (event_data[? "event_type"] == "sequence event") {
    switch (event_data[? "message"]) {
		// OnFinished broadcast message from sq_logo
        case "OnFinished":
		if (os_browser == browser_not_a_browser) GameTransitionChangeRoom(rm_lang, sq_trans_fade_black);
		else GameTransitionChangeRoom(rm_dream, sq_trans_fade_black);
        break;
    }
}
