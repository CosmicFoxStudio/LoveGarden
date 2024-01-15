/// @description Initialization

// Change game state as soon as this object is created
GameChangeState(e_gameStates.FILE_SELECTION);
selectedOption = 0;
maxSlots = 3;
subimage = 0;
spriteImage = 0;
mouseSelected = false;

saveStatString = "";
entryString = "";
saveSlotArray = [];
saveSlotAmount = 0; // Don't think we need this? Since we already have the maxSlots variable

// Adding translation to save and load buttons
switch (global.lang) {
	case "en":
		saveText[0] = "EMPTY";
		saveText[1] = "Morning";
		saveText[2] = "Noon";
		saveText[3] = "Afternoon";
		saveText[4] = "Night";
		saveText[5] = "Dawn";
		saveText[6] = "DAY";
		break;
	case "pt":
		saveText[0] = "VAZIO";
		saveText[1] = "Manhã";
		saveText[2] = "Meio-dia";
		saveText[3] = "Tarde";
		saveText[4] = "Noite";
		saveText[5] = "Alvorada";
		saveText[6] = "DIA";
		break;
}

// 3 slots
for (var i = 0; i < 3; i++) {
	// Default entries - Initializing the array
	saveSlotInfo[i, e_saveSlotStats.NAME] = "No Name";
	saveSlotInfo[i, e_saveSlotStats.DATE] = "XX/XX/XX";
	//saveSlotInfo[i, e_saveSlotStats.PLACE] = "Nowhere";
	saveSlotInfo[i, e_saveSlotStats.DAYTIME] = "Dawn";
	saveSlotInfo[i, e_saveSlotStats.DAY] = 0;
}

// Grab player info for save slots, if applicable
for (var slot = 0; slot < 3; slot++) {
	if file_exists("save_stats_" + string(slot) + ".sav") {
		var file = file_text_open_read("save_stats_" + string(slot) + ".sav");
		saveStatString = file_text_read_string(file);
		
		file_text_close(file);
		
		// Add info to saveSlot array
		startChar = 1;
		endChar = string_length(saveStatString);
		entryString = "";
		var currentEntryForSaveSlot = 0;
		
		for (var char = startChar; char <= endChar; char++) {
			var currentChar = string_char_at(saveStatString, char);
			// show_debug_message("currentChar: " + string(currentChar));
			
			if (currentChar != "_") entryString += currentChar;
			
			// Reached an underscore
			else {
				// Save string to the saveSlotInfo array
				saveSlotInfo[slot, currentEntryForSaveSlot] = entryString;
				currentEntryForSaveSlot++;
				entryString = "";
				
				// Check to see if we've filled all the entries for this save slot
				// If so, reset this counter variable
				if (currentEntryForSaveSlot >= e_saveSlotStats.LAST) currentEntryForSaveSlot = 0;
			}
		}
	}
	 // else show_debug_message("No file found - " + string(slot));	
}

// -------------------------------- CREATE SLOTS -------------------------------- //

// To center on the screen	
var startX = (SCREEN_WIDTH/ 2);
var startY = (SCREEN_HEIGHT / 2) - (sprite_get_height(spr_saveslot_box) * 1.2);
	
// Create the three save slot boxes
for (var slot = 0; slot < maxSlots; slot++) {
	var yy = startY + (slot * (sprite_get_height(spr_saveslot_box) * 1.2));
		
	// Checking if the slot is highlighted
	if (selectedOption == slot) subimage = 1;
	else subimage = 0;
		
	// Create save slot box object
	var currentSlot = instance_create_layer(startX, yy, "Instances_Above", obj_save_slot);
	currentSlot.slotIndex = slot;
		
	// Add to array of instances
		if (currentSlot != noone) {
		    array_push(saveSlotArray, currentSlot);
		}

	saveSlotAmount = array_length(saveSlotArray);

	currentSlot.image_index = subimage;
}
