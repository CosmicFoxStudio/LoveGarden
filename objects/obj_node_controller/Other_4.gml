/// @description Gets node based on room

roomName = room_get_name(room);

// Create chatterbox
if (global.roomYarnMap[? roomName] != undefined) {
    chatterbox = ChatterboxCreate(global.roomYarnMap[? roomName]);
    ChatterboxJump(chatterbox, nodeName);
    UpdateChatterbox();
}
