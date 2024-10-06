/// @description Draw the menu

DrawFont(fnt_menu);
DrawAlign(fa_center, fa_middle);
draw_set_color(c_white);

// Define the popup's current width and height based on scaling
var current_width = target_width * scale_x;
var current_height = target_height * scale_y;

// Draw the box sprite or rectangle
if (popup_sprite != noone) {
    draw_sprite_stretched(	sprite_index, 0, 
							center_x - current_width / 2, 
							center_y - current_height / 2, 
							current_width, current_height);
} else {
    draw_rectangle_color(center_x - current_width / 2, center_y - current_height / 2, 
                         center_x + current_width / 2, center_y + current_height / 2, 
                         c_white, c_white, c_white, c_white, false);
}

// Draw the decorative sprites on top of the box
if (popup_sprite != noone) {
	// Hearts sprite
    draw_sprite(spr_hearts_red, 0, center_x, center_y - current_height / 2);
	// Flowers sprite
	
}

// Draw the text in the center of the popup
var text_margin_y = 20; // Adjust to position text vertically inside the popup
draw_text(center_x, center_y - text_margin_y, "You have FREE TIME!");

// Draw the decorative sprites (flowers) below the text
var sprite_margin_y = 40; 
var flower_spacing = 60;
var flower_scale = 0.8;

// Calculate the positions of the three flowers
var flower_y = center_y - text_margin_y + sprite_margin_y;
var flower_x1 = center_x - flower_spacing;
var flower_x2 = center_x;
var flower_x3 = center_x + flower_spacing;

// Animate and draw the flowers with the same scaling effect as the popup
if (!is_animating || (scale_x > 0.5 && scale_y > 0.5)) { // Only draw once popup is sufficiently scaled
    var flower_scale_x = lerp(0, flower_scale, scale_x);
    var flower_scale_y = lerp(0, flower_scale, scale_y);

    // Draw the flowers
    draw_sprite_ext(spr_action, 0, flower_x1, flower_y, flower_scale_x, flower_scale_y, 0, c_white, 1);
    draw_sprite_ext(spr_action, 1, flower_x2, flower_y, flower_scale_x, flower_scale_y, 0, c_white, 1);
    draw_sprite_ext(spr_action, 2, flower_x3, flower_y, flower_scale_x, flower_scale_y, 0, c_white, 1);
}

/*					 
// Calculate menu height dynamically based on number of options
var padding = optionPaddingV * 2;
var verticalSpace = (optionLength - 1) * optionMargin;
var newHeight = padding + verticalSpace;
height = newHeight;

// Center the menu
x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - width/2;
y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - height/2;

obj_lang_selection.canInitialize = true;

// Draw the menu box
var scaleX = width*(1/sprite_width); // --> 1
var scaleY = height*(1/sprite_height); // --> 1
draw_sprite_ext(sprite_index, image_index, x, y, scaleX, scaleY, 0, c_white, 1);

#region DESCRIPTION
var offset = 100;
var descriptionX = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2;
var descriptionY = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0])/2 - offset;
if (global.lang == "en") {
    var descriptionText = titleText[e_language.EN];
}
else if (global.lang == "pt") {
    var descriptionText = titleText[e_language.PT];
}

// Get the dimensions of the text
var textWidth = string_width(descriptionText);
var textHeight = string_height(descriptionText);
var textWidthPT = string_width(titleText[e_language.PT]);
var textHeightPT = string_height(titleText[e_language.PT]);

// Set the box dimensions based on text dimensions
var boxWidth = textWidth + 2 * descriptionPaddingH;
var boxHeight = textHeight + 2 * descriptionPaddingV;

// Draw the description box
draw_sprite_ext(
		sprite_index, image_index, 
		descriptionX - boxWidth/2, 
		descriptionY - boxHeight/2,
		3.375*(textWidth/textWidthPT),
		1*(textHeight/textHeightPT),
		0, c_white, 1
	);

// Draw the description text inside the box
draw_text_color(descriptionX, descriptionY, descriptionText, CYAN, CYAN, CYAN, CYAN, 1);
#endregion DESCRIPTION

DrawFont(fnt_dialogue);

// Draw language options
for (var i = 0; i < optionLength; i++) {
	var c = CYAN;
	
	// Option was selected
	if (pos == i && phase == "CONFIRM") {
		// Color changes in current iteration
		c = c_yellow;
		
	}
	
	if (global.lang == "en") {
		draw_text_color(
			x + optionPaddingH, y + optionPaddingV + optionMargin*i, 
			option[e_language.EN][i], c, c, c, c, 1
		);
	}
	else if (global.lang == "pt") {
		draw_text_color(
			x + optionPaddingH, y + optionPaddingV + optionMargin*i, 
			option[e_language.PT][i], c, c, c, c, 1
		);
	}
}

#region Buttons (Confirm Phase)

if (phase == "CONFIRM") { 
	if (posButtons == 0) {
		// Cancel button is the selected button
		cancelButton.selected = true;
		confirmButton.selected = false;
	} 
	else if (posButtons == 1) {
		// Confirm button is the selected button
		cancelButton.selected = false;
		confirmButton.selected = true;
	}
}
else {
	// Both unavailable
	cancelButton.unavailable = true; 	
	confirmButton.unavailable = true; 
}

#endregion Buttons (Confirm Phase)
*/

// Reset
DrawReset();
