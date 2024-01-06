// Initialize global enumerators
// Enumerators make code more readable, better than only using numbers
function Enums() {
	enum e_language {
		EN,	// ---> 0
		PT	// ---> 1
	}

	enum e_btnTypes {
		PLAY,
		QUIT,
		HELP,
		CONFIRM,
		CANCEL
	}
}

// Used in obj_intro
enum e_fadeoutState {
	IDLE,
	FADING_OUT,
	FINISHED
}

enum e_roomTypes {
	SPECIAL,
	SCENES,
	WORLD_MAP
}

enum e_daytime {
	MORNING,
	AFTERNOON,
	EVENING
}

enum e_DebugOptions {
    GAME,
    LANG,
    CHARA,
    CUTSCENE,
	// DIALOGUE
	// PLAYER
	// MENU
	// AUDIO
	// FLAG
	// ROOM
	// INPUT
	LAST
}

enum e_MenuPage {
	MAIN, 		
	SETTINGS, 		
	AUDIO, 		
	GRAPHICS,		
	//CONTROLS,		
	LAST
}

enum e_menuElementType {
	SCRIPT_RUNNER,
	PAGE_CHANGE,	
	SLIDER,		
	SHIFT,	
	TOGGLE,
	// INPUT
}