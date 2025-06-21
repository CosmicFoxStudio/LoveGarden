function GAME_DATA() {
// YOU CAN CHANGE THE VALUES IN THIS SCRIPT
global.gameMode = e_gameMode.RELEASE;
global.saveFileName = ConvertGameModeToString(true);
global.state = e_gameStates.TITLE_SCREEN;
global.statePrevious = global.state;
global.eventID = 1; // Rename to global.lastEvent?
global.chara = {};
global.emotions = [];
// Day Info
global.day = 1;
global.currentDaytime = e_daytime.MORNING;
global.actions[0] = 0;	// DAY 0 (for debug)
global.actions[1] = 3;	// DAY 1
global.actions[2] = 3;	// DAY 2
global.actions[3] = 3;	// DAY 3
global.actions[4] = 3;	// DAY 4
global.maxActions = [0, 5, 5, 5, 5];

// Player
global.playerName = "PLAYER";
global.pronouns = e_pronouns.ELU;
global.my_hearts = 0;

// Routes
global.routes[e_chara.IPE] = false;
global.routes[e_chara.CARU] = false 
global.routes[e_chara.CARNA] = false; 
global.routes[e_chara.ROSE] = false; 
global.routes[e_chara.HYDRA] = false; 

// Emotions 2D Array
global.emotions[e_chara.MAPLE] = ["neutral"];
global.emotions[e_chara.IPE] = [
"neutral", "surprise", "happy", "annoyed", "awkward", "sidelook", "scared"
];
global.emotions[e_chara.CARU] = [
"neutral", "neutral-talking", "happy", "surprise", "disappointed", "sad", "serious"
]; 
global.emotions[e_chara.CARNA] = [
"neutral", "smug", "smile", "disappointed", "angry", "uncomfortable", 
"sad", "sad-talking", "emotional", "surprise", "surprise-left", "surprise-down", "upset", "cry"
];
global.emotions[e_chara.ROSE] = [
"neutral", "serious", "surprise", "smug", "angry", "angry-talking"
];
global.emotions[e_chara.HYDRA] = [
"neutral", "neutral-left", "happy", "smug", "upset", "surprise"
];
global.emotions[e_chara.FERN] = [
"neutral", "confused", "disappointed", "happy", "surprise"
];
global.emotions[e_chara.ORANGE] = [
"neutral", "serious", "serious-talk", "up", "surprise"
];

global.flags = { 
	met_solanum: 0,
	orange_photo_book_talk: false,
	met_hydra: false,
	sat_with_ype: false,
	sat_with_hydra: false,
	stood_ype_up: false,
	sat_alone: false
};

// Populate global.chara struct
// if (global.debug) struct_set(global.chara, "maple", new CharaDefinition(e_chara.MAPLE, "maple", true));
variable_struct_set(global.chara, "ipe", new CharaDefinition(e_chara.IPE, "ipe", true));
variable_struct_set(global.chara, "caru", new CharaDefinition(e_chara.CARU, "caru", true));
variable_struct_set(global.chara, "carna", new CharaDefinition(e_chara.CARNA, "carna", true));
variable_struct_set(global.chara, "rose", new CharaDefinition(e_chara.ROSE, "rose", true));
variable_struct_set(global.chara, "hydra", new CharaDefinition(e_chara.HYDRA, "hydra", true));
variable_struct_set(global.chara, "fern", new CharaDefinition(e_chara.FERN, "fern"));
variable_struct_set(global.chara, "orange", new CharaDefinition(e_chara.ORANGE, "orange"));

#region DECIDE ROOM BG
global.roomBGMap = ds_map_create();
global.roomBGMap[? "rm_dormitory"]		= [spr_dormitory_0, spr_dormitory_1, spr_dormitory_2, spr_dormitory_3, spr_dormitory_4, spr_dormitory_5];
global.roomBGMap[? "rm_boat"]			= [spr_boat_parallax];
global.roomBGMap[? "rm_sciences"]		= [spr_sciences_0, spr_sciences_1];
global.roomBGMap[? "rm_central"]		= [spr_central_0, spr_central_1];
global.roomBGMap[? "rm_lake"]			= [spr_lake];
global.roomBGMap[? "rm_gazebo"]			= [spr_gazebo];
#endregion DECIDE ROOM BG

#region EVENTS
global.events = [];
// ----------------------------- ADD EVENTS -------------------------------- //
/// DAY 1
// Test Event 0
EventDefinition(0, "scenes/main_day0_test.yarn", "test", 1, "Morning", mus_funny, "rm_dormitory", ["Morning"]);
// Event 1
EventDefinition(1, "scenes/main_day1_dormitory.yarn", "canon", 1, "Morning", mus_funny, "rm_dormitory", ["CaruIntro", "LateArrival"]);
// Event 2
EventDefinition(2, "scenes/main_day1_boat.yarn", "canon", 1, "Morning", mus_peaceful, "rm_boat", ["Departure"]);
// Event 3
EventDefinition(3, "scenes/main_day1_sciences.yarn", "canon", 1, "Morning", mus_unicorridor, "rm_sciences", ["IpeIntro", "CarnaIntro"]);
// Event 4
EventDefinition(4, "scenes/main_day1_sciences.yarn", "canon", 1, "Noon", mus_unicorridor, "rm_sciences", ["AfterClass"]);
// Event 5 / Bonus Event 1
EventDefinition(5, "scenes/main_day1_bonus.yarn", "bonus", 1, "Noon", snd_silence, "rm_map", ["ArtMeeting", "IntrospectionI", "FragranceOnTheMist"]);
// Event 6
EventDefinition(6, "scenes/main_day1_boat.yarn", "canon", 1, "Noon", mus_peaceful, "rm_boat", ["Arrival"]);
// Event 7 / Bonus Event 2
EventDefinition(7, "scenes/main_day1_bonus.yarn", "bonus", 1, "Afternoon", snd_silence, "rm_map", ["CitrusMeeting", "CampusPaper"]);
// Event 8
EventDefinition(8, "scenes/main_day1_dormitory.yarn", "canon", 1, "Afternoon", mus_mysterious, "rm_dormitory", ["Chitchat"]);
// Event 9 / Bonus Event 3
EventDefinition(9, "scenes/main_day1_bonus.yarn", "bonus", 1, "Night", snd_silence, "rm_map", ["FragranceOnTheMist", "IntrospectionII"]);
// Event 10
EventDefinition(10, "scenes/main_day1_dormitory.yarn", "canon", 1, "Night", snd_silence, "rm_dormitory", ["GoodNight"]);
// Event 11
EventDefinition(11, "scenes/main_day2_dormitory.yarn", "canon", 2, "Morning", mus_peaceful, "rm_dormitory", ["WakeUpCall, WhatsUpGirl"]);
// ------------------------------------------------------------------------- //
global.event = global.events[0];
#endregion EVENTS

//-------------------------------- CHATTERBOX ------------------------------ //
// Creates the roomYarnMap data structure (to get node based on room)
global.roomYarnMap = ds_map_create();

// This DS needs to be updated everytime the day changes
// For that, use: UpdateRoomYarnMap()
UpdateRoomYarnMap();

#region CHATTERBOX LOAD FILES
global.dialogueList = [];
	
// Not in browser - Load the canon files dynamically
if (os_browser == browser_not_a_browser) { LoadDialogueFiles(); }
else {
	// In browser - load files manually
	if (global.gameMode == e_gameMode.MVP) {
		// DEMO MODE
		ChatterboxLoadFromFile("scenes/mvp_day0_test.yarn");
		ChatterboxLoadFromFile("scenes/mvp_day1_bonus.yarn");
		ChatterboxLoadFromFile("scenes/mvp_day1_dormitory.yarn");
		ChatterboxLoadFromFile("scenes/mvp_day1_boat.yarn");
		ChatterboxLoadFromFile("scenes/mvp_day1_sciences.yarn");
		ChatterboxLoadFromFile("scenes/mvp_day1_central.yarn");
	}
	/*
	else if (global.gameMode == e_gameMode.TEASER) {
		// TEASER MODE
		ChatterboxLoadFromFile("scenes/teaser.yarn");
	}
	*/
	/* // HTML5 version is only for demo/mvp
	else {
		// RELEASE MODE
		ChatterboxLoadFromFile("scenes/main_day0_test.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_dormitory.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_boat.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_bonus.yarn");
		ChatterboxLoadFromFile("scenes/main_day1_sciences.yarn");
		ChatterboxLoadFromFile("scenes/main_day2_dormitory.yarn");
	}
	*/
}

#endregion CHATTERBOX LOAD FILES

// ----------------------- Chatterbox Localization Build -----------------------  //

// Only uncomment this next line when there are NEW dialogue lines to be generated!!
// (You will also need do disable sandboxing temporarily | Game Options -> Windows -> General -> Disable file system sandbox)
ChatterboxLocalizationBuild(global.dialogueList, [("lang/" + global.lang + "_dialogues.csv")]);
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
ChatterboxAddFunction("progress", EventProgress);								// Goes to next event -- updates game progress
ChatterboxAddFunction("reward", EventFinished);									// Shows Reward Pop Up
#endregion CHATTERBOX INITIALIZE CUSTOMS
}