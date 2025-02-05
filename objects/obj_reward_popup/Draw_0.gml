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

// Animate and draw the flowers with the giggle effect
if (!is_animating || (scale_x > 0.5 && scale_y > 0.5)) { // Only draw once popup is sufficiently scaled
    var flower_scale_x = lerp(0, flower_scale, scale_x);
    var flower_scale_y = lerp(0, flower_scale, scale_y);
    
    // Calculate the giggle effect using sine wave
    var giggle_offset = sin(giggle_timer) * giggle_amplitude;

    // Draw each flower sprite with appropriate scaling and the giggle effect applied to y-position
    draw_sprite_ext(spr_action, 0, flower_x1, flower_y + giggle_offset, flower_scale_x, flower_scale_y, 0, c_white, 1);
    draw_sprite_ext(spr_action, 1, flower_x2, flower_y + giggle_offset, flower_scale_x, flower_scale_y, 0, c_white, 1);
    draw_sprite_ext(spr_action, 2, flower_x3, flower_y + giggle_offset, flower_scale_x, flower_scale_y, 0, c_white, 1);
}
			 
// Draw buttons (Continue, Explore) and highlight based on selection
if (selectedButton == "CONTINUE" || pos == 0) {
    draw_text_color(center_x - 60, center_y + 50, "CONTINUE", c_yellow, c_yellow, c_yellow, c_yellow, 1);
} else {
    draw_text(center_x - 60, center_y + 50, "CONTINUE");
}

if (selectedButton == "MAP" || pos == 1) {
    draw_text_color(center_x + 60, center_y + 50, "EXPLORE MAP", c_yellow, c_yellow, c_yellow, c_yellow, 1);
} else {
    draw_text(center_x + 60, center_y + 50, "EXPLORE MAP");
}

// Additional decorative elements

// Reset
DrawReset();
