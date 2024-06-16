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
	    "ipe": spr_ipe,
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
var yarnPrefix;
var dayPrefix = string(global.day);

switch (global.gameMode) {
    case e_gameMode.DEMO:
        yarnPrefix = "scenes/demo_";
        global.roomYarnMap[? "rm_test"] = yarnPrefix + "day0_test.yarn";
        global.roomYarnMap[? "rm_dormitory"] = yarnPrefix + "day1_dormitory.yarn";
        global.roomYarnMap[? "rm_boat"] = yarnPrefix + "day1_boat.yarn";
        global.roomYarnMap[? "rm_sciences"] = yarnPrefix + "day1_sciences.yarn";
        global.roomYarnMap[? "rm_central"] = yarnPrefix + "day1_central.yarn";
        break;

    case e_gameMode.TEASER:
        yarnPrefix = "scenes/teaser.yarn";
        global.roomYarnMap[? "rm_dormitory"] = yarnPrefix;
        global.roomYarnMap[? "rm_boat"] = yarnPrefix;
        global.roomYarnMap[? "rm_sciences"] = yarnPrefix;
        global.roomYarnMap[? "rm_central"] = yarnPrefix;
        break;

    case e_gameMode.RELEASE:
    default:
        yarnPrefix = "scenes/main_";
        global.roomYarnMap[? "rm_test"] = yarnPrefix + "day0_test.yarn";
        global.roomYarnMap[? "rm_dormitory"] = yarnPrefix + "day" + dayPrefix + "_dormitory.yarn";
        global.roomYarnMap[? "rm_boat"] = yarnPrefix + "day" + dayPrefix + "_boat.yarn";
        global.roomYarnMap[? "rm_sciences"] = yarnPrefix + "day" + dayPrefix + "_sciences.yarn";
        global.roomYarnMap[? "rm_central"] = yarnPrefix + "day" + dayPrefix + "_central.yarn";
        break;
}

#endregion DECIDE ROOM SCENE

	#region DECIDE ROOM BG
	global.roomBGMap = ds_map_create();
	global.roomBGMap[? "rm_dormitory"]		= [spr_dormitory_0, spr_dormitory_1, spr_dormitory_2, spr_dormitory_3, spr_dormitory_4];
	global.roomBGMap[? "rm_boat"]			= [spr_boat];
	global.roomBGMap[? "rm_sciences"]		= [spr_sciences_0, spr_sciences_1];
	global.roomBGMap[? "rm_central"]		= [spr_central_0, spr_central_1];
	global.roomBGMap[? "rm_lake"]			= [spr_lake];
	global.roomBGMap[? "rm_gazebo"]			= [spr_gazebo];
	
	#endregion DECIDE ROOM BG
}