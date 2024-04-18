function LoadGameData() {

	global.flags = { 
		met_solanum: 0,
		orange_photo_book_talk: false,
		met_hydra: false,
		sat_with_ype: false,
		sat_with_hydra: false,
		stood_ype_up: false,
		sat_alone: false
	};

	global.characterSprites = {
	    "maple": spr_maple,
	    "ype": spr_ype,
	    "caru": spr_caru,
	    "rose": spr_rose,
	    "clove": spr_clove,
	    "hydra": spr_hydra,
	    "fern": spr_fern,
	    "orange": spr_orange,
	    "nanne": spr_nanne,
	    "cali": spr_cali,
	    "void": spr_noone,
	};

	#region DECIDE ROOM SCENE

	// Data structure to get node based on room
	global.roomYarnMap = ds_map_create();
    
	// Assign yarn files based on game mode
	var yarnPrefix = (global.gameMode == e_gameMode.DEMO) ? "scenes/demo_" : "scenes/main_";
	var dayPrefix = string(global.day);
	global.roomYarnMap[? "rm_test"]         = yarnPrefix + "day" + dayPrefix + "_test.yarn";
	global.roomYarnMap[? "rm_dormitory"]    = yarnPrefix + "day" + dayPrefix + "_dormitory.yarn";
	global.roomYarnMap[? "rm_boat"]         = yarnPrefix + "day" + dayPrefix + "_boat.yarn";
	global.roomYarnMap[? "rm_sciences"]     = yarnPrefix + "day" + dayPrefix + "_sciences.yarn";
	global.roomYarnMap[? "rm_central"]      = yarnPrefix + "day" + dayPrefix + "_central.yarn";

	#endregion DECIDE ROOM SCENE

	#region DECIDE ROOM BG
	global.roomBGMap = ds_map_create();
	global.roomBGMap[? "rm_test"]			= [spr_room_title];
	global.roomBGMap[? "rm_dormitory"]		= [spr_dormitory_0, spr_dormitory_1, spr_dormitory_2, spr_dormitory_3, spr_dormitory_4];
	global.roomBGMap[? "rm_boat"]			= [spr_boat];
	global.roomBGMap[? "rm_sciences"]		= [spr_sciences];
	global.roomBGMap[? "rm_central"]		= [spr_central];
	global.roomBGMap[? "rm_lake"]			= [spr_lake];
	global.roomBGMap[? "rm_gazebo"]			= [spr_gazebo];
	
	#endregion DECIDE ROOM BG
}