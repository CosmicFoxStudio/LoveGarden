/// @description Initialization
/*	------------------- PHASE 1 ------------------- 
				Choose the pronouns

	------------------- PHASE 2 ------------------- 
				Favorite plant (name)
				  
	----------------------------------------------- 
*/

// Drawing variables
startX = room_width / 4;
startY =  120;
rectWidth = sprite_get_width(spr_rect);
// Phase1
phaseOptions[e_phases.PHASE_1, 0] = "They";
phaseOptions[e_phases.PHASE_1, 1] = "She";
phaseOptions[e_phases.PHASE_1, 2] = "He";
// Phase2
phaseOptions[e_phases.PHASE_2, 0] = "Delete";
phaseOptions[e_phases.PHASE_2, 1] = "Delete All";
phaseOptions[e_phases.PHASE_2, 2] = "Confirm";
phase = e_phases.PHASE_1;
optionLength = array_length(phaseOptions[phase]);

// Represents current option position
pos = 0;

// String stuff
maxLetters = 10;
maxLettersReached = false;
switch (global.lang) {
	case "pt": currentString = "TULIPA"; break;
	default: currentString = "TULIP"; break;
}
letterCount = string_length(currentString);

// VFX
scale = 1;
blink = 0;
flash = false;

// ---------------------------- MOUSE STUFF ----------------------------- //
mouseHovering = false;
lastHoveredOption = -1;
//mouseClicked = false;
// Create rectangle hitboxes
rectBtnInstArray[e_phases.PHASE_1] = [];
rectBtnInstArray[e_phases.PHASE_2] = [];
#macro PLAYER_CREATOR_MARGIN_V  70
#macro PLAYER_CREATOR_BTN_MARGIN_H 32
// Loop through all created instances and put them into an array depending on the phase
// Phase1 Options

for ( var i = 0; i < array_length(phaseOptions[e_phases.PHASE_1]); i++ ) {
	var inst = instance_create_layer(startX + i * (rectWidth + PLAYER_CREATOR_BTN_MARGIN_H), startY + PLAYER_CREATOR_MARGIN_V, "Instances_Mid", obj_rect);
	inst.image_blend = c_aqua;
	inst.image_alpha = 0; // 0.3 for debug
	array_push(rectBtnInstArray[e_phases.PHASE_1], inst);
}

// Phase2 Options
for ( var j = 0; j < array_length(phaseOptions[e_phases.PHASE_2]); j++ ) {
	var inst = instance_create_layer(startX + j * (rectWidth + PLAYER_CREATOR_BTN_MARGIN_H), startY + PLAYER_CREATOR_MARGIN_V, "Instances_Mid", obj_rect);
	inst.image_alpha = 0;
	array_push(rectBtnInstArray[e_phases.PHASE_2], inst);
}
