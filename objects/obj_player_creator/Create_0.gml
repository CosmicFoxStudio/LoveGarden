/// @description Initialization
/*	------------------- PHASE 1 ------------------- 
					Choose a name.

	------------------- PHASE 2 ------------------- 
				  Choose the pronouns.
				  
	------------------- PHASE 3 ------------------- 
	Choose a favorite place (might change later).
	
	------------------- --------------------------- 
*/

switch (global.lang) {
	case "pt":
		break;
	default:
		break;
}
	
currentInputField = "name";
phase1Options = ["Delete", "Confirm"];
phase2Options = ["They", "She", "He"];
startX = room_width / 2;
startY =  100;
maxLetters = 10;
maxLettersReached = false;
scale = 1;
blink = 0;
flash = false;
currentString = "";
currentPronouns = 0;
letterCount = string_length(currentString);
enum e_phases {
	PHASE_1,
	PHASE_2,
	PHASE_3
}
phase = e_phases.PHASE_1;
endPhase1 = false;
endPhase2 = false;
pos = 0;
optionLength = array_length(phase1Options);
