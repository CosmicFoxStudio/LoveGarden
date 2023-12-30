// Set draw properties
function DrawSet(_color = c_white, _alpha = 1){
	draw_set_color(_color);
	draw_set_alpha(_alpha);
}

// Set alignment
function DrawAlign(halign = fa_left, valign = fa_middle) {
	draw_set_halign(halign);
	draw_set_valign(valign);
}

// Reset draw properties
function DrawReset() {
	DrawSet();
	DrawAlign();
	draw_set_halign(-1);
	draw_set_valign(-1);
}
