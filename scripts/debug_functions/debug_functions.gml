// This function checks the DEBUGGING macro to allow DEBUG_DRAWER to do its magic
// When in test mode, DEBUGGING should be flagged as true to help with debug in real time
// Final build should have the DEBUGGING macro flagged as false
function Debug() {
	var d = DEBUGGING;
	if (d) return true;
}

// Script to draw a debug info box
// Parameters:
// - x: x-coordinate of the top-left corner of the box
// - y: y-coordinate of the top-left corner of the box
// - title: the title of the box
// - lines: an array of strings representing the lines of text to display in the box
// - [font]: the font to use for the text (optional)
// - [bgColor]: the background color of the box (optional)
// - [textColor]: the text color of the box (optional)
// - [BUFFER]: the padding around the text (optional)
// - [alpha]: the alpha (transparency) of the box (optional, default 0.5)
function DebugDrawBox(
	_xx, _yy, _title, _lines, _font = fnt_dialogue, _bg_color = c_black, 
	_text_color = c_white, _BUFFER = 10, _alpha = 0.5
	) {

    // Set up drawing settings
    draw_set_font(_font);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // Determine the maximum width of the text
    var max_width = 0;
    for (var i = 0; i < array_length(_lines); i++) {
        var _string_width = string_width(string(_lines[i]));
        if (_string_width > max_width) {
            max_width = _string_width;
        }
    }

    // Set the width and height of the box
    var box_width = max_width + _BUFFER * 2;
    var box_height = array_length(_lines) * 10 + _BUFFER * 2;

    // Draw the box
    draw_set_alpha(_alpha);
    draw_set_color(_bg_color);
    draw_roundrect(_xx - _BUFFER, _yy - _BUFFER, box_width + _BUFFER * 2, box_height + _BUFFER * 2, false);

    // Draw the title
	draw_set_alpha(1); 	// RESET ALPHA
    draw_set_color(c_aqua);
    draw_text(_xx, _yy - _BUFFER/2, _title);

    // Draw the lines of text
    draw_set_color(_text_color);
    var line_y = _yy + 10;
    for (var i = 0; i < array_length(_lines); i++) {
        draw_text(_xx + _BUFFER, line_y, _lines[i]);
        line_y += 10;
    }
}