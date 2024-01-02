/// @description Room Management
#region camera setup for individual rooms
//Create camera
var _x = global.res.xx;
var _y = global.res.yy;
var _w = global.res.width;
var _h = global.res.height;
camera = camera_create_view(_x, _y, _w, _h, 0, obj_player, -1, -1, _w/2, _h/2);
global.camera_id = camera;

//Enable views and make view 0 visible
view_enabled = true;
view_visible[0] = true;

//Asign camera to view 0
view_set_camera(0, camera); // That is, global.camera_id and view_camera[0] is equivalent

#endregion camera setup for individual rooms