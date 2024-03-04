/// @description Initialization

// Initialize audiogroups
audio_group_load(audiogroup_music);
audio_group_load(audiogroup_sfx);
// audiogroup_default is the master

currentMusic = -1;

// --------------------------- Methods --------------------------- //
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
