/// @description Gets node based on room

roomName = room_get_name(room);

// Create chatterbox
if (global.roomYarnMap[? roomName] != undefined) {
    chatterbox = ChatterboxCreate(global.roomYarnMap[? roomName]);
    ChatterboxJump(chatterbox, nodeName);
    UpdateChatterbox();
}

// Instantiate textbox
if (global.roomType == e_roomTypes.SCENES) {
	var posX = SCREEN_WIDTH/8;
	instance_create_layer(posX, 260, "Instances_Above", obj_textbox);
}