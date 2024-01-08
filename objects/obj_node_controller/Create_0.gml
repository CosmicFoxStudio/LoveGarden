// Custom Chatterbox Functions 
ChatterboxAddFunction("bg", BackgroundSetIndex);					// Function to change background
ChatterboxAddFunction("nextRoom", NextRoom);						// Function to change scene
ChatterboxAddFunction("chara", CharacterOnScreen);					// Function to draw character
ChatterboxAddFunction("emotion", CharacterExpressionOnScreen);		// Function to change character expression
ChatterboxAddFunction("wilting", StatsGetWilting);					// Returns wilting stats
ChatterboxAddFunction("growth", StatsGetGrowth);					// Returns growth stats
ChatterboxAddFunction("blossom", StatsGetBlossom);					// Returns blossom stats
ChatterboxAddFunction("favePlace", FlagGetFavePlace);				// Returns favePlace flag
ChatterboxAddFunction("love", FlagGetLove);							// Returns love ending flag
ChatterboxAddFunction("bad", FlagGetBad);							// Returns bad ending flag
ChatterboxAddFunction("save", SaveGame);							// Calls the save script from inside a yarn file

// Initialize variables
node = undefined;
chatterbox = noone;
text = "";
nodeName = "Start";
roomName = "";
optionIndex = 0;                                
optionHovered = -1; 

// Object depth
depth = -100;

// ----------------------------- SCRIBBLE ----------------------------- //
// Setup font
scribble_font_set_default(font_get_name(fnt_dialogue));

// Typist
textSpd = 0.5;
typist = scribble_typist();
typist.in(textSpd, 0.8);
skipCounter = 0;

// Delays in punctuation
typist.character_delay_add(".", 50);
typist.character_delay_add("!", 400);
typist.character_delay_add("?", 400);
typist.character_delay_add(",", 400);
