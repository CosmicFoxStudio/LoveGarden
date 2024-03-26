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
cancelButton = instance_create_layer(240, 280, "Instances_Below", obj_lang_menu_btn); 
cancelButton.btnType = "CANCEL";
confirmButton = instance_create_layer(390, 280, "Instances_Below", obj_lang_menu_btn);
confirmButton.btnType = "CONFIRM";

// Option selection
pos = 0;
phase = "SELECT";
cancelButtonIsHovering = false;
confirmButtonIsHovering = false;

// Last check selection
selectedButton = "NONE"; // "CONFIRM" || "CANCEL"  // ---------> Change name to "Chosen Button"
posButtons = 0;

// ENUMS USED: e_language & e_langMenuOptions

// Array of selectable languages
option[e_language.EN] = ["ENGLISH", "PORTUGUÊS"];
option[e_language.PT] = ["ENGLISH", "PORTUGUÊS"];

// Other text
titleText[e_language.EN] = "Choose a language";
titleText[e_language.PT] = "Escolha o idioma";

optionLength = array_length(option);
