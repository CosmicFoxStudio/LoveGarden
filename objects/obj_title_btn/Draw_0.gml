/// @description Draw Buttons & Text

// Language Swap
if (global.lang == "pt") initialImageIndex = 2;
else initialImageIndex = 0;

draw_self();

if (!hovering) image_index = initialImageIndex;
if (hovering || keyboardSelection) {
	image_index = initialImageIndex + 1;
}

// Reset
DrawReset();
