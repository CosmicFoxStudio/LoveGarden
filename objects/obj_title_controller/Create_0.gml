/// @description Initialization

buttonToCreate = obj_title_btn;
//  ----------------------------------- Create Buttons ------------------------------------ //
// If the platform isn't a browser, create the "New Game", "Continue", "Help" and "Quit" buttons
if (os_browser == browser_not_a_browser) {
	// Lang button
	instance_create_layer(64, 336, "Instances_Below", obj_title_btn_lang);
	
	// New Game Button
	instance_create_layer(410, 150, "Instances_Mid", buttonToCreate, {btnType: e_btnTypes.PLAY});
	
	// Continue Button
	instance_create_layer(410, 200, "Instances_Mid", buttonToCreate, {btnType: e_btnTypes.CONTINUEPLAY});
	
	// Help Button
	// instance_create_layer(410, 250, "Instances_Mid", buttonToCreate, {btnType: e_btnTypes.HELP});
	
	// Quit Button
	instance_create_layer(410, 250, "Instances_Mid", buttonToCreate, {btnType: e_btnTypes.QUIT});
}
// Platform is a browser, create only the "Play" and "Help" button
else {
	// New Game Button
	instance_create_layer(410, 150, "Instances_Mid", buttonToCreate, {btnType: e_btnTypes.PLAY});
	
	// Continue Button
	instance_create_layer(410, 200, "Instances_Mid", buttonToCreate, {btnType: e_btnTypes.CONTINUEPLAY});
	
	// Help Button
	//helpButton = instance_create_layer(410, 250, "Instances_Mid", buttonToCreate, {btnType: e_btnTypes.HELP});
}

// -------------------------------------- Input ----------------------------------------- //
pos = 0;

// This array contains all existent instances of phone title buttons
buttonArray = [];

// Get the total number of instances of obj_buttons
var totalButtons = instance_number(buttonToCreate);

// Loop through all instances and add them to the array
for (var i = 0; i < totalButtons; i++) {
    var currentButton = instance_find(buttonToCreate, i);
    if (currentButton != noone) {
        array_push(buttonArray, currentButton);
    }
}

optionLength = array_length(buttonArray);
