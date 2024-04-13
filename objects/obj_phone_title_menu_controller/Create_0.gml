/// @description Initialization

//  ----------------------------------- Create Buttons ------------------------------------ //
// If the platform isn't a browser, create the "New Game", "Continue", "Help" and "Quit" buttons
if (os_browser == browser_not_a_browser) {
	newButton = instance_create_layer(410, 150, "Instances_Mid", obj_phone_title_button);
	newButton.btnType = e_btnTypes.PLAY;
	newButton.baseImageIndex = 0;
	
	continueButton = instance_create_layer(410, 200, "Instances_Mid", obj_phone_title_button);
	continueButton.btnType = e_btnTypes.CONTINUEPLAY;
	continueButton.baseImageIndex = 2;

	helpButton = instance_create_layer(410, 250, "Instances_Mid", obj_phone_title_button);
	helpButton.btnType = e_btnTypes.HELP;
	helpButton.baseImageIndex = 4;
	
	quitButton = instance_create_layer(410, 300, "Instances_Mid", obj_phone_title_button);
	quitButton.btnType = e_btnTypes.QUIT;
	quitButton.baseImageIndex = 6;
}
// Platform is a browser, create only the "Play" and "Help" button
else {
	newButton = instance_create_layer(410, 150, "Instances_Mid", obj_phone_title_button);
	newButton.btnType = e_btnTypes.PLAY;
	newButton.baseImageIndex = 0;
	
	continueButton = instance_create_layer(410, 200, "Instances_Mid", obj_phone_title_button);
	continueButton.btnType = e_btnTypes.CONTINUEPLAY;
	continueButton.baseImageIndex = 2;

	helpButton = instance_create_layer(410, 250, "Instances_Mid", obj_phone_title_button);
	helpButton.btnType = e_btnTypes.HELP;
	helpButton.baseImageIndex = 4;
}

// -------------------------------------- Input ----------------------------------------- //
pos = 0;

// This array contains all existent instances of obj_title_button
buttonArray = [];

// Get the total number of instances of obj_buttons
var totalButtons = instance_number(obj_phone_title_button);

// Loop through all instances and add them to the array
for (var i = 0; i < totalButtons; i++) {
    var currentButton = instance_find(obj_phone_title_button, i);
    if (currentButton != noone) {
        array_push(buttonArray, currentButton);
    }
}

optionLength = array_length(buttonArray);
