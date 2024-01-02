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
global.rm_name = ds_list_create();			// Index sorted, values are strings
global.rm_name_sorted = ds_list_create();	// Alphabetically sorted, values are strings

#region Pushing the rooms to the DS List
// It'll look like this:
// global.rm_name[0] = "rm_init" (order: 0)
// global.rm_name[1] = "rm_their_room"; (order: 1)
// and so on...
room_index = 0;
room_name = "";

// Updating DS Lists 
// Values from one of them needs to store the index, and the other needs to store the names
// Getting the room order
room_index = room_first;
while(room_index != -1) {
	// We could also use room_index = room_first + 1 to not include the rm_init in the list
	// And also use room_index < room_last to not include rm_game_over in the list
    room_name = room_get_name(room_index);
    // show_debug_message(room_name);
	ds_list_add(global.rm_name_sorted, room_name);
	ds_list_add(global.rm_name, room_name);
    room_index = room_next(room_index);
}

#endregion Pushing the rooms to the DS List

// Creating a sorted DS List of room names
ds_list_sort(global.rm_name_sorted, true);

active = false;
selected = 0; // Initial selection cursor position
start_index = 0; // The index of the first visible room
// The index of the last visible room (assuming a maximum of 6 rooms on the screen)
end_index = min(start_index + 5, ds_list_size(global.rm_name_sorted) - 1); 
menu_transition = 0;

#endregion ROOMS SELECTOR