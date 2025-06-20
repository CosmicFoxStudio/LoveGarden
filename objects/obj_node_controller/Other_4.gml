/// @description Gets node based on room

// UPDATE CURRENT EVENT
global.event = global.events[global.eventID];

roomName = global.event.location;

// Needs to be updated once the day changes
UpdateRoomYarnMap();

// Create chatterbox based on YARN
if (global.event.location != undefined) {
	if (global.event.type == "canon") {
		chatterbox = ChatterboxCreate(global.roomYarnMap[? roomName]);
	}
	else if (global.event.type == "bonus") {
		chatterbox = ChatterboxCreate(global.roomYarnMap[? "rm_map"]);
	}
	
	ChatterboxJump(chatterbox, nodeName);
	UpdateChatterbox();
}

// Instantiate textbox
if (global.roomType == e_roomTypes.SCENES) {
	instance_create_layer(65, 245, "Instances_Above", obj_textbox);
}

// [DEBUG] Node
show_debug_message("Testing ChatterboxGetCurrentMetadata()");
show_debug_message(ChatterboxGetCurrentMetadata(chatterbox));

// [DEBUG] YARN Files
if (global.debug) show_debug_message("All dialogue files: " + string(global.dialogueList));
for (var file = 0; file < array_length(global.dialogueList); file++) {
	show_debug_message("Is " + string(global.dialogueList[file]) + " loaded?: " + string(ChatterboxIsLoaded(global.dialogueList[file])));
}
