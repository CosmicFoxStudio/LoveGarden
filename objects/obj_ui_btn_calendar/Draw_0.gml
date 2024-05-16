/// @description Calendar

draw_self();

// Day number
draw_set_halign(fa_center);
DrawFont(fnt_day_number);
draw_text_color(20, 9, global.day, CYAN, CYAN, CYAN, CYAN, 1);

// Current daytime
if (global.changeCalendarDaytime) {
	daytimeToShow = global.currentDaytime;
	global.changeCalendarDaytime = false;
}

switch (global.lang) {
	case "pt":
		switch (daytimeToShow) {
			case e_daytime.MORNING: calendarDaytime = "Manhã"; break;
			case e_daytime.NOON: calendarDaytime = "Meio-dia"; break;
			case e_daytime.AFTERNOON: calendarDaytime = "Tarde"; break;
			case e_daytime.NIGHT: calendarDaytime = "Noite"; break;
			default: calendarDaytime = "Alvorada"; break;
		}
		break;
	default:
		switch (daytimeToShow) {
			case e_daytime.MORNING: calendarDaytime = "Morning"; break;
			case e_daytime.NOON: calendarDaytime = "Noon"; break;
			case e_daytime.AFTERNOON: calendarDaytime = "Afternoon"; break;
			case e_daytime.NIGHT: calendarDaytime = "Night"; break;
			default: calendarDaytime = "Dawn"; break;
		}
		break;
}

draw_set_halign(fa_center);
DrawFont(fnt_menu);
draw_text_color(68, 22, calendarDaytime, CYAN, CYAN, CYAN, CYAN, 1);
DrawFont(fnt_dialogue);

DrawReset();