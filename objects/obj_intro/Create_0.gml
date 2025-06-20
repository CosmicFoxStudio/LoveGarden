/// @description Initialization
ended = false;
textSpd = 0.25;
page = 0;

// Map languages to numeric indices
langIndex = (global.lang == "en") ? 0 : 1;

// Map game modes to numeric indices
// Demo and MVP (0). Release (1)
modeIndex = (global.gameMode == e_gameMode.DEMO || global.gameMode == e_gameMode.MVP) ? 0 : 1;


// Initialize the texts array
texts = array_create(2); // 2 languages
texts[0] = array_create(2); // English has 2 game modes
texts[1] = array_create(2); // Portuguese has 2 game modes

// English texts
texts[0][0] = [
    "Looks like it's the first time.",
    "It's the season for fresh starts.[delay,200]\nNew reflections await.",
    "Soon, you'll wake up into a new universe, a setting completely different from the usual.",
    "So, enjoy the journey, but with a sprinkle of wisdom.",
    "Now, onto the good stuff."
];

texts[0][1] = [
    "Looks like it's the first time.",
    "This is fantastic because everything is a novelty.",
    "Being able to appreciate the view of the fields, the aqueducts and the river lines.",
    "At this time, the summer breeze is downright comforting.",
    "It's the season for fresh starts.[delay,200]\nNew reflections await.",
    "But it's also time to chill out.",
    "Soon, you'll wake up into a new universe, a setting completely different from the usual.",
    "Things could be either delightful or ruthless.",
    "The decision between blooming or withering is in your hands.",
    "So, enjoy the journey, but with a sprinkle of wisdom.",
    "Now, onto the good stuff."
];

// Portuguese texts
texts[1][0] = [
    "Parece que é a primeira vez.",
    "É temporada de novos recomeços.[delay,200]\nDe novas reflexões.",
    "Em breve, você vai acordar em um novo universo, um cenário bem diferente do habitual.",
    "Portanto, desfrute da jornada. Mas com sabedoria.",
    "Agora, ao que interessa."
];

texts[1][1] = [
    "Parece que é a primeira vez.",
    "Isso é fantástico, pois tudo é uma revelação.",
    "Você pode apreciar a vista dos campos, dos aquedutos e das curvas dos rios.",
    "Nessa época, a brisa de verão é reconfortante.",
    "É temporada de novos recomeços.[delay,200]\nDe novas reflexões.",
    "Mas também é tempo de descontrair.",
    "Em breve, você vai acordar em um novo universo, um cenário bem diferente do habitual.",
    "As coisas poderão ser prazerosas ou impiedosas.",
    "A decisão entre o florescer e o murchar está em suas mãos.",
    "Portanto, desfrute da jornada. Mas com sabedoria.",
    "Agora, ao que interessa."
];

textLength = scribble(texts[langIndex][modeIndex][page]).get_glyph_count();

// ----------------------------- SCRIBBLE ----------------------------- //
// Setup font
scribble_font_set_default(font_get_name(fnt_menu));

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
