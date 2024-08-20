/// @description Global messages
if (event_data[? "event_type"] == "sequence event") {
    switch (event_data[? "message"]) {
		// OnFinished broadcast message from sq_logo
        case "OnFinished":
			// Not a browser
			GameTransitionChangeRoom(rm_title, sq_trans_fade_black);
        break;
    }
}
