/// @description Initialization

/*	------------------- Selection Phase ------------------- 
	When the player is selecting between languages.

	-------------------- Confirm Phase -------------------- 
	When the cancel and confirm buttons are no longer 
	disabled and can be used either to confirm or cancel 
	the language selection.
*/

// Reward Pop Up
// Initialize variables
center_x = x;
center_y = y;
target_width = 300; // The popup final width
target_height = 200; // The popup final height

animation_speed = 0.1; // Speed of enlargement (can adjust this as needed)
scale_x = 0; // Start at 0, scale from center
scale_y = 0;

popup_sprite = sprite_index;

// Define a flag to check if the animation is playing
is_animating = true;

// Create Buttons (on top of everything)
// Position buttons relative to popup's position
instance_create_depth(center_x - 60, center_y + target_height / 2 + 20, -9999, obj_btn, {btnType: e_btnTypes.CONTINUE}); 
instance_create_depth(center_x + 60, center_y + target_height / 2 + 20, -9999, obj_btn, {btnType: e_btnTypes.MAP});

// Option selection
pos = 0;
phase = "SELECT";
cancelButtonIsHovering = false;
confirmButtonIsHovering = false;

// Last check selection
selectedButton = "NONE"; // "CONFIRM" || "CANCEL"  // ---------> Change name to "Chosen Button"
posButtons = 0;

// ENUMS USED: e_btnTypes

// Array of selectable languages
option[e_language.EN] = ["ENGLISH", "PORTUGUÊS"];
option[e_language.PT] = ["ENGLISH", "PORTUGUÊS"];

// Other text
titleText[e_language.EN] = "Choose a language";
titleText[e_language.PT] = "Escolha o idioma";

optionLength = array_length(option);
