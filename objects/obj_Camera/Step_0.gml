///// @description Update Camera

////Delay
//delay = 25;
////Update Destination
//if(instance_exists(follow)){
//	xTo = follow.x;
//	yTo = follow.y;
//}

////Attaching Camera Position to Object
//x = clamp(x,view_w_half,room_width);
//y = clamp(y,view_h_half,room_height);

////Update Object posistion
////xTo/yTo dividing by itself make the camera move its positioncords, / delay for smoothness
//x += (xTo - x) / delay;
//y += (yTo - y) / delay;

////Update Camera view
////x-view_w_half makes sure the the left topcorner is centered in the middle, same goes for y and height
//camera_set_view_pos(cam,x-view_w_half,y-view_h_half);




///Follow Target
if(switchDone){
	with(target){
		var targetX = x;
		var targetY = y;
	}
	cameraX = targetX - (cameraWidth/2);
	cameraY = targetY - (cameraHeight/2);
}

//---Optional || Might be bugged //
//cameraX = clamp(cameraX, 0 , room_width-cameraWidth);
//cameraY = clamp(cameraY, 0 , room_width-cameraHeight);
//---END OF OPTIONAL PART
camera_set_view_pos(view_camera[0],cameraX,cameraY)

x += cameraX;
y += cameraY;





























