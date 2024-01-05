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
	LAST
}
