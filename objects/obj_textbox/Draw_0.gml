draw_self();

// Draw nametag box
var posX = SCREEN_WIDTH/4;
if (obj_characters.currentSpeaker != "") { // Remove nametag if narrator is speaking
	draw_sprite(spr_tooltip_box2, 1, posX + 4, 242);
}

// Draw tooltip
if (global.textComplete) draw_sprite(spr_tooltip_enter, 0, 515, 315);
