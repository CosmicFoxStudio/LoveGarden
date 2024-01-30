/// @description Reset stuff when new room
global.rmCurrent = room_get_name(room);
show_debug_message("Room: " + global.rmCurrent);
DecideRoomName(); // Rename global.location

#region camera setup for each room
// Create camera
var _x = ORIGIN_X;
var _y = ORIGIN_Y;
var _w = global.res.width;
var _h = global.res.height;
camera = camera_create_view(_x, _y, _w, _h, 0, noone, -1, -1, _w/2, _h/2);
global.cameraID = camera;

// Enable views and make view 0 visible
view_enabled = true;
view_visible[0] = true;

// Asign camera to view 0
view_set_camera(0, camera); // That is, global.cameraID and view_camera[0] is equivalent
#endregion camera setup for each room

// Reset stats & flags
if (room = rm_title) {
	global.playerStats.wilting = 0;
	global.playerStats.growth = 0;
	global.playerStats.blossom = 0;
}

// Set location
if global.roomType == e_roomTypes.SCENES {
	global.location = global.rmCurrent;	
}

// YARN Dialogue Files
if (global.debug) show_debug_message("All dialogue files: " + string(global.dialogueList));

for (var file = 0; file < array_length(global.dialogueList); file++) {
	show_debug_message("Is " + string(global.dialogueList[file]) + " loaded?: " + string(ChatterboxIsLoaded(global.dialogueList[file])));
}
