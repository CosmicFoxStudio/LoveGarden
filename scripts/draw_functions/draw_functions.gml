// Set draw properties
function DrawSet(_color = c_white, _alpha = 1){
	draw_set_color(_color);
	draw_set_alpha(_alpha);
}

// Set alignment
function DrawAlign(_halign = fa_left, _valign = fa_top) {
	draw_set_halign(_halign);
	draw_set_valign(_valign);
}

// Reset draw properties
function DrawReset() {
	DrawSet();
	DrawAlign();
}

// Sets the font and keeps track of the last font used in a global.
function DrawFont(_font) {
    if (_font != global.lastFontUsed) {
        draw_set_font(_font);
        global.lastFontUsed = font_get_name(_font);
    }
}
