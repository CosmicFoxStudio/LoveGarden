/// @description Initialization

// Lang Menu 
//width = 176;
//height = 97;
//optionPaddingH = 86;
//optionPaddingV = 24;
//descriptionPaddingH = 24;
//descriptionPaddingV = 8;
//optionMargin = 48;

// Create Buttons
keyboardButton = instance_create_layer(235, 140, "Instances_Below", obj_keyboard_btn);
keyboardButton.unavailable = false;
mouseButton = instance_create_layer(385, 135, "Instances_Below", obj_mouse_btn);
mouseButton.unavailable = false;

mouseButton.y += keyboardButton.sprite_height / 2;
keyboardButton.y += mouseButton.sprite_height / 2;

menuOptions = [keyboardButton, mouseButton];
optionLength = array_length(menuOptions);
pos = 0;