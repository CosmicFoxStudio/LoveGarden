/// @description Initialization
ended = false;
text_spd = 0.25;
page = 0;
strings[0]	= ". . .";
strings[1]	= "There is something new here.";
strings[2]	= "You can see a wonderful view of the fields,\nthe aqueducts and the river lines.";
strings[3]	= "There's a comforting summer breeze."
strings[4]	= "It's time for new beginnings.[delay,200]\nFor new reflections.";
strings[5]	= "But it's also time for relaxing.";
strings[6]	= "Hey, if you could live it all over again, but already knowing how everything should happen,";
strings[7]	= ". . . and with the power to avoid everything bad.";
strings[8]	= "Would you do it?";
strings[9]	= "Even if it means erasing all memories and rebuilding from scratch...[delay]?";
strings[10] = "Would you do it[delay] all over again?";
strings[11] = "";
text_length = scribble(strings[page]).get_glyph_count();

// ----------------------------- SCRIBBLE ----------------------------- //
// Setup font
scribble_font_set_default(font_get_name(fnt_dialogue));

// Changing font's kerning
//scribble_glyph_set(font_get_name(global.font_main), all, SCRIBBLE_GLYPH.SEPARATION, 10, false);

// Typist
typist = scribble_typist();
typist.in(text_spd, 0.8);
skip_counter = 0;

// Delays in punctuation
typist.character_delay_add(".", 50);
typist.character_delay_add("!", 800);
typist.character_delay_add("?", 800);
typist.character_delay_add(",", 800);

enum e_fadeout_state {
	IDLE,
	FADING_OUT,
	FINISHED
}

tw_fade_out_state = e_fadeout_state.IDLE;
