/// @description Event Data Controller

/*
type = 0;
scenes = [];
mode = ConvertGameModeToString();
day = string(global.day);
location = global.location;
yarnString = mode + "_" + "day" + day + "_" + location;
*/

// Initialize the global.events struct
global.events = { canon: [], bonus: [] };

// ----------------------------- ADD EVENTS -------------------------------- //
// Canon Event 1
EventDefinition("scenes/main_day1_dormitory.yarn", "dormitory", ["CaruIntro", "LateArrival"], "canon");
// Canon Event 2
EventDefinition("scenes/main_day1_boat.yarn", "boat", [], "canon");

//-------------------------------- CHATTERBOX -------------------------------//
// Creates the roomYarnMap data structure (to get node based on room)
global.roomYarnMap = ds_map_create();

// This DS needs to be updated everytime the day changes
// For that, use: UpdateRoomYarnMap()
UpdateRoomYarnMap();

#region CHATTERBOX LOAD FILES
global.dialogueList = [];
	
if (os_browser == browser_not_a_browser) {
	// Not in browser - Load the canon files dynamically
	LoadDialogueFiles();
	// Load Bonus Events
	
}
else {
	// In browser - load files manually
	if (global.gameMode == e_gameMode.DEMO) {
		// DEMO MODE
		ChatterboxLoadFromFile("scenes/demo_day0_test.yarn");
		ChatterboxLoadFromFile("scenes/demo_day1_bonus.yarn");
		ChatterboxLoadFromFile("scenes/demo_day1_dormitory.yarn");
		ChatterboxLoadFromFile("scenes/demo_day1_boat.yarn");
		ChatterboxLoadFromFile("scenes/demo_day1_sciences.yarn");
		ChatterboxLoadFromFile("scenes/demo_day1_central.yarn");
	}
	else if (global.gameMode == e_gameMode.TEASER) {
		// TEASER MODE
		ChatterboxLoadFromFile("scenes/teaser.yarn");
	}
	/* // HTML5 version is only for demo
	else {
		// RELEASE MODE
		ChatterboxLoadFromFile("scenes/main_day0_test.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_dormitory.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_boat.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_sciences.yarn");
		ChatterboxLoadFromFile("scenes/main_day2_dormitory.yarn");
	}
	*/
}

#endregion CHATTERBOX LOAD FILES

// ----------------------- Chatterbox Localization Build -----------------------  //

// Only uncomment this next line when there are NEW dialogue lines to be generated!!
// (You will also need do disable sandboxing temporarily)
// ChatterboxLocalizationBuild(global.dialogueList, [("lang/" + global.lang + "_dialogues.csv")]);
// OBS: LoadLocalization() is set at rm_title's creation code

// -----------------------------------------------------------------------------  //

#region CHATTERBOX INITIALIZE CUSTOMS
// Custom Chatterbox Functions
ChatterboxAddFunction("addAction", AddAction);				    				// Adds a certain number of actions
ChatterboxAddFunction("assignRoute", RouteAssign);								// Assign a character route
ChatterboxAddFunction("backTitle", BackToTitle);			    				// Goes back to the title screen and changes game state
ChatterboxAddFunction("bg", BackgroundSetIndex);								// Function to change background
ChatterboxAddFunction("chara", CharacterOnScreen);								// Function to draw a character
ChatterboxAddFunction("dialogueWait", DialogueWait);							// Makes the textbox wait for x seconds
ChatterboxAddFunction("save", SaveGame);										// Calls the save script from inside a yarn file
ChatterboxAddFunction("changeRelationship", ChangeRelationship)					// Adds or removes hearts to romanceable characters relationship bars
ChatterboxAddFunction("getRelationship", GetRelationship)						// Checks relationship bars of romanceable characters
ChatterboxAddFunction("nextDay", NextDay);										// Increments by 1 global.day and set global.currentDaytime to morning
ChatterboxAddFunction("nextDaytime", NextDaytime);								// Increments by 1 global.currentDaytime
ChatterboxAddFunction("nextRoom", NextRoom);									// Function to change scene
ChatterboxAddFunction("transition", DialogueTransition);						// Transition VFX
ChatterboxAddFunction("bgTransition", BackgroundWaitTransition);				// Change background using transition
ChatterboxAddFunction("getPlace", GetCurrentPlace);								// Get current place
ChatterboxAddFunction("playMusic", inst_jukebox.JukeboxPlayMusicFromString);	// Play Music
ChatterboxAddFunction("playSFX", inst_jukebox.JukeboxPlaySFXFromString);		// Play SFX
ChatterboxAddFunction("setFlag", FlagSet);										// Sets a value to a flag
ChatterboxAddFunction("getFlag", FlagGet);										// Returns the value of a given flag
ChatterboxAddFunction("endGame", EndGame);										// Closes the game
#endregion CHATTERBOX INITIALIZE CUSTOMS