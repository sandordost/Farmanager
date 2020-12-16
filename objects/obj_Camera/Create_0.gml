/// @description Camera Setup
/// @description Set Up Camera
cam = view_camera[0];
follow = obj_Player;
viewWidthHalf = camera_get_view_width(cam) * 0.5;
viewHeightHalf = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;


//setting an alarm once for screenadjustment(runs smoother)
alarm[0] = 1;
//second alarm for starting the game so Camera is able to set a target
if(!global.pause){
	alarm[1] = 1;
}

//Adjusting GUI size to e in line with cam size
display_set_gui_size(camera_get_view_width(cam), camera_get_view_height(cam));























