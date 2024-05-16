
// Assign different subimage depending on hovering status
if (hovering) subimage = 1;
else subimage = 0;

// Toggle menu
if ( InputCheck("confirm", e_input.MOUSE) && hovering ) {
	hovering = false;
	ToggleContextMenu();
}
