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
	instance_create_layer(65, 245, "Instances_Above", obj_textbox);
}