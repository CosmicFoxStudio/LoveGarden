/// @description Initialization

// Initialize audiogroups
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);

// audiogroup_default is the master

currentMusic = -1;

music_map = ds_map_create()
sfx_map = ds_map_create()

// --------------------------- Methods --------------------------- //
JukeboxMapMusic = function(_group_id) {
	var _musics = audio_group_get_assets(_group_id);
	var _size = array_length(_musics);
	for(var _i=0; _i < _size; _i++) {
		switch(_group_id) {
			case audiogroup_music:
				music_map[? audio_get_name(_musics[_i])] = _musics[_i];
				break;
			case audiogroup_sfx:
				sfx_map[? audio_get_name(_musics[_i])] = _musics[_i];
				break;
			default:
				break;
		}
	}
	
	if(_group_id == audiogroup_music){
		var k = ds_map_find_first(music_map);
	    var maptext = "Music_map";
		while (!is_undefined(k)) {
		  maptext += k + ": " + audio_get_name(music_map[? k]) + "#";
		  k = ds_map_find_next(music_map, k);
		}
		show_debug_message(maptext);
	} else {
		var k = ds_map_find_first(sfx_map);
	    var maptext = "SFX map";
		while (!is_undefined(k)) {
		  maptext += k + ": " + audio_get_name(sfx_map[? k]) + "#";
		  k = ds_map_find_next(sfx_map, k);
		}
		show_debug_message(maptext);
	}
}

//JukeboxMapMusic();

JukeboxStopMusic = function() {
    // Check if there is currently playing music
    if (currentMusic != -1) {
        // Fade out music
		audio_sound_gain(currentMusic, 0, 500);
		// Stop the current music
		audio_stop_sound(currentMusic);
		// Reset the current music variable
        currentMusic = -1;
    }
}

JukeboxPlayMusic = function(_music) {
    // Check if the current music is different from the new one
    if (currentMusic != _music) {
        // Stop the current music (if there's one)
        JukeboxStopMusic();
        // Play the new music
        audio_play_sound(_music, 0, true);
		// Fade in the new music
		audio_sound_gain(_music, 0, 0);
		audio_sound_gain(_music, 1, 500);
        // Update the current music variable
        currentMusic = _music;
    }
}

JukeboxPlayMusicFromString = function(_music_name) {
	
}

Audiogroups_loaded = function() {
	return (audio_group_is_loaded(audiogroup_music) &&
		audio_group_is_loaded(audiogroup_sfx));
}