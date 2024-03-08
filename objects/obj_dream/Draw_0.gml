// Draw background ---- Alternatives: spr_dream2, spr_dream3
draw_sprite(spr_dream1, -1, 0, 0);
// Draw black bars
// Top part
draw_sprite_ext(spr_px, 0, ORIGIN_X, ORIGIN_Y, 1280, 60, 0, c_black, 0.5);
// Bottom part
draw_sprite_ext(spr_px, 0, ORIGIN_X, 300, 1280, 60, 0, c_black, 0.5);

var end_alpha = 0.25;
// Setting fade out
if (!fadeout) {
	a = max(a - 0.005, end_alpha); 
}
else {
	a = min(a + 0.005, 1);
}

// Fade out
draw_sprite_ext(spr_px, 0, ORIGIN_X, ORIGIN_Y, 1280, 720, 0, c_black, a);

// Create intro
if (a == end_alpha && !createdIntro) {
	instance_create_layer(ORIGIN_X, ORIGIN_Y, "Instances_Above", obj_intro);	
	createdIntro = true;
}

// Player Creator
if (finishedIntro && !createdPlayer) {
	//GameTransition(sq_trans_fade_black);
	instance_create_layer(ORIGIN_X, ORIGIN_Y, "Instances_Above", obj_player_creator);	
	createdPlayer = true;
}

// Player has finished choosing name & pronouns
if (finishedPlayer) {
	global.state = e_gameStates.CONTINUE_GAME;
	SaveGame();
	GameCreateUI();
	
	//scribble("... What a weird dream.").wrap(300).align(fa_center, fa_top).draw(320, 150, typist);
	
	// Reset
	DrawReset();
	
	// Transition to next scene
	GameTransitionChangeRoom(rm_dormitory, sq_trans_fade_white);
		
	// Job done
	instance_destroy();
}

// Reset
DrawReset();
