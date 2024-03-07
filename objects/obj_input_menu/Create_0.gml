/// @description Initialization

/*	------------------- Selection Phase ------------------- 
	When the player is selecting between languages.

	-------------------- Confirm Phase -------------------- 
	When the cancel and confirm buttons are no longer 
	disabled and can be used either to confirm or cancel 
	the language selection.
*/

// Lang Menu 
width = 176;
height = 97;
optionPaddingH = 86;
optionPaddingV = 24;
descriptionPaddingH = 24;
descriptionPaddingV = 8;
optionMargin = 48;

// Create Buttons
keyboardButton = instance_create_layer(240, 150, "Instances_Below", obj_keyboard_btn); 
keyboardButton.btnType = e_input.KEYBOARD;
keyboardButton.unavailable = false;
mouseButton = instance_create_layer(390, 150, "Instances_Below", obj_mouse_btn);
mouseButton.btnType = e_input.MOUSE;
mouseButton.unavailable = false;

menuOptions = [keyboardButton, mouseButton];
optionLength = array_length(menuOptions);
pos = 0;