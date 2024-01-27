// Custom Chatterbox Functions (alphabetical order)
ChatterboxAddFunction("addAction", GameAddAction);					// Increments by 1 global.action 
ChatterboxAddFunction("addBlossom", StatsAddBlossom);				// Increments specified SO's blossom stats
ChatterboxAddFunction("assignRoute", RouteAssign);					// Assign a character route
ChatterboxAddFunction("backTitle", GameBackToTitle);				// Goes back to the title screen and changes game state
ChatterboxAddFunction("bg", BackgroundSetIndex);					// Function to change background
ChatterboxAddFunction("chara", CharacterOnScreen);					// Function to draw character
ChatterboxAddFunction("emotion", CharacterExpressionOnScreen);		// Function to change character expression
ChatterboxAddFunction("getBlossom", StatsGetBlossom);				// Returns specified SO's blossom stats
ChatterboxAddFunction("getFlag", FlagGet);							// Returns the value of a given flag
ChatterboxAddFunction("growth", StatsGetGrowth);					// Returns growth stats
ChatterboxAddFunction("nextDay", NextDay);							// Increments by 1 global.day. Set global.currentDaytime to morning
ChatterboxAddFunction("nextDaytime", NextDaytime);					// Increments by 1 global.currentDaytime
ChatterboxAddFunction("nextRoom", NextRoom);						// Function to change scene
ChatterboxAddFunction("dialogueWait", DialogueWait);				// Makes the textbox wait for x seconds
ChatterboxAddFunction("save", SaveGame);							// Calls the save script from inside a yarn file
ChatterboxAddFunction("setFlag", FlagSet);							// Sets a value to a flag
ChatterboxAddFunction("setMap", SetMap);
ChatterboxAddFunction("transition", DialogueTransition);			// Transition VFX
ChatterboxAddFunction("wilting", StatsGetWilting);					// Returns wilting stats

// Custom Chatterbox Variables
// ChatterboxVariableDefault("player", global.playerName);			// (UNUSED) Variable to store the player's name

// Initialize variables
node = undefined;
chatterbox = noone;
text = "";
nodeName = "Morning";
roomName = "";
optionIndex = 0;                                
optionHovered = -1; 

// Object depth
//depth = -100;

// ----------------------------- SCRIBBLE ----------------------------- //
// Setup font
scribble_font_set_default(font_get_name(fnt_dialogue));

// Typist
textSpd = 0.5;
typist = scribble_typist();
typist.in(textSpd, 0.8);
skipCounter = 0;
textLength = 0;

// Delays in punctuation
typist.character_delay_add(".", 50);
typist.character_delay_add("!", 200);
typist.character_delay_add("?", 200);
typist.character_delay_add(",", 200);

// Waving effect
scribble_anim_wave(1, 0.2, 0.4);
