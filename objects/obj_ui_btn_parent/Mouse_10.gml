// Doesn't make the hover effect if game is paused
if (global.state == e_gameStates.PAUSED) || (global.inputMode != e_input.MOUSE) || (global.state == e_gameStates.MENU) exit;

image_index = 1;
hovering = true;
global.hoveringButton = true;
audio_play_sound(snd_menu_beep, 0, false, 1, 0, random_range(0.8, 1.2));

// Change the option selected in obj_title_menu_controller to be this button's type 
// (This is a very ugly way to do it but lol)
//obj_title_menu_controller.pos = btnType;
