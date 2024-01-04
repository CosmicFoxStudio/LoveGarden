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
