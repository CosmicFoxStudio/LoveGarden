/// Select global dialog font and size for scribble

/// Returns: Nothing
/// @param _font {enum}		The enumeration for font type
/// @param _size {enum}		The enumeration for font size
function SelectScribbleDialogFont(_font = e_fontType.PRIMARY, _size = e_fontSize.MEDIUM) {
	switch(_font) {
		case e_fontType.PRIMARY:
			global.fontType = 0;
			break;
		case e_fontType.SECONDARY:
			global.fontType = 1;
			break;
		default:
			global.fontType = 0;
			break;
	}
	
	switch(_size) {
		case e_fontSize.SMALL:
			global.fontSize = 0;
			break;
		case e_fontSize.MEDIUM:
			global.fontSize = 1;
			break;
		case e_fontSize.LARGE:
			global.fontSize = 2;
			break;
		default:
			global.fontSize = 1;
			break;
	}
	var _selectedDialogFont = global.dialogFonts[global.fontType][global.fontSize];
	scribble_font_set_default(font_get_name(_selectedDialogFont));
	scribble_font_scale(font_get_name(_selectedDialogFont), 1);
	show_debug_message("Selected Font: " + font_get_name(_selectedDialogFont))
}

/// Select next font in enum list

/// Returns: Nothing
function NextFontType() {
	var _font = (global.fontType + 1) % e_fontType.COUNT;
	SelectScribbleDialogFont(_font, global.fontSize);
}

/// Select preview font in enum list

/// Returns: Nothing
function PrevFontType() {
	var _font = (global.fontType - 1);
	if(_font < 0) _font = e_fontType.COUNT - 1;
	SelectScribbleDialogFont(_font, global.fontSize);
}

/// Select next font size in enum list

/// Returns: Nothing
function NextFontSize() {
	var _size = (global.fontSize + 1) % e_fontSize.COUNT;
	SelectScribbleDialogFont(global.fontType, _size);
}

/// Select preview font size in enum list

/// Returns: Nothing
function PrevFontSize() {
	var _size = (global.fontSize - 1);
	if(_size < 0) _size = e_fontSize.COUNT - 1;
	SelectScribbleDialogFont(global.fontType, _size);
}

function SelectFontSize(_size) {
	switch(_size) {
		case e_fontSize.SMALL:
			global.fontSize = 0;
			break;
		case e_fontSize.MEDIUM:
			global.fontSize = 1;
			break;
		case e_fontSize.LARGE:
			global.fontSize = 2;
			break;
		default:
			global.fontSize = 1;
			break;
	}
	
	var _selectedDialogFont = global.dialogFonts[global.fontType][global.fontSize];
	scribble_font_set_default(font_get_name(_selectedDialogFont));
	scribble_font_scale(font_get_name(_selectedDialogFont), 1);
	show_debug_message("Selected Font: " + font_get_name(_selectedDialogFont))
}

function SelectFontType(_font) {
	switch(_font) {
		case e_fontType.PRIMARY:
			global.fontType = 0;
			break;
		case e_fontType.SECONDARY:
			global.fontType = 1;
			break;
		default:
			global.fontType = 0;
			break;
	}
	
	var _selectedDialogFont = global.dialogFonts[global.fontType][global.fontSize];
	scribble_font_set_default(font_get_name(_selectedDialogFont));
	scribble_font_scale(font_get_name(_selectedDialogFont), 1);
	show_debug_message("Selected Font: " + font_get_name(_selectedDialogFont))
}