/// @description Change button appearance
draw_self();

DrawFont(fnt_dialogue);
DrawAlign(fa_center, fa_middle);

var textColor = CYAN; 

if (!unavailable) {
    // Check if the button is hovering or selected to change the text color accordingly
    if (hovering || selected) {
        textColor = c_yellow;
    } 
}

// Select the appropriate language index (EN or PT)
var languageIndex = (global.lang == "en") ? e_language.EN : e_language.PT;

// Determine the button's translated text based on btnType
var translatedText = "";
switch (btnType) {
    case e_btnTypes.CANCEL:
        translatedText = btnText[e_btnTypes.CANCEL][languageIndex];
        break;
    case e_btnTypes.CONFIRM:
        translatedText = btnText[e_btnTypes.CONFIRM][languageIndex];
        break;
    case e_btnTypes.CONTINUE:
        translatedText = btnText[e_btnTypes.CONTINUE][languageIndex];
        break;
    case e_btnTypes.MAP:
        translatedText = btnText[e_btnTypes.MAP][languageIndex];
        break;
    default:
        translatedText = ""; // Fallback in case btnType is not set properly
        break;
}

// Draw the translated text with the calculated color
draw_text_ext_color(x, y - 7, translatedText, 0, btnWidth, textColor, textColor, textColor, textColor, image_alpha);

// Change the alpha based on the button's availability
if (unavailable) {
    image_index = 0;
    image_alpha = 0.5; 
} else {
    image_alpha = 1;	
}

// Reset
DrawReset();
