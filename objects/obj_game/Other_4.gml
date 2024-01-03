global.rmCurrent = room_get_name(room);
show_debug_message("Room: " + global.rmCurrent);

// Reset status & flags
if (room = rm_title) {
	global.status.wilting = 0;
	global.status.growth = 0;
	global.status.blossom = 0;
	global.status.humor = 0;
	
	global.flags.bad = false;
	global.flags.love = false;
	global.flags.favePlace = false;
}

// Set location
if global.roomType == e_roomTypes.SCENES {
	global.location = global.rmCurrent;	
}

// YARN Dialogue Files
if (global.debug) show_debug_message("All dialogue files: " + string(global.dialogueList));

for (var file = 0; file < array_length(global.dialogueList); file++) {
	show_debug_message("Is " + string(global.dialogueList[file]) + " loaded?: " + string(ChatterboxIsLoaded(global.dialogueList[file])));
}
