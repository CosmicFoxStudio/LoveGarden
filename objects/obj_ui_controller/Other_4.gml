/// @description 

if (global.state == e_gameStates.CONTINUE_GAME) {
	instance_create_layer(16, 0, "Instances_Above", obj_ui_btn_calendar);
	instance_create_layer(400, 0, "Instances_Above", obj_ui_btn_config);
	instance_create_layer(480, 0, "Instances_Above", obj_ui_btn_events);
	instance_create_layer(560, 0, "Instances_Above", obj_ui_btn_map);
	instance_create_layer(170, 150, "Instances_Above", obj_ui_plant_stages);
}
