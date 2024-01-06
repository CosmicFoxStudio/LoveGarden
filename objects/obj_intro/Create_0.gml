/// @description Initialization
ended = false;
textSpd = 0.25;
page = 0;
text[0]	= ". . .";
text[1]	= "There is something new here.";
text[2]	= "You can see a wonderful view of the fields,\nthe aqueducts and the river lines.";
text[3]	= "There's a comforting summer breeze."
text[4]	= "It's time for new beginnings.[delay,200]\nFor new reflections.";
text[5]	= "But it's also time for relaxing.";
text[6]	= "Hey, if you could live it all over again, but already knowing how everything should happen,";
text[7]	= ". . . and with the power to avoid everything bad.";
text[8]	= "Would you do it?";
text[9]	= "Even if it means erasing all memories and rebuilding from scratch...[delay]?";
text[10] = "Would you do it[delay] all over again?";
text[11] = "";
textLength = scribble(text[page]).get_glyph_count();

// ----------------------------- SCRIBBLE ----------------------------- //
// Setup font
scribble_font_set_default(font_get_name(fnt_menu));

// Changing font's kerning
//scribble_glyph_set(font_get_name(global.font_main), all, SCRIBBLE_GLYPH.SEPARATION, 10, false);

// Typist
typist = scribble_typist();
typist.in(textSpd, 0.8);
skipCounter = 0;

// Delays in punctuation
typist.character_delay_add(".", 50);
typist.character_delay_add("!", 800);
typist.character_delay_add("?", 800);
typist.character_delay_add(",", 800);

twFadeOutState = e_fadeoutState.IDLE;

// Adding events
scribble_typists_add_event("rumble", scribble_event_rumble);
