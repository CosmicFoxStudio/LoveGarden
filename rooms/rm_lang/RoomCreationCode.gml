global.roomType = e_roomTypes.SPECIAL;

// Randomize background to show
var lay_id = layer_get_id("Background");
var back_id = layer_background_get_id(lay_id);

randomize();
layer_background_index(back_id, irandom(7));