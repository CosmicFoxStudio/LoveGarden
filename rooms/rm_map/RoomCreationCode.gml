global.roomType = e_roomTypes.SPECIAL;

// GameChangeState(e_gameStates.CONTINUE_GAME);
GameChangeState(e_gameStates.MAP);

// Rename global.location
global.rmCurrent = room_get_name(room);
show_debug_message("Room: " + global.rmCurrent);
DecideRoomName();

global.changeCalendarDaytime = true;