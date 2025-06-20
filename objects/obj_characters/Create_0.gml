/// @description Initialization
// This is where the processing for the characters drawing happen
// But data structure setup, including the list of expressions, happen at GAME_DATA.gml and CharaDefinition()
chara = [noone, noone, noone];
charaExpression = [spr_noone, spr_noone, spr_noone];
charactersOnScreen = 0;
currentSpeaker = "";

// Maybe this object could be fused with obj_node_controller