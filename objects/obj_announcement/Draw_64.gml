/*
	// How to use (can be called from anywhere):
	if instance_exists(obj_announcement) instance_destroy(obj_announcement);

	announcement = instance_create_layer(0, 0, "Special", obj_announcement);
	announcement.text = "Your text...";
	
	Update: Just use MakeAnnouncement()
*/

DrawAlign(fa_center, fa_bottom);

draw_set_font(fnt_dialogue);

x1 = xx - (string_width(text) / 2);
y1 = yy - (font_get_size(fnt_dialogue) * 1.5);
x2 = xx + (string_width(text) / 2);
y2 = yy + (font_get_size(fnt_dialogue)); 

draw_set_color(c_black);

draw_rectangle(x1, y1, x2, y2, false);

draw_set_color(c_white);

draw_text(xx, yy, text);

// Reset
DrawReset();
