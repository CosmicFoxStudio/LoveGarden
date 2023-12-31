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

#endregion LOCALIZATION
