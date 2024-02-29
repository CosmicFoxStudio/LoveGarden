// When you return to the title screen, delete instances of Game UI
if (global.state == e_gameStates.LEAVE) {
	
	instance_destroy(obj_ui_btn_calendar);
	instance_destroy(obj_ui_btn_config);				 
	instance_destroy(obj_ui_btn_map);
	//instance_destroy(obj_ui_plant_stages);

}

// Check if you need to instantiate any Game UI in this scene
if (global.state == e_gameStates.CONTINUE_GAME && global.roomType == e_roomTypes.SCENES) {
	instance_create_layer(16, ORIGIN_Y, "Instances_Above", obj_ui_btn_calendar, {offsetX: 16});
	
	var instConfig = instance_create_layer(480, ORIGIN_Y, "Instances_Above", obj_ui_btn_config);
	array_push(buttonsList, instConfig);
	
	if (global.isMapOn && mapButtonOn == false) {
		var instMap = instance_create_layer(560, ORIGIN_Y, "Instances_Above", obj_ui_btn_map);
		array_push(buttonsList, instMap);
		mapButtonOn = true;
	}
	//instance_create_layer(170, 150, "Instances_Above", obj_ui_plant_stages);
}