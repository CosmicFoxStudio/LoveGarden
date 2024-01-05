// Prepare for drawing
draw_set_color(c_white);
DrawAlign(fa_center, fa_top);

/* 
Find how many characters are on each page and store that number in the "text_length" variable.
It's important to use .get_glyph_count() so Scribble's Typist doesn't count command tags such as [scale] as characters.
For this reason, string_length() wouldn't work here.
*/
text_length = scribble(strings[page]).get_glyph_count();

// Checking input
if ( (global.SPACE_CONFIRM || global.MOUSE_CONFIRM) && tw_fade_out_state != e_fadeout_state.FADING_OUT ) {
	// Means the page is fully typed out
	if ((typist.get_position() - 1) == text_length) {
		
		// Start text fade out to later increment page
		tw_fade_out_state = e_fadeout_state.FADING_OUT;
	}

	// Not done typing
	else {
		// If not finished typing, skip 
		if (typist.get_position() < text_length) {
			typist.skip();
		} // scribble()
		
		// Incrementing the skip counter 
		// Can be useful to make characters become annoyed when you skip their text too much lol
		if (typist.get_skip()) {
			skip_counter++;	
		}
	}
}

// If typist has finished fading out and not on last page
if (tw_fade_out_state == e_fadeout_state.FINISHED && (page < array_length(strings) - 1)) {
		// Next page
		page += 1; 
		
		// Reset state
		tw_fade_out_state = e_fadeout_state.IDLE;
}

// Reached last page
if (page >= array_length(strings) - 1) {
		tw_fade_out_state = e_fadeout_state.FADING_OUT;
		ended = true;
}

// Draw the text
if (tw_fade_out_state == e_fadeout_state.FADING_OUT) {
	// This fade out is not working :'(
	DrawFont(fnt_dialogue);
	draw_set_alpha(Wave(0.3,0.8,1,0));
	scribble(strings[page]).wrap(300).draw(190, 140, typist);
	draw_set_alpha(1);
	tw_fade_out_state = e_fadeout_state.FINISHED;
}
else {
	DrawFont(fnt_dialogue);
	scribble(strings[page]).wrap(300).draw(190, 140, typist);	
}


if (tw_fade_out_state = e_fadeout_state.FINISHED && ended) {
	obj_dream.finished_intro = true;
	#region (TO-DO)
/*
	// Fade to white screen
	fadeout = 1;

	if (abs(a - 1) < 0.01 && fadeout == 1) {
		room_goto_next();
	}
*/
	// Temporary
	TransitionStart(rm_dormroom, sq_out_trans_fade_white, sq_in_trans_fade_white);
	
	#endregion (TO-DO)
	
	// Job done
	// instance_destroy();
}

// Reset
DrawReset();
