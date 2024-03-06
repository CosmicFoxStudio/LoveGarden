/// @description Change button appearance
draw_self();

DrawFont(fnt_dialogue);
DrawAlign(fa_center, fa_middle);

var textColor = TEXT_GREEN; 

if (!unavailable) {
    // Check if the button is hovering or selected to change the text color accordingly
    if (hovering || selected) {
        textColor = c_yellow;
    } 
}

// Draw text with the calculated color
var languageIndex = (global.lang == "en") ? e_language.EN : e_language.PT;
var translatedText = btnText[btnType][languageIndex];
draw_text_ext_color(x, y-7, translatedText, 0, btnWidth, textColor, textColor, textColor, textColor, image_alpha);

// When the button is unavailable, its alpha is halved
if (unavailable) {
	image_index = 0; // Reset Image Index
	image_alpha = 0.5; 
}
else {
	image_alpha = 1;	
}

// Reset
DrawReset();

