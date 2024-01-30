image_speed = 0.05;
a = 1;
fadeout = 0;
createdIntro = false;
finishedIntro = false;
createdPlayer = false;
finishedPlayer = false;
startedTransition = false;
finishedTransition = false;
// ----------------------------- SCRIBBLE ----------------------------- //
// Setup font
scribble_font_set_default(font_get_name(fnt_menu));

// Typist
typist = scribble_typist();
textSpd = 0.25;
typist.in(textSpd, 0.8);

// Delays in punctuation
typist.character_delay_add(".", 50);
typist.character_delay_add("!", 800);
typist.character_delay_add("?", 800);
typist.character_delay_add(",", 800);
