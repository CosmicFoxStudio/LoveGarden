// Draw background ---- Alternatives: spr_dream2, spr_dream3
draw_sprite(spr_dream1, -1, 0, 0);
// Draw black bars
// Top part
draw_sprite_ext(spr_px, 0, 0, 0, 1280, 60, 0, c_black, 0.5);
// Bottom part
draw_sprite_ext(spr_px, 0, 0, 300, 1280, 60, 0, c_black, 0.5);

var end_alpha = 0.25;
// Setting fade out
if (!fadeout) {
	a = max(a - 0.005, end_alpha); 
}
else {
	a = min(a + 0.005, 1);
}

// Fade out
draw_sprite_ext(spr_px, 0, 0, 0, 1280, 720, 0, c_black, a);

// Create intro
if (a == end_alpha && !createdIntro) {
	instance_create_layer(0, 0, "Instances_Above", obj_intro);	
	createdIntro = true;
}

if (finishedIntro) {
// ------------- /UNFINISHED
	#region (TO-DO)
/*
	// Fade to white screen
	fadeout = 1;

	if (abs(a - 1) < 0.01 && fadeout == 1) {
		room_goto_next();
	}
*/
	#endregion (TO-DO)
	
	global.state = e_gameStates.CONTINUE_GAME;
	SaveGame();
	TransitionStart(sq_out_trans_fade_white, sq_in_trans_fade_white, rm_dormroom);
}

// Create player
/*
if (finishedIntro && !created_player) {
	instance_create_layer(0, 0, "Instances_Above", obj_player_creator);	
	created_player = true;
}
*/

// Reset
DrawReset();
