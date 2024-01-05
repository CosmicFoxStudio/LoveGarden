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
