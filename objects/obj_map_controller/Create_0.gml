if (global.state == e_gameStates.CONTINUE_GAME) {
	instance_create_layer(360, 0, "Instances_Above", obj_ui_btn_calendar, {offsetX: 360});
	instance_create_layer(560, 0, "Instances_Above", obj_ui_btn_config);
}