///@description Draw Grid

#region GRID
if (keyboard_check_pressed(ord("G"))) debugShowGrid = !debugShowGrid;
if (debugShowGrid) {
	DrawSet(c_blue, 0.3);

	// Draw horizontal lines
	for (var i = 0; i <= numHorizontalLines; i++) {
		var yy = i * gridSpacing;
		draw_line(0, yy, room_width, yy);
	}

	// Draw vertical lines
	for (var j = 0; j <= numVerticalLines; j++) {
		var xx = j * gridSpacing;
		draw_line(xx, 0, xx, room_height);
	}
}
#endregion GRID

// Reset
DrawReset();
