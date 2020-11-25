/// @description Drawing the money

///Show money on top left in screen
var offset_x = 16;
var offset_y = 16;

switch(room){
	case GameWorld: 
	draw_text(offset_x,offset_y,"Farm Dollars: "+ string(score));
	break;
}