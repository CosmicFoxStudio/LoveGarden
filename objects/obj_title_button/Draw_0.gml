/// @description Draw Buttons & Text

draw_self();

// Draw with font
draw_set_font(fnt_menu);

// Set alignment to middle center
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Draw the text
	var _c = c_white;
	if (!hovering) image_alpha = 1;
	if (obj_title_menu_controller.pos == btnType) {
		image_alpha = 0.9;
	}
	
	if (btnType == e_btnTypes.PLAY) {
		if (global.lang == "en") {
			draw_text_ext_color(x, y, btnText[e_btnTypes.PLAY][e_language.EN], 0, sprite_width, _c, _c, _c, _c, 1);
		}
		else if (global.lang == "pt") {
			draw_text_ext_color(x, y, btnText[e_btnTypes.PLAY][e_language.PT], 0, sprite_width, _c, _c, _c, _c, 1);
		}
	}

	if (btnType == e_btnTypes.QUIT) {
		if (global.lang == "en") {
			draw_text_ext_color(x, y, btnText[e_btnTypes.QUIT][e_language.EN], 0, sprite_width, _c, _c, _c, _c, 1);
		}
		else if (global.lang == "pt") {
			draw_text_ext_color(x, y, btnText[e_btnTypes.QUIT][e_language.PT], 0, sprite_width, _c, _c, _c, _c, 1);
		}
	}

// Reset
DrawReset();
