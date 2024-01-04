/// @description Initialization

//------------------- MOUSE ---------------------//
clickX = 0;
clickY = 0;

clickGuiX = 0;
clickGuiY = 0;

//------------------- GRID ---------------------//
debugShowGrid = false;
gridSpacing = 16; 
// Calculate the number of horizontal and vertical lines needed
numHorizontalLines = room_height div gridSpacing;
numVerticalLines = room_width div gridSpacing;

//------------------- BOOLEANS ---------------------//
displayInfo				= false;
debugShowInfo			= false;
debugShowFPS			= false;
debugGlobalGame			= true;
debugLang				= false;
debugChara				= false;
//debugDialogue			= false;
//debugPlayer			= false;
//debugMenu				= false;
//debugAudioMusic		= false;
//debugFlag				= false;
//debugRoom				= false;

 #region ROOM SELECTOR
// Creating Room Lists
global.rmName = ds_list_create();			// Index sorted, values are strings
global.rmNameSorted = ds_list_create();		// Alphabetically sorted, values are strings

#region Pushing the rooms to the DS List
// It'll look like this:
// global.rmName[0] = "rm_init" (order: 0)
// global.rmName[1] = "rm_lang"; (order: 1)
// global.rmName[2] = "rm_title"; (order: 2)
// and so on...
roomIndex = 0;
roomName = "";

// Updating DS Lists 
// Values from one of them needs to store the index, and the other needs to store the names
// Getting the room order
roomIndex = room_first;
while(roomIndex != -1) {
	// We could also use room_index = room_first + 1 to not include the rm_init in the list
    roomName = room_get_name(roomIndex);
    // show_debug_message(roomName);
	ds_list_add(global.rmNameSorted, roomName);
	ds_list_add(global.rmName, roomName);
    roomIndex = room_next(roomIndex);
}

#endregion Pushing the rooms to the DS List

// Creating a sorted DS List of room names
ds_list_sort(global.rmNameSorted, true);

debugRmSelectorActive = false;
selected = 0; // Initial selection cursor position
//startIndex = 0; // The index of the first visible room
// The index of the last visible room (assuming a maximum of 6 rooms on the screen)
//endIndex = min(startIndex + 5, ds_list_size(global.rmNameSorted) - 1); 
menuTransition = 0;

#endregion ROOM SELECTOR