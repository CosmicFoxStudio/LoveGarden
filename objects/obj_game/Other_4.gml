// Reset status & flags
if (room = rm_title) {
	global.status.wilting = 0;
	global.status.growth = 0;
	global.status.blossom = 0;
	global.status.humor = 0;
	
	global.flags.bad = false;
	global.flags.love = false;
	global.flags.favePlace = false;
	global.flags.dormroom = false;
}

// Dialogue Files
if (global.debug) show_debug_message("All dialogue files: " + string(global.dialogueList));

for (var _file = 0; _file < array_length(global.dialogueList); _file++) {
	show_debug_message("Is " + string(global.dialogueList[_file]) + " loaded?: " + string(ChatterboxIsLoaded(global.dialogueList[_file])));
}
