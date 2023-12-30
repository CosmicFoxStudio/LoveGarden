/// @description Draw the character

if (chara != noone) {
	draw_sprite_ext(
		chara, 
		characterExpression, 
		room_width/2, room_height, 
		1, 1, 0, 
		c_white, 1
	);
}
