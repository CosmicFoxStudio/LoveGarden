// Get stuff -> Camera
var camX = camera_get_view_x(view_camera[0]);
var camY = camera_get_view_y(view_camera[0]);

var displayWidth = camera_get_view_width(view_camera[0]);
var displayHeight = camera_get_view_height(view_camera[0]);

// Calculate needed position
var posCenterX = camX + round(displayWidth/2);
var posCenterY = camY + round(displayHeight * 0.5); // 0.5 -> spawns at the middle of the screen

// Language
var frameLang = (global.lang == "pt") ? 1 : 0;

if (!global.midTransition) {
	// Draw Stripe
	draw_sprite_ext(
		spr_header_stripe, 0, 
		posCenterX, posCenterY, 
		stripeXScale, stripeYScale, 
		0, c_white, 1 + alphaAll
	);

	// Draw Headline text
	draw_sprite_ext(
		spr_header_text, frameLang, 
		posCenterX + textMoveInX, 
		posCenterY - 40, 
		1, 1, 0, c_white, textHeadlineAlpha + alphaAll
	);

	// Draw Below text
	var str = (global.lang == "pt") ? "Manhã" : "Morning";
	var c = c_black;
	draw_text_color(posCenterX, posCenterY + 20, str, c, c, c, c, textBelowAlpha + alphaAll);
}