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
function DebugDrawBox(_xx, _yy, _title, _lines, _font = fnt_dialogue, _bgColor = c_black, _textColor = c_white, _BUFFER = 10, _alpha = 0.5) {
    // Set up drawing settings
    DrawFont(_font);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    // Determine the maximum width of the text
    var maxWidth = 0;
    for (var i = 0; i < array_length(_lines); i++) {
        var stringWidth = string_width(string(_lines[i]));
        if (stringWidth > maxWidth) {
            maxWidth = stringWidth;
        }
    }

    // Set the width and height of the box
    var boxWidth = maxWidth + _BUFFER * 2;
    var boxHeight = array_length(_lines) * 10 + _BUFFER * 2;

    // Draw the box
    draw_set_alpha(_alpha);
    draw_set_color(_bgColor);
    draw_roundrect(_xx - _BUFFER, _yy - _BUFFER, boxWidth + _BUFFER * 2, boxHeight + _BUFFER * 2, false);

    // Draw the title
	draw_set_alpha(1); 	// RESET ALPHA
    draw_set_color(c_aqua);
    draw_text(_xx, _yy - _BUFFER/2, _title);

    // Draw the lines of text
    draw_set_color(_textColor);
    var lineY = _yy + 10;
    for (var i = 0; i < array_length(_lines); i++) {
        draw_text(_xx + _BUFFER, lineY, _lines[i]);
        lineY += 10;
    }
}

// Check if the room is restricted and cannot be teleported to
function IsRoomRestricted(_roomName) {
    return (_roomName == "rm_init" || _roomName == "rm_template");
}

function DebugPauseState() {
	if (keyboard_check_pressed(ord("P"))) {
		if (togglePause == false) {
			togglePause = true;
			GameChangeState(e_gameStates.PAUSED);
			show_debug_message("Game was paused.");
		}
		else if (togglePause == true) {
			togglePause = false;
			GameChangeState(global.statePrevious);
			show_debug_message("Game was resumed.");
		}
	}
}

function DebugTransition() {
	if (global.debug && keyboard_check_pressed(ord("T"))) {	
		GameTransition(sq_trans_fade_white);
	}
}
