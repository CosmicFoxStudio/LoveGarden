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

// Localization
function LoadLocalization() {
	// If "English" was selected, load new dialogue lines
	if (global.lang == "en") {
		ChatterboxLocalizationLoad("lang/" + global.lang + "_dialogues.csv"); 
		show_debug_message("English translation loaded!");
	}
}
