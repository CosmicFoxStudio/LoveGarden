/*
	Player will pick a save slot at the start of a game and the data will be saved to that slot
	
	Save directory path is inside %localappdata%\love-garden
*/

function SaveGame() {
	// Do not save if in teaser mode
	if (global.gameMode == e_gameMode.TEASER) return;
	
	var saveStruct = {
		name: global.playerName,
		pronouns: global.pronouns,
		place: global.location,
		daytime: global.currentDaytime,
		day: global.day,
		flags: global.flags, 
		actions: global.actions,
		hearts: {
			mc: global.my_hearts,
			ipe: global.chara.ipe.hearts, 
			caru: global.chara.caru.hearts,
			carna: global.chara.carna.hearts,
			rose: global.chara.rose.hearts,
			hydra: global.chara.hydra.hearts
		},
		lang: global.lang,
		story: global.eventID
	}
	
	var json = json_stringify(saveStruct); // 2nd argument 'true' to prettify
	var file = file_text_open_write(global.saveFileName + "_" + string(global.saveSlot) + ".sav");
	file_text_write_string(file, json);
	file_text_close(file);

	/*
		player_data format: "[slot]_[name]_[date]_[location]_[daytime]_[day]_[lang]_" 
		This is just for displaying these values on the save slot
		Since they're not recorded before the player loads the save
	*/
	
	savedData = global.playerName + "_" + 
				string(global.date) + "_" + 
				string(global.location) + "_" + 
				string(global.currentDaytime) + "_" + 
				string(global.day) + "_" +
				string(global.lang) + "_"; 
	
	var infoFile;
	infoFile = file_text_open_write("info_" + string(global.saveSlot) + ".sav");
	file_text_write_string(infoFile, savedData);
	file_text_close(infoFile);
}

function LoadGame() {
	if (file_exists(global.saveFileName + "_" + string(global.saveSlot) + ".sav")) {
		var file = file_text_open_read(global.saveFileName + "_" + string(global.saveSlot) + ".sav");
		var json = file_text_read_string(file);
		var struct = json_parse(json);
		
		// Update saved data
		global.playerName = struct.name; 
		global.pronouns = struct.pronouns;
		global.my_hearts = struct.hearts;
		global.location = struct.place;
		global.currentDaytime = struct.daytime;
		global.day = struct.day;
		global.flags = struct.flags;
		global.actions = struct.actions;
		global.lang = struct.lang;
		global.eventID = struct.story;
		// Update Hearts
		global.my_hearts = struct.hearts.mc;
		global.chara.ipe.hearts = struct.hearts.ipe;
		global.chara.caru.hearts = struct.hearts.caru;
		global.chara.carna.hearts = struct.hearts.carna;
		global.chara.rose.hearts = struct.hearts.rose;
		global.chara.hydra.hearts = struct.hearts.hydra;
		
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