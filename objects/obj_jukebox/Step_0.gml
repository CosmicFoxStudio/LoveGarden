/// @description Play music for current room

var roomName = room_get_name(room);

switch (roomName) {
    case "rm_title":
        JukeboxPlayMusic(snd_title);
        break;

    case "rm_dormroom":
        JukeboxPlayMusic(snd_dormroom);
        break;
		
    default:
        // Stop the music if no specific case matches
        JukeboxStopMusic();
        break;
}
