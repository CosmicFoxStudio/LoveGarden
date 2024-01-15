/// @description Calendar

draw_self();

// Day number
draw_set_halign(fa_center);
DrawFont(fnt_day_number);
draw_text_color(47, 26, global.day, TEXT_BROWN, TEXT_BROWN, TEXT_BROWN, TEXT_BROWN, 1);

// Current daytime

switch (global.lang) {
	case "pt":
		switch (global.currentDaytime) {
			case e_daytime.MORNING: calendarDaytime = "Manhã"; break;
			case e_daytime.NOON: calendarDaytime = "Meio-dia"; break;
			case e_daytime.AFTERNOON: calendarDaytime = "Tarde"; break;
			case e_daytime.NIGHT: calendarDaytime = "Noite"; break;
			default: calendarDaytime = "Alvorada"; break;
		}
		break;
	default:
		switch (global.currentDaytime) {
			case e_daytime.MORNING: calendarDaytime = "Morning"; break;
			case e_daytime.NOON: calendarDaytime = "Noon"; break;
			case e_daytime.AFTERNOON: calendarDaytime = "Afternoon"; break;
			case e_daytime.NIGHT: calendarDaytime = "Night"; break;
			default: calendarDaytime = "Dawn"; break;
		}
		break;
}

DrawReset();

draw_set_halign(fa_center);
DrawFont(fnt_menu);
draw_text_color(120, 29, calendarDaytime, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, TEXT_GREEN, 1);