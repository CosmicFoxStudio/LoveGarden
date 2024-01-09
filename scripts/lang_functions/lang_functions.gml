// Set global.lang based on the OS language
function SetLanguage() {
	var osLang = os_get_language();

	switch (osLang) {
	    case "pt":
	        global.lang = "pt";
	        break;

	    case "en":
	    default:
	        global.lang = "en";
	        break;
	}

	show_debug_message("OS Language: " + osLang);
	show_debug_message("Game Language: " + global.lang);
}

#region LOCALIZATION
function LoadLocalization() {
	// If "English" was selected, load new dialogue lines
	if (global.lang != "en") {
		ChatterboxLocalizationLoad("lang/" + global.lang + "_dialogues.csv"); 
		show_debug_message("Portuguese translation loaded.");
	}
}

function UnloadLocalization() {
	ChatterboxLocalizationClear();
	show_debug_message("Current translation disposed.");
}

function ManageLocalization() {
    // If game language is English, get rid of any translations
    if (global.lang == "en") {
        UnloadLocalization();
    } else {
        // If game language is not English, load translation
        LoadLocalization();
    }
}

// Switch place name on save based on language
function PlaceLocalization(savePlace) {
	switch (global.lang) {
	case "en":
		return savePlace;
		break;
	case "pt":
		switch (savePlace) {
			case "Dormroom": return "Dormitório"; break;
			default: return "Nenhum Lugar"; break;
		}
		break;
	default:
		return savePlace;
	}
}

// Switch date order on save based on language
function DateLocalization(saveDate) {
	switch (global.lang) {
	case "en":
		var splitDate = string_split(saveDate, "/");
		saveNewDate = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
		return saveNewDate;
		break;
	default:
		return saveDate;
	}
}

#endregion LOCALIZATION
