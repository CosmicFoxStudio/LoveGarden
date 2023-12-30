/// @description Draw the menu

draw_set_font(fnt_menu);
DrawAlign(fa_center, fa_middle);

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

// Set the box dimensions based on text dimensions
var boxWidth = textWidth + 2 * descriptionPaddingH;
var boxHeight = textHeight + 2 * descriptionPaddingV;

// Draw the description box
draw_sprite_ext(
		sprite_index, image_index, 
		descriptionX - boxWidth/2, 
		descriptionY - boxHeight/2,
		4, 1, 0, c_white, 1
	);

// Draw the description text inside the box
draw_text(descriptionX, descriptionY, descriptionText);

#endregion DESCRIPTION

draw_set_font(fnt_dialogue);

// Draw language options
for (var i = 0; i < optionLength; i++) {

	var c = c_white;
	
	// Option was selected
	if (pos == i && phase == "CONFIRM") {
		// Color changes in current iteration
		c = c_yellow;
		
		/* 
		OBS: 
			The selection box is being drawn inside obj_lang_selection.
														^-- (middle-click)
		*/
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

// Reset
DrawReset();
