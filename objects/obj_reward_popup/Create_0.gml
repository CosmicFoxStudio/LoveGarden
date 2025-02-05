/// @description Initialization

/*	------------------- Selection Phase ------------------- 
	When the player is selecting between the two options.

	-------------------- Confirm Phase -------------------- 
	When the continue and explore buttons are no longer 
	disabled and can be used either to continue to next
	scene or go explore the map.
*/

// Initialize popup and animation variables
center_x = x;
center_y = y;
target_width = 300; // The popup final width
target_height = 200; // The popup final height
popup_sprite = sprite_index;
is_animating = true; // Flag to check if the animation is playing

// Enlarge Effect
animation_speed = 0.1; 
scale_x = 0;
scale_y = 0;

// Flower Giggle Effect
giggle_timer = 0; 
giggle_speed = 0.05;
giggle_amplitude = 2;  

// Create Buttons - relative to popup's position
continueBtn = instance_create_depth(center_x - 60, center_y + target_height / 2 + 20, -9999, obj_btn, {btnType: e_btnTypes.CONTINUE}); 
mapBtn = instance_create_depth(center_x + 60, center_y + target_height / 2 + 20, -9999, obj_btn, {btnType: e_btnTypes.MAP});

// Selection Variables
pos = 0;
phase = "SELECT"; 
selectedButton = "NONE"; 
numberOfButtons = 2; 
