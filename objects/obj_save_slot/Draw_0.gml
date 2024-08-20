/// @description Draw slot info

draw_self();

// To center on the screen	
startX = (SCREEN_WIDTH / 2);
startY = (SCREEN_HEIGHT / 2) - (sprite_get_height(sprite_index));
yy = startY + (slotIndex * (sprite_get_height(sprite_index)));

	// ----------------------------- FILE DOESN'T EXIST ----------------------------- //
if (!file_exists(global.saveFileName + "_" + string(slotIndex) + ".sav")) {		
	// Drawing the text data
	DrawSet(CYAN);
	DrawAlign(fa_center, fa_middle);
			
	// Draws only "EMPTY" or "NEW GAME"
	var newgameText, continueText;
	if (global.lang == "pt") newgameText = "NOVO JOGO";
	else newgameText = "NEW GAME";
	if (global.lang == "pt") continueText = "VAZIO";
	else continueText = "EMPTY";
	if (global.newGame) draw_text(startX, yy, newgameText);
	else draw_text(startX, yy, continueText);
	
	//// Transparency effect
	//if (!global.newGame) image_alpha = 0.5;
	//else image_alpha = 1;
}

// ---------------------------------- FILE EXISTS ----------------------------------- //
else {
	//// Transparency effect
	//if (global.newGame) image_alpha = 0.5;
	//else image_alpha = 1;
	
	// Setup positions
	var plantX = (startX - (sprite_get_width(spr_saveslot_box) / 2) ) + 
	(sprite_get_width(spr_cursor_sprout) + 35);
			
	var plantY = yy + (sprite_get_height(spr_cursor_sprout) / 2);
	if (obj_save_load.selectedOption == slotIndex) {
		draw_sprite_ext(spr_cursor_sprout, spriteImage, plantX, plantY, 1, 1, 0, c_white, 1);
	}
	else {
		draw_sprite_ext(spr_cursor_sprout, 0, plantX, plantY, 1, 1, 0, c_grey, 1);
	}
			
	#region DRAW STATS
			
	// NAME
	draw_set_halign(fa_center);
	DrawFont(fnt_menu);
	draw_text(
		startX - 5, yy - 17, 
		obj_save_load.saveSlotInfo[slotIndex, e_saveSlotStats.NAME]
	);
	DrawFont(fnt_dialogue);
			
			
	// DATE
	dateX = startX + 20;
	dateY = yy + 7;
			
	draw_set_halign(fa_center);
	DrawFont(fnt_dialogue);
	draw_text(
		dateX, dateY, 
		DateLocalization(obj_save_load.saveSlotInfo[slotIndex, e_saveSlotStats.DATE])
	);
			
			
	// LOCATION
	placeX = startX + 140;
	placeY = yy + 11;
			
	draw_set_halign(fa_right);
	draw_text(
		placeX, placeY, 
		Localize("places", obj_save_load.saveSlotInfo[slotIndex, e_saveSlotStats.PLACE])
	);
			
	// DAYTIME
	daytimeX = startX + 140;
	daytimeY = yy - 3;

	// Convert enumeration to string
	switch (obj_save_load.saveSlotInfo[slotIndex, e_saveSlotStats.DAYTIME]) {
		case e_daytime.MORNING:
			
			draw_text(daytimeX, daytimeY, Localize("daytime", "Morning"));
		break;
		case e_daytime.NOON:
			draw_text(daytimeX, daytimeY, Localize("daytime", "Noon"));
		break;
		case e_daytime.AFTERNOON:
			draw_text(daytimeX, daytimeY, Localize("daytime", "Afternoon"));
		break;
		case e_daytime.NIGHT:
			draw_text(daytimeX, daytimeY, Localize("daytime", "Night"));
		break;
		default:
			draw_text(daytimeX, daytimeY, Localize("daytime", "Dawn"));
		break;
	}

	// DAY
	dayX = startX + 140;
	dayY = yy - 23;
			
	DrawFont(fnt_menu);
	draw_text(
		dayX, dayY, 
		Localize("ui", "DAY") + " " + 
		string(obj_save_load.saveSlotInfo[slotIndex, e_saveSlotStats.DAY])
	);
	
	// LANG
	langX = startX - 50;
	langY = yy + 7;
	
	draw_set_halign(fa_center);
	DrawFont(fnt_dialogue);
	draw_text(
		langX, langY,
		"LANG:" + " " + string_upper(obj_save_load.saveSlotInfo[slotIndex, e_saveSlotStats.LANG])
	);
	
	#endregion DRAW STATS
	
}

// Reset
DrawReset();
