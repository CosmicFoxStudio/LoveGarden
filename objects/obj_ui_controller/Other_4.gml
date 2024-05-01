// When you return to the title screen, delete instances of Game UI
if (global.state == e_gameStates.LEAVE) {
	instance_destroy(obj_ui_btn_calendar);
	canDrawNow = false;
}

// Check if you need to instantiate any Game UI in this scene
if (global.state == e_gameStates.CONTINUE_GAME && global.roomType == e_roomTypes.SCENES) {
	instance_create_layer(ORIGIN_X, ORIGIN_Y, "Instances_Above", obj_ui_btn_calendar, {offsetX: 0});
	canDrawNow = true;
}