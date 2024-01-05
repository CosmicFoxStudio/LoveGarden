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
if (a == end_alpha && !created_intro) {
	instance_create_layer(0, 0, "Instances_Above", obj_intro);	
	created_intro = true;
}

// Create player
/*
if (finished_intro && !created_player) {
	instance_create_layer(0, 0, "Instances_Above", obj_player_creator);	
	created_player = true;
}
*/

// Reset
DrawReset();
