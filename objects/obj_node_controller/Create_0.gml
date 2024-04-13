// Initialize variables
node = undefined;
chatterbox = noone;
text = "";
speaker = "";
nodeName = InitialNode();
roomName = "";
optionIndex = 0;                                
optionHovered = -1; 

// Object depth
//depth = -100;

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