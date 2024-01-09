/// @description Initialization
startX = 0;
startY = 0;
yy = 0;
//image_speed = 0.5;
selectedOption = 0;
maxSlots = 3;
subimage = 0;
spriteImage = 0;
dateX = 0;
dateY = 0;
placeX = 0;
placeY = 0;
daytimeX = 0;
daytimeY = 0;
dayX = 0;
dayY = 0;
saveStatString = "";
entryString = "";

// Adding translation to save and load buttons
switch (global.lang) {
	case "en":
		saveText[0] = "EMPTY";
		saveText[1] = "Morning";
		saveText[2] = "Afternoon";
		saveText[3] = "Evening";
		saveText[4] = "Dawn";
		saveText[5] = "DAY";
		break;
	case "pt":
		saveText[0] = "VAZIO";
		saveText[1] = "Manhã";
		saveText[2] = "Tarde";
		saveText[3] = "Noite";
		saveText[4] = "Alvorada";
		saveText[5] = "DIA";
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
