/// @description GUI
if(!global.pause){
	exit;
	
}

var gwidth	= global.view_widt;
var gheight	= global.view_height;
var ds_grid = menu_pages[page],	ds_height = ds_grid_height(ds_grid);
var y_buffer = 32 , x_buffer = 16;
var start_y = (gheight/2) - (((ds_height-1/2)*y_buffer)), start_x = gwidth/2;


//Draw Element on Left Side
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x-x_buffer;
var lty;
var x_offset;

var yy = 0;
repeat(ds_height){
	//starting valua's for each option
	lty = start_y + (yy*y_buffer);
	var c = c_gray;
	var x_offset =0;
	
	//changing color when option is selected
	if(yy == menu_option[page]){
		c = c_black;
		x_offset = -(x_buffer/2)
	}
	//Draw Option Text
	draw_text_color(ltx+x_offset, lty , ds_grid[# 0, yy], c,c,c,c, 1);
	yy++;
}

//Draw Dividing Line
draw_line(start_x,start_y,start_x, lty);


//Draw Elements on Right Side
draw_set_halign(fa_left);
var rtx = start_x+x_buffer;
var rty;

yy = 0;
repeat(ds_height){
	rty = start_y + (yy*y_buffer);
	switch(ds_grid[# 1, yy]){
		case menu_element_type.shift: 
			var current_val		= ds_grid[# 3, yy];
			var current_array	= ds_grid[# 4, yy];
			var left_shift = "<<"
			var right_shift = ">>"
			c =c_gray;
			
			if(current_val == 0)									{left_shift = ""}
			if(current_val == array_length(ds_grid[# 4 , yy])-1)	{right_shift = ""}
			
			
			if(inputting && yy= menu_option[page]){ c = c_dkgray;}
			draw_text_color(rtx, rty, left_shift+current_array[current_val]+right_shift, c,c,c,c, 1);
			
				
			
		break;
		
		case menu_element_type.slider:
			var len = 64;
			var current_val		= ds_grid[# 3, yy];
			var current_array	= ds_grid[# 4, yy];
			var circle_pos		= ((current_val - current_array[0]) / (current_array[1] - current_array[0]));
			c = c_dkgray;
			
		
			draw_line_width(rtx, rty, rtx+len, rty, 2);
			
			if(inputting && yy= menu_option[page]){ c = c_black;}
			draw_circle_color(rtx+  (circle_pos*len), rty, 4, c,c, false);
			draw_text_color(rtx + (len* 1.25), rty, string(floor(circle_pos*100))+"%", c,c,c,c, 1);
		
		break;
		
		case menu_element_type.toggle:
			var current_array			= ds_grid[# 4, yy];
			var current_val				= ds_grid[# 3, yy];
			var c1;
			var c2;
			var c = c_black
			
			if(inputting && yy= menu_option[page]){ c = c_dkgray;}
			
			
			if(current_val	==	0)		{c1 = c;		c2 = c_gray;	}
			else						{c1 = c_gray;	c2 = c;			}
			
			draw_text_color(rtx, rty, "FULLSCREEN", c1,c1,c1,c1, 1);
			draw_text_color(rtx + x_buffer*8, rty, "WINDOWED", c2,c2,c2,c2, 1);
			
			///FAILED: Run Program Complete
		break;
		
		case menu_element_type.input:
			var current_val = ds_grid[# 3, yy];
			var string_val;
			
			switch(current_val){
				case vk_up		: string_val = "UP KEY"		;	break;
				case vk_left	: string_val = "LEFT KEY"	; 	break;
				case vk_right	: string_val = "RIGHT KEY"	;	break;
				case vk_down	: string_val = "DOWN KEY"	;	break;
				default			: string_val = chr(current_val);		
			}
			
			c = c_black
			if(inputting && yy= menu_option[page]){ c = c_dkgray;}
			draw_text_color(rtx, rty, string_val, c,c,c,c, 1);
		
		break;
	}
	yy++;
}
draw_set_valign(fa_top);