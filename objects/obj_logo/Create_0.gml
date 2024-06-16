/// @description Scaling VFX

// Change the sprite if in demo version
image_index = (global.gameMode == e_gameMode.DEMO) ? 1 : 0;

// Scaling parameters
image_xscale = 1.5;
image_yscale = 1.5;
scale_small = 1.4;
scale_big = 1.6;
scale_duration = 5; // Duration for a full wave cycle in seconds
scale_current = WaveVFX(scale_small, scale_big, scale_duration, 0);
