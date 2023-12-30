///@description Draw Grid

if (global.debug) {
// -------------------- Grid ----------------------- //
	var _string = "Show Grid: G\nGame Debug: 1\nLanguage Debug: 2\nCharacter Debug: 3\nShow FPS: F";
	draw_text(475, 10, _string);
	
	if (keyboard_check_pressed(ord("G"))) debugShowGrid = !debugShowGrid;
	if (debugShowGrid) {
		DrawSet(c_blue, 0.3);

		// Draw horizontal lines
		for (var i = 0; i <= numHorizontalLines; i++) {
		    var _yy = i * gridSpacing;
		    draw_line(0, _yy, room_width, _yy);
		}

		// Draw vertical lines
		for (var j = 0; j <= numVerticalLines; j++) {
		    var _xx = j * gridSpacing;
		    draw_line(_xx, 0, _xx, room_height);
		}
	}
	
	// Reset
	DrawReset();
}
