// Doesn't make the hover effect if game is paused
if (global.state == e_gameStates.PAUSED) || (global.state == e_gameStates.MENU) exit;
show_debug_message("Enter button")
image_index = 1;
hovering = true;
global.hoveringButton = true;
audio_play_sound(snd_menu_beep, 0, false, 1, 0, random_range(0.8, 1.2));