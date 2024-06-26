/// Creates a collection of colour names that map to 24-bit BGR colours
/// Use scribble_rgb_to_bgr() to convert from industry standard RGB colour codes to GM's native BGR format
/// 
/// To add or change colours at runtime, use scribble_color_set()
/// 
/// N.B. That this function is executed on boot. You should never execute this function yourself!

function __scribble_config_colours()
{
    static _colours = {
        //Duplicate GM's native colour constants
        c_aqua:    c_aqua,
        c_black:   c_black,
        c_blue:    c_blue,
        c_dkgray:  c_dkgray,
        c_dkgrey:  c_dkgrey,
        c_fuchsia: c_fuchsia,
        c_gray:    c_gray,
        c_green:   c_green,
        c_gray:    c_gray,
        c_grey:    c_grey,
        c_lime:    c_lime,
        c_ltgray:  c_ltgray,
        c_ltgrey:  c_ltgrey,
        c_maroon:  c_maroon,
        c_navy:    c_navy,
        c_olive:   c_olive,
        c_orange:  c_orange,
        c_purple:  c_purple,
        c_red:     c_red,
        c_silver:  c_silver,
        c_teal:    c_teal,
        c_white:   c_white,
        c_yellow:  c_yellow,
    
        //Here are some example colours
        // c_coquelicot: scribble_rgb_to_bgr(0xff3800),
        // c_smaragdine: scribble_rgb_to_bgr(0x50c875),
        // c_xanadu:     scribble_rgb_to_bgr(0x738678),
        // c_amaranth:   scribble_rgb_to_bgr(0xe52b50),
		
		// Love Garden colors:
		c_text_green	: TEXT_GREEN,
		c_text_cyan		: CYAN,
		c_text_ipe		: TEXT_IPE,
		c_text_rose	    : TEXT_ROSE,
		c_text_carna	: TEXT_CARNA,
		c_text_hydra	: TEXT_HYDRA,
		c_text_caru		: TEXT_CARU,
		c_text_fern		: TEXT_FERN,
		c_text_orange	: TEXT_ORANGE,
		c_text_player	: TEXT_PLAYER,

    };
    
    return _colours;
}