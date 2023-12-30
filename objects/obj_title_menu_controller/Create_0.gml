/// @description Initialization

//  -------------------- Create Buttons --------------------- //
// If the platform isn't a browser, create the "Play" and "Quit" buttons
if (os_browser == browser_not_a_browser) {
	playButton = instance_create_layer(192, 160, "Instances", obj_title_button);
	playButton.btnType = e_btnTypes.PLAY;

	quitButton = instance_create_layer(272, 256, "Instances", obj_title_button);
	quitButton.btnType = e_btnTypes.QUIT;
}
// Platform is a browser, create only the "Play" button
else {
	playButton = instance_create_layer(320, 286, "Instances", obj_title_button);
	playButton.btnType = e_btnTypes.PLAY;
}

// ------------------- Input ---------------------- //
pos = 0;

// This array contains all existent instances of obj_title_button
buttonArray = [];

// Get the total number of instances of obj_buttons
var totalButtons = instance_number(obj_title_button);

// Loop through all instances and add them to the array
for (var i = 0; i < totalButtons; i++) {
    var currentButton = instance_find(obj_title_button, i);
    if (currentButton != noone) {
        array_push(buttonArray, currentButton);
    }
}

optionLength = array_length(buttonArray);
