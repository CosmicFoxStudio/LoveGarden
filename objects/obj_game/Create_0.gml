Enums();
global.debug = false;
global.lang = "en"; // "en", "pt"
SetLanguage();
global.roomTarget = -1;
global.midTransition = false;
global.status = {
	wilting: 0,
	growth: 0,
	blossom: 0,
	humor: 0
}
global.flags = {
	bad: false,
	love: false,
	favePlace: false,
	dormroom: false,	
}
// Input
global.MOUSE_CONFIRM = false;
global.SPACE_CONFIRM = false;
global.BACKSPACE_CANCEL = false;
global.PRESSED_UP = false;
global.PRESSED_DOWN = false;
global.PRESSED_LEFT = false;
global.PRESSED_RIGHT = false;

#region Chatterbox Load Files
global.dialogueList = [];
	
if os_browser == browser_not_a_browser {
	// Not in browser - Load the files dynamically
	LoadDialogueFiles();
}
else {
	// In browser - load files manually
	ChatterboxLoadFromFile("scenes/main_scene0_test.yarn");
}

#endregion Chatterbox Load Files

//  ---------------- Data structure to get node based on room  ------------------  //

// Room-to-yarn map
global.roomYarnMap = ds_map_create();
global.roomYarnMap[? "rm_dormroom_morning"	]		= "scenes/main_scene0_test.yarn";
// And so on...

// ----------------------- Chatterbox Localization Build -----------------------  //

// Only uncomment this next line when there are NEW dialogue lines to be generated!!
// (You will also need do disable sandboxing temporarily)
// ChatterboxLocalizationBuild(global.dialogueList, [("lang/" + "en_dialogues.csv")]);
// OBS: LoadLocalization() is set at rm_title's creation code
