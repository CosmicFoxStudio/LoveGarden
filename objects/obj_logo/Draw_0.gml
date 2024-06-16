// Save the current draw state

// Enable texture filtering for blurry effect (instead of pixel-perfect rendering)
// gpu_set_texfilter(true);

// Draw the logo with the current scaling and flicker factor
draw_sprite_ext(sprite_index, image_index, x, y, scale_current, scale_current, 0, c_white, 1); 

// Restore texture filtering state
// gpu_set_texfilter(false);
