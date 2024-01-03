global.roomType = e_roomTypes.SPECIAL;
// If game language is English, get rid of any translations
if (global.lang == "en") {
	UnloadLocalization();
}
else {
	// If game language is not English, load translation
	LoadLocalization();
}
