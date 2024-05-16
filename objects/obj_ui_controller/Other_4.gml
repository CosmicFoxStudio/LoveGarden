// When you return to the title screen, delete instances of Game UI
if (global.state == e_gameStates.LEAVE) {
	instance_destroy(obj_ui_btn_calendar);
	canDrawNow = false;
}

// Check if you need to instantiate any Game UI in this scene
if (global.state == e_gameStates.CONTINUE_GAME && global.roomType == e_roomTypes.SCENES) {
	// Create Calendar
	instance_create_layer(ORIGIN_X, ORIGIN_Y, "Instances_Above", obj_ui_btn_calendar);
	
	// Create Menu Button
	instance_create_layer(room_width-sprite_get_width(spr_tooltip_box), ORIGIN_Y, "Instances_Above", obj_ui_btn_menu);
	
	// Test map button
	// instance_create_layer(ORIGIN_X + (sprite_get_width(spr_tooltip_box2)/2), ORIGIN_Y + 80, "Instances_Above", obj_ui_btn_map);
	canDrawNow = true;
}

