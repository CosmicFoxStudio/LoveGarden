/// @description

if (global.state == e_gameStates.CONTINUE_GAME && global.roomType == e_roomTypes.SCENES) {
	instance_create_layer(16, 0, "Instances_Above", obj_ui_btn_calendar, {offsetX: 16});
	//instance_create_layer(85, 60, "Instances_Above", obj_ui_btn_actions);
	instance_create_layer(480, 0, "Instances_Above", obj_ui_btn_config);
	//instance_create_layer(480, 0, "Instances_Above", obj_ui_btn_events);
	if (global.isMapOn && mapButtonOn == false) {
		instance_create_layer(560, 0, "Instances_Above", obj_ui_btn_map);
		mapButtonOn = true;
	}
	//instance_create_layer(170, 150, "Instances_Above", obj_ui_plant_stages);
}