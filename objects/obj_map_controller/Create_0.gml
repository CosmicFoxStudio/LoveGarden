if (global.state == e_gameStates.CONTINUE_GAME) {
	instance_create_layer(360, ORIGIN_Y, "Instances_Above", obj_ui_btn_calendar, {offsetX: 360});
	instance_create_layer(560, ORIGIN_Y, "Instances_Above", obj_ui_btn_config);
	instance_create_layer(30, 10, "Instances_Above", obj_map_actions);
}
