// Doesn't make the hover effect if game is paused
if (global.state == e_gameStates.MENU) exit;

hovering = true;

audio_play_sound(snd_menu_beep, 0, false, 1, 0, random_range(0.8, 1.2));