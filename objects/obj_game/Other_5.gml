/// @description Clean up camera to recreate it on new room
if (camera != -1) {
	camera_destroy(camera);
}

if (room == rm_map) {
	global.map = false;	
}
