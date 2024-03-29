/*
	Player will pick a save slot at the start of a game and the data will be saved to that slot
	
	Save directory path is inside %localappdata%\love-garden
*/

function SaveGame() {
	var saveStruct = {
		playerName: global.playerName,
		playerPronouns: global.pronouns,
		playerStats: global.playerStats,
		place: global.location,
		daytime: global.currentDaytime,
		story: global.progress,
		day: global.day,
		gameFlags: global.flags, 
		npcs: global.NPCs,
		actions: global.actions
	}
	var json = json_stringify(saveStruct); // 2nd argument 'true' to prettify
	var file = file_text_open_write("file_" + string(global.saveSlot) + ".sav");
	file_text_write_string(file, json);
	file_text_close(file);

	/*
		player_data format: "[slot]_[name]_[date]_[location]_[daytime]_[day]_" 
		This is just for displaying these values on the save slot
		Since they're not recorded before the player loads the save
	*/
	
	savedData = global.playerName + "_" + 
				string(global.date) + "_" + 
				string(global.location) + "_" + 
				string(global.currentDaytime) + "_" + 
				string(global.day) + "_";
	
	var statsFile;
	statsFile = file_text_open_write("save_stats_" + string(global.saveSlot) + ".sav");
	file_text_write_string(statsFile, savedData);
	file_text_close(statsFile);
}

function LoadGame() {
	if (file_exists("file_" + string(global.saveSlot) + ".sav")) {
		var file = file_text_open_read("file_" + string(global.saveSlot) + ".sav");
		var json = file_text_read_string(file);
		var struct = json_parse(json);
		
		// Update saved data
		global.playerName = struct.playerName; 
		global.pronouns = struct.playerPronouns;
		global.playerStats = struct.playerStats;
		global.location = struct.place;
		global.currentDaytime = struct.daytime;
		global.progress = struct.story;
		global.day = struct.day;
		global.flags = struct.gameFlags;
		global.NPCs = struct.npcs;
		global.actions = struct.actions;
		
		file_text_close(file);
	}
}

function SetRoom(_location) {
	switch (_location) {
		case "Dormitory":			return rm_dormitory; break;
		case "Boat":				return rm_boat; break;
		case "Science Dept.":		return rm_sciences; break;
		case "Central Building":	return rm_central; break;
		case "Lake":				return rm_lake; break;
		case "Gazebo":				return rm_gazebo; break;
	    default:					return rm_test; break;
	}
}