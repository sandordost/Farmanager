/// @description Update Camera

//Delay
delay = 25;
//Update Destination
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y;
}

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
