/// @description UX

// TITLE
draw_sprite_ext(spr_saveslot2, 1, 0, 0, 2, 1, 0, c_white, 1);
DrawFont(fnt_menu);
DrawAlign(fa_center);
var text;
if (global.lang == "pt") {
    text = global.newGame ? "NOVO JOGO" : "CONTINUAR JOGO";
} else {
    text = global.newGame ? "NEW GAME" : "CONTINUE GAME";
}
DrawTextOutline(
	SCREEN_WIDTH / 2, 5,
	text, CYAN, c_black, 2, 0.1
);
DrawFont(fnt_dialogue);
DrawReset();

// TIP
var text;
switch (global.lang) {
	case "pt": text = "Clique com o botão direito ou backspace para excluir o save selecionado"; break;
	default: text = "Right click or backspace to delete selected save"; break;
}

if (global.newGame) {
	DrawAlign(fa_right);
	DrawTextOutline(
		SCREEN_WIDTH - 10, SCREEN_HEIGHT - 20,
		text, CYAN, c_black, 1, 0.3
	);
}

DrawReset();
