/// @description Menu

draw_self();

// Draw "M" tooltip
draw_set_halign(fa_center);
DrawFont(fnt_menu);
draw_sprite(spr_help_menu, subimage, x + sprite_width/4 + 2, y + sprite_height/4 + 2);
DrawFont(fnt_dialogue);

DrawReset();
