/// @description Check hovering status

// Doesn't make the hover effect if game is paused
if (global.state == e_gameStates.MENU) exit;

hovering = false;
