/*
	Player will pick a save slot at the start of a game and the data will be saved to that slot
*/

/*
	Requirements for saving:
	- Need to know ROOM the player is in
	- Need to save all player data (name, pronouns, stats)
	- Need to save all NPC data (stats)
	- Need to save story state
	- Need to save flags
*/

function SaveGame() {
	var saveStruct = {
		name: global.playerName,
		place: global.location,
		daytime: global.currentDaytime,
		day: global.day,
		gameFlags: global.flags, 
	}
	var json = json_stringify(saveStruct); // 2nd argument 'true' to prettify
	var file = file_text_open_write("file_" + string(global.saveSlot) + ".sav");
	file_text_write_string(file, json);
	file_text_close(file);

	/*
		Save Player's Name / Level + Money
		player_data format: "[slot]_[name]_[date]_[location]_[daytime]_[day]" 
		This is just for displaying these values on the save slot
		Since they're not recorded before the player loads the save
	*/
	
	savedData = global.playerName + "_" + string(global.date) + "_" + string(global.currentDaytime) + "_" + string(global.day); // + "_" + string(global.location)
	
	var player_stats_file;
	player_stats_file = file_text_open_write("save_stats_" + string(global.saveSlot) + ".sav");
	file_text_write_string(player_stats_file, savedData);
	file_text_close(player_stats_file);
}

function LoadGame() {
	
	if (file_exists("file_" + string(global.saveSlot) + ".sav")) {
		var file = file_text_open_read("file_" + string(global.saveSlot) + ".sav");
		var json = file_text_read_string(file);
		var struct = json_parse(json);
		
		// Update saved data
		global.playerName = struct.name; 
		global.location = struct.place;
		global.currentDaytime = struct.daytime;
		global.day = struct.day;
		global.flags = struct.gameFlags;
		
		file_text_close(file);
	}
}
