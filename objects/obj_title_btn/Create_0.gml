/// @description Initialization

// Variable Definitions
// btnType (real)

// Currently possible options: "PLAY", "CONTINUEPLAY", "HELP", "QUIT"
hovering = false;
keyboardSelection = false;
initialImageIndex = 0;
image_index = initialImageIndex;

// Add texture based on button type
sprites = [spr_menu_btn_newgame, spr_menu_btn_continue, spr_menu_btn_help, spr_menu_btn_quit];
sprite_index = sprites[btnType];
