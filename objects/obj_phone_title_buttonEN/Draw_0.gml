/// @description Draw Buttons & Text

draw_self();

if (!hovering) image_index = baseImageIndex;
if (hovering || keyboardSelection) {
	image_index = baseImageIndex + 1;
}

// Reset
DrawReset();