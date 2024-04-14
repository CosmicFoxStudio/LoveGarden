// OnFinished broadcast message from sq_logoCosmicFox
if (event_data[? "event_type"] == "sequence event") {
    switch (event_data[? "message"]) {
        case "OnFinished":
			GameTransitionChangeRoom(rm_dream, sq_trans_fade_black);
        break;
    }
}
