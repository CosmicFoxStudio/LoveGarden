global.roomType = e_roomTypes.SCENES;
GameChangeState(e_gameStates.CONTINUE_GAME);

// Rename global.location
global.rmCurrent = room_get_name(room);
show_debug_message("Room: " + global.rmCurrent);
DecideRoomName();

global.changeCalendarDaytime = true;

if (global.roomType != e_roomTypes.MAP && global.event.type != "bonus") { SaveGame() };