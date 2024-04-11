/// @description Iniciar jogo após audiogroups serem carregados
// Você pode escrever seu código neste editor

time_source_start(time_source_create(time_source_game, 120, time_source_units_frames, function() {
    // Add first room here
	GameTransitionChangeRoom(rm_lang, sq_trans_fade_black);
}));





