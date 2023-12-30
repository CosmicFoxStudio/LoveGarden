/// @description Initialization
currentMusic = -1;

// ---------------------- Methods ---------------------- //
JukeboxStopMusic = function() {
    // Check if there is currently playing music
    if (currentMusic != -1) {
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
        // Update the current music variable
        currentMusic = _music;
    }
}
