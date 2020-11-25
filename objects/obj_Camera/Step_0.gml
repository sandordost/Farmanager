/// @description Update Camera

//Delay
delay = 25;
//Update Destination
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}
//Manual Camera Control				
//
//	!!// BUGGED || DONT USE IT IN GAME || BUGGED \\!!
moveCam = keyboard_check(ord("C"));
if (moveCam){
	var input_left		=	keyboard_check_direct(ord("A"));
	var input_right		=	keyboard_check_direct(ord("D"));
	var input_up		=	keyboard_check_direct(ord("W"));
	var input_down		=	keyboard_check_direct(ord("S"));
	x += xTo * (input_right-input_left);
	y += yTo * (input_up-input_down);
	camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
}else {
//	-----------------END OF BUGGED PART-------------------

//Attaching Camera Position to Object
x = clamp(x,view_w_half,room_width);
y = clamp(y,view_h_half,room_height);

//Update Object posistion
//xTo/yTo dividing by itself make the camera move its positioncords, / delay for smoothness
x += (xTo - x) / delay;
y += (yTo - y) / delay;

//Update Camera view
//x-view_w_half makes sure the the left topcorner is centered in the middle, same goes for y and height
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);
}