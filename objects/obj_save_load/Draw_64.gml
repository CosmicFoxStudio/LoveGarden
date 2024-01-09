/// @description Draw save slots
// Lots of hardcoded stuff here x-x Will improve that later!!

if (global.state == e_gameStates.FILE_SELECTION) {
	
	// To center on the screen	
	startX = (SCREEN_WIDTH/ 2);
	startY = (SCREEN_HEIGHT / 2) - (sprite_get_height(sprite_index) * 1.2);
	
	// Drawing the three save slot boxes
	for (var saveSlots = 0; saveSlots < maxSlots; saveSlots++) {
		yy = startY + (saveSlots * (sprite_get_height(sprite_index) * 1.2));
		
		// Checking if the slot is highlighted
		if (selectedOption == saveSlots) subimage = 1;
		else subimage = 0;
		
		draw_sprite(sprite_index, subimage, startX, yy);
		
		// Checking if a save file exists for the selected slot
		if !file_exists("file_" + string(saveSlots) + ".sav") {
			/* Name of the saves:
				"file_0.sav"
				"file_1.sav"
				"file_2.sav"
			*/
			
			// Drawing the text data
			DrawSet(c_white);
			DrawAlign(fa_center, fa_middle);
			
			draw_text(startX, yy, saveText[0]);
		}
		// The file exists
		else {
			var plantX = (startX - (sprite_get_width(spr_saveslot_box) / 2) ) + 
			(sprite_get_width(spr_sprout) + 20);
			
			var plantY = yy + (sprite_get_height(spr_sprout) / 2);
			if (selectedOption == saveSlots) {
				draw_sprite_ext(spr_sprout, spriteImage, plantX, plantY, 1, 1, 0, c_white, 1);
			}
			else {
				draw_sprite_ext(spr_sprout, 0, plantX, plantY, 1, 1, 0, c_grey, 1);
			}
			
			#region DRAW STATS
			
			// NAME
			draw_set_halign(fa_center);
			DrawFont(fnt_menu);
			draw_text(startX - 5, yy - 17, saveSlotInfo[saveSlots, e_saveSlotStats.NAME]);
			DrawFont(fnt_dialogue);
			
			// DATE
			dateX = startX - 5;
			dateY = yy + 7;
			
			draw_set_halign(fa_center);
			draw_set_font(fnt_dialogue);
			draw_text(dateX, dateY, DateLocalization(saveSlotInfo[saveSlots, e_saveSlotStats.DATE]));
			
			
			// LOCATION
			draw_set_halign(fa_right);
			placeX = startX + 140;
			placeY = yy + 11;
			
			draw_set_halign(fa_right);
			draw_text(placeX, placeY, PlaceLocalization(saveSlotInfo[saveSlots, e_saveSlotStats.PLACE]));
			
			
			// DAYTIME
			daytimeX = startX + 140;
			daytimeY = yy - 3;
			
			draw_set_halign(fa_right);
			DrawFont(fnt_dialogue);
			
			switch (saveSlotInfo[saveSlots, e_saveSlotStats.DAYTIME]) {
				case e_daytime.MORNING:
					draw_text(daytimeX, daytimeY, saveText[1]);
				break;
				case e_daytime.AFTERNOON:
					draw_text(daytimeX, daytimeY, saveText[2]);
				break;
				case e_daytime.EVENING:
					draw_text(daytimeX, daytimeY, saveText[3]);
				break;
				default:
					draw_text(daytimeX, daytimeY, saveText[4]);
				break;
			}
			
			// DAY
			dayX = startX + 140;
			dayY = yy - 23;
			
			draw_set_halign(fa_right);
			DrawFont(fnt_menu);
			draw_text(dayX, dayY, saveText[5] + " " + string(saveSlotInfo[saveSlots, e_saveSlotStats.DAY]));
			DrawFont(fnt_dialogue);
			#endregion DRAW STATS
		}
	}
}

// Reset
DrawReset();
