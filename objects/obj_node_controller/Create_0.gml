// Custom Chatterbox Functions 
ChatterboxAddFunction("bg", BackgroundSetIndex);					// Function to change background
ChatterboxAddFunction("nextRoom", NextRoom);						// Function to change scene
ChatterboxAddFunction("chara", CharacterOnScreen);					// Function to draw character
ChatterboxAddFunction("emotion", CharacterExpressionOnScreen);		// Function to change character expression
ChatterboxAddFunction("wilting", StatusGetWilting);					// Returns wilting status
ChatterboxAddFunction("growth", StatusGetGrowth);					// Returns growth status
ChatterboxAddFunction("blossom", StatusGetBlossom);					// Returns blossom status
ChatterboxAddFunction("favePlace", FlagGetFavePlace);				// Returns favePlace flag
ChatterboxAddFunction("love", FlagGetLove);							// Returns love ending flag
ChatterboxAddFunction("bad", FlagGetBad);							// Returns bad ending flag

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
typist.character_delay_add(".", 20);
typist.character_delay_add("!", 500);
typist.character_delay_add("?", 500);
typist.character_delay_add(",", 500);
