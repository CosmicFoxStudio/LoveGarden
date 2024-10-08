// Prepare for drawing
draw_set_color(c_white);
DrawAlign(fa_center, fa_top);

// Typist flow control
TypistCheckPause(typist);

/* 
Find how many characters are on each page and store that number in the "textLength" variable.
It's important to use .get_glyph_count() so Scribble's Typist doesn't count command tags such as [scale] as characters.
For this reason, string_length() wouldn't work here.
*/
textLength = scribble(texts[langIndex][modeIndex][page]).get_glyph_count();

// Checking input
if ((InputCheck("confirm", e_input.KEYBOARD) || InputCheck("confirm", e_input.MOUSE)) &&
    twFadeOutState != e_fadeoutState.FADING_OUT) {
    // Means the page is fully typed out
    if ((typist.get_position() - 1) == textLength) {
        // Start text fade out to later increment page
        twFadeOutState = e_fadeoutState.FADING_OUT;
    }
    // Not done typing
    else {
        // If not finished typing, skip 
        if (typist.get_position() < textLength) {
            typist.skip();
        }

        // Incrementing the skip counter 
        // Can be useful to make characters become annoyed when you skip their text too much lol
        if (typist.get_skip()) {
            skipCounter++;
        }
    }
}

// If typist has finished fading out and not on last page
if (twFadeOutState == e_fadeoutState.FINISHED && (page < array_length(texts[langIndex][modeIndex]) - 1)) {
    // Next page
    page += 1;

    // Reset state
    twFadeOutState = e_fadeoutState.IDLE;
}

// Reached last page
if (page >= array_length(texts[langIndex][modeIndex]) - 1) {
    twFadeOutState = e_fadeoutState.FADING_OUT;
    ended = true;
}

DrawFont(fnt_dialogue);
// Draw the text
if (twFadeOutState == e_fadeoutState.FADING_OUT) {
    // This fade out is not working :'(
    draw_set_alpha(Wave(0.3, 0.8, 1, 0));
    draw_set_alpha(1);
    twFadeOutState = e_fadeoutState.FINISHED;
} else {
    scribble(texts[langIndex][modeIndex][page]).wrap(300).align(fa_center, fa_top).draw(320, 150, typist);
}

if (twFadeOutState == e_fadeoutState.FINISHED && ended) {
    obj_dream.finishedIntro = true;

    // Job done
    instance_destroy();
}

// Reset
DrawReset();
