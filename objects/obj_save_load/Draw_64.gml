/// @description Draw save slots
// Lots of hardcoded stuff here x-x Will improve that later!!

// Save directory path - should be inside %localappdata%\love-garden
if (global.state == e_gameStates.FILE_SELECTION) {
	
	// To center on the screen	
	startX = (SCREEN_WIDTH/ 2);
	startY = (SCREEN_HEIGHT / 2) - (sprite_get_height(spr_saveslot_box) * 1.2);
	
	// Drawing the three save slot boxes
	for (var saveSlots = 0; saveSlots < maxSlots; saveSlots++) {
		yy = startY + (saveSlots * (sprite_get_height(spr_saveslot_box) * 1.2));
		
		// Checking if the slot is highlighted
		if (selectedOption == saveSlots) subimage = 1;
		else subimage = 0;
		
		draw_sprite(spr_saveslot_box, subimage, startX, yy);
		
		// Checking if a save file exists for the selected slot
		if !file_exists("file_" + string(saveSlots) + ".sav") {
			/* Name of the saves:
				"file_0.sav"
				"file_1.sav"
				"file_2.sav"
			*/
			draw_set_font(fnt_menu); // draw_set_font(fnt_dialogue);
			draw_set_color(c_white);
			DrawAlign(fa_center, fa_middle);
			
			draw_text(startX, yy, "NO DATA");
		}
		// The file exists
		else {
			var plantX = (startX - (sprite_get_width(spr_saveslot_box) / 2) ) + (sprite_get_width(spr_sprout));
			
			var plantY = yy + (sprite_get_height(spr_sprout) / 2);
			if (selectedOption == saveSlots) {
				draw_sprite_ext(spr_sprout, -1, plantX, plantY, 1, 1, 0, c_white, 1);
			}
			else {
				draw_sprite_ext(spr_sprout, 0, plantX, plantY, 1, 1, 0, c_grey, 1);
			}
			
			#region DRAW STATS
			
			// NAME
			draw_set_halign(fa_center);
			draw_text(startX - 20, yy - 20, saveSlotInfo[saveSlots, e_saveSlotStats.NAME]);

			// DATE
			placeX = startX + 20;
			placeY = yy;
			
			draw_set_halign(fa_right);
			draw_text(placeX, placeY, saveSlotInfo[saveSlots, e_saveSlotStats.DATE]);
			
			/*
			// LOCATION
			draw_set_halign(fa_right);
			dateX = startX - 38;
			dateY = yy + 5;
			
			draw_set_halign(fa_left);
			draw_text(dateX, dateY, saveSlotInfo[saveSlots, e_saveSlotStats.PLACE]);
			*/
			
			// DAY
			draw_set_halign(fa_right);
			dayX = startX + 70;
			dayY = yy - 20;
			
			draw_set_halign(fa_left);
			draw_text(dayX, dayY, saveSlotInfo[saveSlots, e_saveSlotStats.DAY]);
			
			// DAYTIME
			daytimeX = startX + 140;
			daytimeY = yy;
			
			draw_set_halign(fa_right);
			
			switch (saveSlotInfo[saveSlots, e_saveSlotStats.DAYTIME]) {
				case e_daytime.MORNING:
					draw_text(daytimeX, daytimeY, "Morning");
				break;
				case e_daytime.AFTERNOON:
					draw_text(daytimeX, daytimeY, "Afternoon");
				break;
				case e_daytime.EVENING:
					draw_text(daytimeX, daytimeY, "Evening");
				break;
				default:
					draw_text(daytimeX, daytimeY, "Dawn");
				break;
				
			}
			
			
			#endregion DRAW STATS
		}
	}
}


// Reset
DrawReset();
