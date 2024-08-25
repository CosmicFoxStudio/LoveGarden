// YOU CAN CHANGE THE VALUES IN THIS SCRIPT
global.gameMode = e_gameMode.RELEASE;
global.state = e_gameStates.TITLE_SCREEN;
global.statePrevious = global.state;
global.chara = {};
global.emotions = [];
// Day Info
global.day = 1;
global.currentDaytime = e_daytime.MORNING;
global.actions[0] = 0;	// DAY 0 (for debug)
global.actions[1] = 3;	// DAY 1
global.actions[2] = 3;	// DAY 2
global.actions[3] = 3;	// DAY 3
global.actions[4] = 3;	// DAY 4
global.maxActions = [0, 5, 5, 5, 5];

// Player
global.playerName = "PLAYER";
global.pronouns = e_pronouns.ELU;
global.my_hearts = 0;

// Routes
global.routes[e_chara.IPE] = false;
global.routes[e_chara.CARU] = false 
global.routes[e_chara.CARNA] = false; 
global.routes[e_chara.ROSE] = false; 
global.routes[e_chara.HYDRA] = false; 

// Emotions 2D Array
global.emotions[e_chara.MAPLE] = ["neutral"];
global.emotions[e_chara.IPE] = [
"neutral", "surprise", "happy", "annoyed", "awkward", "sidelook", "scared"
];
global.emotions[e_chara.CARU] = [
"neutral", "neutral-talking", "happy", "surprise", "disappointed", "sad", "serious"
]; 
global.emotions[e_chara.CARNA] = [
"neutral", "smug", "smile", "disappointed", "angry", "uncomfortable", 
"sad", "sad-talking", "emotional", "surprise", "surprise-left", "surprise-down", "upset", "cry"
];
global.emotions[e_chara.ROSE] = [
"neutral", "serious", "surprise", "smug", "angry", "angry-talking"
];
global.emotions[e_chara.HYDRA] = [
"neutral", "neutral-left", "happy", "smug", "upset", "surprise"
];
global.emotions[e_chara.FERN] = [
"neutral", "confused", "disappointed", "happy", "surprise"
];
global.emotions[e_chara.ORANGE] = [
"neutral", "serious", "serious-talk", "up", "surprise"
];

global.flags = { 
	met_solanum: 0,
	orange_photo_book_talk: false,
	met_hydra: false,
	sat_with_ype: false,
	sat_with_hydra: false,
	stood_ype_up: false,
	sat_alone: false
};

// Populate global.chara struct
// if (global.debug) struct_set(global.chara, "maple", new CharaDefinition(e_chara.MAPLE, "maple", true));
struct_set(global.chara, "ipe", new CharaDefinition(e_chara.IPE, "ipe", true));
struct_set(global.chara, "caru", new CharaDefinition(e_chara.CARU, "caru", true));
struct_set(global.chara, "carna", new CharaDefinition(e_chara.CARNA, "carna", true));
struct_set(global.chara, "rose", new CharaDefinition(e_chara.ROSE, "rose", true));
struct_set(global.chara, "hydra", new CharaDefinition(e_chara.HYDRA, "hydra", true));
struct_set(global.chara, "fern", new CharaDefinition(e_chara.FERN, "fern"));
struct_set(global.chara, "orange", new CharaDefinition(e_chara.ORANGE, "orange"));

#region DECIDE ROOM BG
global.roomBGMap = ds_map_create();
global.roomBGMap[? "rm_dormitory"]		= [spr_dormitory_0, spr_dormitory_1, spr_dormitory_2, spr_dormitory_3, spr_dormitory_4];
global.roomBGMap[? "rm_boat"]			= [spr_boat_parallax];
global.roomBGMap[? "rm_sciences"]		= [spr_sciences_0, spr_sciences_1];
global.roomBGMap[? "rm_central"]		= [spr_central_0, spr_central_1];
global.roomBGMap[? "rm_lake"]			= [spr_lake];
global.roomBGMap[? "rm_gazebo"]			= [spr_gazebo];
	
#endregion DECIDE ROOM BG
