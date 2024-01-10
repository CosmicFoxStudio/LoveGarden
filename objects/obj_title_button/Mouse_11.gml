// Doesn't make the hover effect if game is paused
if (global.state == e_gameStates.PAUSED) || (global.inputMode != e_input.MOUSE) exit;

image_alpha = 1;
hovering = false;