/// @description Match plant to daytime

if (global.currentDaytime == e_daytime.MORNING) { 
	sprite_index = e_plantStage.BUD;
}
else if (global.currentDaytime == e_daytime.NOON) {
	sprite_index = e_plantStage.BLOOM;
}
else if (global.currentDaytime == e_daytime.AFTERNOON) {
	sprite_index = e_plantStage.BUD;
}
else if (global.currentDaytime == e_daytime.NIGHT) {
	sprite_index = e_plantStage.WITHER;
}
else if (global.currentDaytime == e_daytime.DAWN) {
	sprite_index = e_plantStage.DEAD;
}
