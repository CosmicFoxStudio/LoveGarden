/// @description Play music for current room

var roomName = room_get_name(room);

if (audio_group_is_loaded(audiogroup_music)) {
	switch (roomName) {
	    case "rm_test_dialogue": JukeboxPlayMusic(mus_ecopark); break;
	    case "rm_title": JukeboxPlayMusic(mus_title); break;
	    case "rm_dormitory": JukeboxPlayMusic(mus_funny); break;
		case "rm_boat": JukeboxPlayMusic(mus_mysterious); break;
		case "rm_sciences": JukeboxPlayMusic(mus_unicorridor); break;
		case "rm_central": JukeboxPlayMusic(mus_peaceful); break;
		default:
	        // Stop the music if no specific case matches
	        JukeboxStopMusic();
	    break;
	}
}
