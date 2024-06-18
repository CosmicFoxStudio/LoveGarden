// Initialize variables
chatterbox = noone;
// text = "";
speaker = "";
nodeName = InitialNode();
roomName = "";
optionIndex = 0;                                
optionHovered = -1; 

// Object depth
//depth = -100;

// This method updates a few variables (including a global and obj_character's currentSpeaker variable)
UpdateChatterbox = function() {
	obj_characters.currentSpeaker = ChatterboxGetContentSpeaker(chatterbox, 0);
	speaker = ChatterboxGetContentSpeaker(chatterbox, 0);
	global.textComplete = false;
}

// ----------------------------- SCRIBBLE ----------------------------- //
// Setup scribble font
SelectScribbleDialogFont(global.fontType, global.fontSize);

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