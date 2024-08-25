/// @description [DEBUG] YARN Files
if (global.debug) show_debug_message("All dialogue files: " + string(global.dialogueList));

for (var file = 0; file < array_length(global.dialogueList); file++) {
	show_debug_message("Is " + string(global.dialogueList[file]) + " loaded?: " + string(ChatterboxIsLoaded(global.dialogueList[file])));
}
