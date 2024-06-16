// Initialize global enumerators
// Enumerators make code more readable, better than only using numbers
function Enums() {
	enum e_gameMode {
		DEMO,
		RELEASE,
		TEASER
	}
	
	enum e_language {
		EN,	// ---> 0
		PT	// ---> 1
	}
	
	enum e_input {
		MOUSE,		// 0
		KEYBOARD,	// 1
		GAMEPAD		// 2
	}
	
	enum e_pronouns {
		ELU,	// ---> 0
		ELA,	// ---> 1
		ELE		// ---> 2
	}

	// GAME STATES
	enum e_gameStates {
		INTRO,			// Studio logo
		TITLE_SCREEN,
		FILE_SELECTION,
		NEW_GAME,		// First access
		CONTINUE_GAME,	// If not first access (continue game)
		PAUSED,
		MENU,
		LEAVE,			// Returns to title
		EVENT_END,		// When a mandatory event ends, call map
		MAP
		// RESUME		// Close menu and resume game
	}
	
	enum e_SO {
		IPE,	// 0
		CARU,	// 1
		ROSE,	// 2
		CARNA,	// 3
		HYDRA	// 4
	}

	enum e_btnTypes {
		PLAY,
		CONTINUEPLAY,
		HELP,
		QUIT,
		CONFIRM,
		CANCEL,
		BACK,
		MAP,
		LANG
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
		MAP
	}

	enum e_daytime {
		MORNING,
		NOON,
		AFTERNOON,
		NIGHT,
		DAWN // ---> Only for testing purposes
	}

	enum e_DebugOptions {
	    GAME,
	    LANG,
	    CHARA,
	    CUTSCENE,
		DIALOGUE,
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

	enum e_saveSlotStats {
		NAME,
		DATE,
		PLACE,
		DAYTIME,
		DAY,
		LAST
	}

	enum e_plantStage {
		BLOOM,	// 0
		BUD,	// 1
		WITHER,	// 2
		DEAD	// 3 ---> Only for testing purposes
	}

	// Used in obj_player_creator
	enum e_phases {
		PHASE_1,
		PHASE_2,
	}
	
	// Used to determine font size
	enum e_fontSize {
		SMALL,
		MEDIUM,
		LARGE,
		COUNT
	}
	
	enum e_fontType {
		PRIMARY,
		SECONDARY,
		COUNT
	}
}