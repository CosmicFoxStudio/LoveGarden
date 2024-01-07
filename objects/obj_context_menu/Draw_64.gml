/// @description Draw the menu

if(!global.config_menu) exit;

DrawFont(fnt_menu);

var gwidth = SCREEN_WIDTH;			
var gheight = SCREEN_HEIGHT;

var currentPage = menuPages[page];
var xBUFFER = 8; // Horizontal offset
var yBUFFER = 16; // Vertical offset
var pagesLength = array_length(menuPages);
/* 
The startX and startY variables are the starting x and y positions for drawing the text
The "-1" is there so that the first element isn't affected by the BUFFER
*/
var startX = gwidth/2; 
var startY = (gheight/2) - (((pagesLength - 1)/2) * yBUFFER);

// Draw black overlay
var c = c_black;
draw_set_alpha(0.8);
draw_rectangle_color(0, 0, gwidth, gheight, c, c, c, c, false);
draw_set_alpha(1);

// Draw Config Menu BG
draw_sprite(spr_ui_box_config, 0, 0, 0,);

// --------------------------- Draw Elements on the Left Side --------------------------- //
DrawAlign(fa_right, fa_middle);

var leftTextX = startX - xBUFFER;
var leftTextY;
var optionXOffset; // x offset for when the option is selected

// Draw the options' text
	for (var i = 0; i < array_length(currentPage); i++) {
		leftTextY = startY + (i*yBUFFER);
		c = c_white;
		optionXOffset = 0;

		// Selecting
		if (i == menuOption[page]) {
			c = c_yellow;
			// For the selected option to start a bit more to the left compared to the other options	
			optionXOffset = -(xBUFFER/2); 	
		}

		draw_text_transformed_color(
			leftTextX + optionXOffset, 
			leftTextY, 
			currentPage[i].text, 
			1, 1, 
			0, c, c, c, c, 1
		);
	}

// --------------------------- Draw divider in the middle --------------------------- //
// draw_line(startX, startY, startX, leftTextY);
// Adding the BUFFER to make the line align with the text in the top and bottom
draw_line(startX, startY - yBUFFER, startX, leftTextY + yBUFFER);

// --------------------------- Draw Elements on the Right Side --------------------------- //

DrawAlign(fa_left, fa_middle);

var rightTextX = startX + xBUFFER;
var rightTextY;

var yy = 0;
repeat(array_length(menuPages[page])) {
		rightTextY = startY + (yy*yBUFFER);
	
		switch(currentPage[yy].type) { 
			case e_menuElementType.SHIFT :
				var current_val		= currentPage[yy].param1;
				var current_array	= currentPage[yy].param2;
				var left_shift		= "<< ";
				var right_shift		= ">> ";
				c = c_white;
			
				if(current_val == 0) left_shift = ""; // Empty string
				if (current_val == array_length(currentPage[yy].param2) - 1) right_shift = "";
			
				// Changing selected text to yellow and then back to white
				if (inputting and yy == menuOption[page]) { c = c_yellow };
				draw_text_color(rightTextX, rightTextY, left_shift + current_array[current_val] + right_shift, c, c, c, c, 1);
			break;	
		
			case e_menuElementType.SLIDER :
				var len = 64;
				var current_val = currentPage[yy].param1;
				var current_array = currentPage[yy].param2;
				var circle_pos = ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
				c = c_white;
			
				// Drawing the slider line	
				draw_line_width(rightTextX, rightTextY, rightTextX + len, rightTextY, 2);
			
				// Changing selected circle and text to yellow and then back to white
				if (inputting and yy == menuOption[page]) { c = c_yellow };
				// Drawing slider circle
				draw_circle_color(rightTextX + (current_val * len), rightTextY, 4, c, c, false);
				// Draw slider text
				draw_text_color(rightTextX + (len * 1.2), rightTextY, string(floor(circle_pos*100)) + "%", c, c, c, c, 1);
			break;
			
			case e_menuElementType.TOGGLE :
				c = c_white;
				var current_val = currentPage[yy].param1;
				var c1, c2;
				// Changing selected circle and text to yellow and then back to white
				if (inputting and yy == menuOption[page]) { c = c_yellow };

				if(current_val == 0) { c1 = c; c2 = c_dkgray };
				else{ c1 = c_dkgray; c2 = c };
				// rightTextX + 32 ---> offset
				draw_text_color(rightTextX, rightTextY, "OFF ", c1, c1, c1, c1, 1);
				draw_text_color(rightTextX + 32, rightTextY, " ON", c2, c2, c2, c2, 1);
			break;
		
		/* case e_menuElementType.INPUT : break; */
		}
		
		yy++;
	}


DrawFont(fnt_dialogue);
DrawReset();
