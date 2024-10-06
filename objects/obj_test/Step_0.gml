/// @description Test Object
if (mouse_check_button_released(mb_left)) {
	instance_create_layer(x, y, "Instances_Above", obj_header);	
}


if (keyboard_check_pressed(ord("Z"))) {
	tween_ext(x, "x", x + 256, 120, tween_linear);
	tween_ext(image_alpha, "image_alpha", 0, 120, tween_linear);
}

if (keyboard_check_pressed(ord("R"))) {
	x = xstart;
	image_alpha = 1;
}
