/// @description Initialization
ended = false;
textSpd = 0.25;
page = 0;
switch (global.lang) {
	case "en":
		text[0]	= ". . .";
		text[1]	= "There is something new here.";
		text[2]	= "You can see a wonderful view of the fields, the aqueducts\nand the river lines.";
		text[3]	= "There's a comforting summer breeze."
		text[4]	= "It's time for new beginnings.[delay,200]\nFor new reflections.";
		text[5]	= "But it's also time for relaxing.";
		text[6]	= "Hey, if you could live it all over again, but already knowing how everything goes,";
		text[7]	= ". . . and with the power to avoid everything bad.";
		text[8]	= ". . . Would you do it?";
		text[9]	= "Even if it means erasing all memories and rebuilding from scratch...[delay]?";
		text[10] = "Would you do it[delay] all over again?";
		text[11] = "";
		break;
	case "pt":
		text[0]	= ". . .";
		text[1]	= "Tem algo novo aqui.";
		text[2]	= "Você tem uma ótima visão dos campos, dos aquedutos\ne das curvas dos rios.";
		text[3]	= "A brisa de verão é reconfortante."
		text[4]	= "É tempo de novos recomeços.[delay,200]\nDe novas reflexões.";
		text[5]	= "Mas também é tempo de relaxar.";
		text[6]	= "Bem, se você pudesse viver tudo de novo, mas já sabendo como tudo deve acontecer,";
		text[7]	= ". . . e com o poder de evitar tudo de ruim.";
		text[8]	= ". . . Você faria?";
		text[9]	= "Mesmo que signifique apagar todas as memórias e refazer tudo do início...[delay]?";
		text[10] = "Você faria[delay] tudo de novo?";
		text[11] = "";
		break;
	default:
		text[0]	= "NO LANGUAGE SELECTED";
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
typist.character_delay_add(",", 800);

twFadeOutState = e_fadeoutState.IDLE;

// Adding events
scribble_typists_add_event("rumble", scribble_event_rumble);