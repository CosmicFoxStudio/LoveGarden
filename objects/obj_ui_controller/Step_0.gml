/// @description 

if (global.state == e_gameStates.LEAVE) {
	
	instance_destroy(obj_ui_btn_calendar);
	instance_destroy(obj_ui_btn_config);
	instance_destroy(obj_ui_btn_events);					 
	instance_destroy(obj_ui_btn_map);
	instance_destroy(obj_ui_plant_stages);

}				 
 // Maybe put them all in an array and destroy it dynamically?
 