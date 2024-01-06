if (global.pause) exit;

// Prepare for drawing
draw_set_color(c_white);
DrawAlign(fa_center, fa_top);

/* 
Find how many characters are on each page and store that number in the "textLength" variable.
It's important to use .get_glyph_count() so Scribble's Typist doesn't count command tags such as [scale] as characters.
For this reason, string_length() wouldn't work here.
*/
textLength = scribble(text[page]).get_glyph_count();

// Checking input
if ( (global.PRESSED_CONFIRM || global.PRESSED_MOUSE_LEFT) && twFadeOutState != e_fadeoutState.FADING_OUT ) {
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
		} // scribble()
		
		// Incrementing the skip counter 
		// Can be useful to make characters become annoyed when you skip their text too much lol
		if (typist.get_skip()) {
			skipCounter++;	
		}
	}
}

// If typist has finished fading out and not on last page
if (twFadeOutState == e_fadeoutState.FINISHED && (page < array_length(text) - 1)) {
		// Next page
		page += 1; 
		
		// Reset state
		twFadeOutState = e_fadeoutState.IDLE;
}

// Reached last page
if (page >= array_length(text) - 1) {
		twFadeOutState = e_fadeoutState.FADING_OUT;
		ended = true;
}

// Draw the text
if (twFadeOutState == e_fadeoutState.FADING_OUT) {
	// This fade out is not working :'(
	draw_set_alpha(Wave(0.3,0.8,1,0));
	scribble(text[page]).wrap(300).draw(190, 140, typist);
	draw_set_alpha(1);
	twFadeOutState = e_fadeoutState.FINISHED;
}
else {
	scribble(text[page]).wrap(300).draw(190, 140, typist);	
}


if (twFadeOutState = e_fadeoutState.FINISHED && ended) {
	obj_dream.finishedIntro = true;
	
	// Job done
	TransitionStart(sq_out_trans_fade_black, sq_in_trans_fade_black);
	instance_destroy();
}

// Reset
DrawReset();
