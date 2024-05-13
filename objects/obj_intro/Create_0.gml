/// @description Initialization
ended = false;
textSpd = 0.25;
page = 0;
switch (global.lang) {
	case "en":
	if (global.gameMode == e_gameMode.DEMO) {
		text[0]	= ". . .";
		text[1]	= "Looks like it's the first time.";
		text[2]	= "It's the season for fresh starts.[delay,200]\nNew reflections await.";
		text[3]	= "Soon, you'll wake up into a new universe, a setting completely different from the usual.";
		text[4] = "So, enjoy the journey, but with a sprinkle of wisdom.";
		text[5] = "Now, onto the good stuff.";
		text[6] = "";
		break;
	}
	else {
		text[0]	= ". . .";
		text[1]	= "Looks like it's the first time.";
		text[2]	= "This is fantastic because everything is a novelty.";
		text[3]	= "Being able to appreciate the view of the fields, the aqueducts and the river lines.";
		text[4]	= "At this time, the summer breeze is downright comforting."
		text[5]	= "It's the season for fresh starts.[delay,200]\nNew reflections await.";
		text[6]	= "But it's also time to chill out.";
		text[7]	= "Soon, you'll wake up into a new universe, a setting completely different from the usual.";
		text[8]	= "Things could be either delightful or ruthless.";
		text[9] = "The decision between blooming or withering is in your hands."
		text[10] = "So, enjoy the journey, but with a sprinkle of wisdom.";
		text[11] = "Now, onto the good stuff.";
		text[12] = "";
		break;
	}
	case "pt":
	if (global.gameMode == e_gameMode.DEMO) {
		text[0]	= ". . .";
		text[1]	= "Parece que é a primeira vez.";
		text[2]	= "É temporada de novos recomeços.[delay,200]\nDe novas reflexões.";
		text[3]	= "Em breve, você vai acordar em um novo universo, um cenário bem diferente do habitual.";
		text[4] = "Portanto, desfrute da jornada. Mas com sabedoria.";
		text[5] = "Agora, ao que interessa.";
		text[6] = "";
		break;
	}
	else {
		text[0]	= ". . .";
		text[1]	= "Parece que é a primeira vez.";
		text[2]	= "Isso é fantástico, pois tudo é uma revelação.";
		text[3]	= "Você pode apreciar a vista dos campos, dos aquedutos e das curvas dos rios.";
		text[4]	= "Nessa época, a brisa de verão é reconfortante."
		text[5]	= "É temporada de novos recomeços.[delay,200]\nDe novas reflexões.";
		text[6]	= "Mas também é tempo de descontrair.";
		text[7]	= "Em breve, você vai acordar em um novo universo, um cenário bem diferente do habitual.";
		text[8]	= "As coisas poderão ser prazerosas ou impiedosas.";
		text[9] = "A decisão entre o florescer e o murchar está em suas mãos.";
		text[10] = "Portanto, desfrute da jornada. Mas com sabedoria.";
		text[11] = "Agora, ao que interessa.";
		text[12] = "";
		break;
	}
	default:
		text[0]	= "NO LANGUAGE SELECTED.";
		text[1] = "";
		break;
}

textLength = scribble(text[page]).get_glyph_count();

// ----------------------------- SCRIBBLE ----------------------------- //
// Setup font
scribble_font_set_default(font_get_name(fnt_menu));

// Changing font's kerning
//scribble_glyph_set(font_get_name(global.font_main), all, SCRIBBLE_GLYPH.SEPARATION, 10, false);

// Typist
typist = scribble_typist();
typist.in(textSpd, 0.8);
skipCounter = 0;

// Delays in punctuation
typist.character_delay_add(".", 50);
typist.character_delay_add("!", 800);
typist.character_delay_add("?", 800);
typist.character_delay_add(",", 400);

twFadeOutState = e_fadeoutState.IDLE;
