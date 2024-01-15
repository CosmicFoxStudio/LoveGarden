draw_self();

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

DrawFont(fnt_actions);

if (global.lang == "pt")
	actionsString = "Ações: " + string(global.actions[global.day]) + "/" + string(global.maxActions[global.day]);
else
	actionsString = "Actions: " + string(global.actions[global.day]) + "/" + string(global.maxActions[global.day]);

draw_text_color(x + sprite_width/2, y + sprite_height/2, actionsString, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, 1);
DrawFont(fnt_dialogue);

DrawReset();