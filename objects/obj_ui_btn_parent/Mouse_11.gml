// Doesn't make the hover effect if game is paused
if (global.state == e_gameStates.PAUSED) || (global.inputMode != e_input.MOUSE) || (global.state == e_gameStates.MENU) exit;

image_index = 0;
hovering = false;
global.hoveringButton = false;
