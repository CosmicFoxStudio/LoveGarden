// Set global.lang based on the OS language
function SetLanguage() {
	var osLang = os_get_language();

	switch (osLang) {
	    case "pt":
	        global.lang = "pt";
	        break;

	    default:
	        global.lang = "en";
	        break;
	}

	show_debug_message("OS Language: " + osLang);
	show_debug_message("Game Language: " + global.lang);
}

#region LOCALIZATION

function LoadLocalization() {
	// If "English" was not selected, load new dialogue lines
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
function PlaceLocalization(_savePlace) {
	switch (global.lang) {
	case "en":
		return _savePlace;
		break;
	case "pt":
		switch (_savePlace) {
			case "Dormitory": return "Dormitório"; break;
			case "Boat": return "Barco"; break;
			case "Science Dept.": return "Dept. Ciências"; break;
			case "Central Building": return "Pátio Central"; break;
			case "Lake": return "Lago"; break;
			case "Gazebo": return "Gazebo"; break;
			case "Test Zone": return "Zona de Teste"; break;
			default: return "Nenhum Lugar"; break;
		}
		break;
	default:
		return _savePlace;
	}
}


// Menu elements localization
function MenuLocalization(_menuWord) {
	switch (global.lang) {
	case "en":
		return _menuWord;
		break;
	case "pt":
		switch (_menuWord) {
			case "RESUME": return "CONTINUAR"; break;
			case "SETTINGS": return "CONFIGURAÇÕES"; break;
			case "EXIT": return "SAIR"; break;
			case "AUDIO": return "ÁUDIO"; break;
			case "GRAPHICS": return "GRÁFICOS"; break;
			case "BACK": return "VOLTAR"; break;
			case "MASTER": return "GERAL"; break;
			case "SOUNDS": return "EFEITOS"; break;
			case "MUSIC": return "MÚSICA"; break;
			case "RESOLUTION": return "RESOLUÇÃO"; break;
			case "FULLSCREEN": return "TELA CHEIA"; break;
			default: return ""; break;
		}
		break;
	default:
		return _menuWord;
	}
}

// Switch date order on save based on language
function DateLocalization(_saveDate) {
	switch (global.lang) {
	case "en":
		var splitDate = string_split(_saveDate, "/");
		var saveNewDate = splitDate[1] + "/" + splitDate[0] + "/" + splitDate[2];
		return saveNewDate;
		break;
	default:
		return _saveDate;
	}
}

// Player creator elements localization
function PlayerCreatorLocalization(_playerCreatorWord) {
	switch (global.lang) {
	case "en":
		return _playerCreatorWord;
		break;
	case "pt":
		switch (_playerCreatorWord) {
			case "Which one do you prefer?": return "Qual você prefere?"; break;
			case "What is your favorite plant?": return "Qual é a sua planta favorita?"; break;
			case "They": return "Elu"; break;
			case "She": return "Ela"; break;
			case "He": return "Ele"; break;
			case "Delete": return "Deletar"; break;
			case "Delete All": return "Deletar Tudo"; break;
			case "Confirm": return "Confirmar"; break;
			default: return _playerCreatorWord; break;
		}
		break;
	default:
		return _playerCreatorWord;
	}
}

#endregion LOCALIZATION
