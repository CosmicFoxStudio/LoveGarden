// Set draw properties
function DrawSet(_color = c_white, _alpha = 1) {
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

/// @description Draws text with an outline
/// @param x The x-coordinate of the text
/// @param y The y-coordinate of the text
/// @param text The string to be drawn
/// @param text_color The color of the main text
/// @param outline_color The color of the outline
/// @param outline_width The width of the outline
/// @param outline_alpha The alpha value of the outline
function DrawTextOutline(_x, _y, _text, _text_color, _outline_color, _outline_width, _outline_alpha) {
    // Save current color and alpha
    var current_color = draw_get_color();
    var current_alpha = draw_get_alpha();

    // Set outline color and alpha
    draw_set_color(_outline_color);
    draw_set_alpha(_outline_alpha);
    
    // Draw text in all directions around the original text position
    for (var i = -_outline_width; i <= _outline_width; i++) {
        for (var j = - _outline_width; j <= _outline_width; j++) {
            if (i != 0 || j != 0) {
                draw_text(_x + i, _y + j, _text);
            }
        }
    }

    // Set main text color and restore alpha
    draw_set_color(_text_color);
    draw_set_alpha(current_alpha);

    // Draw main text
    draw_text(_x, _y, _text);
    
    // Restore original color and alpha
    draw_set_color(current_color);
    draw_set_alpha(current_alpha);
}