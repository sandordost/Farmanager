/// @description Update Camera
///Follow Target
if(global.pause == false){
//Update Destination
if(instance_exists(follow)){
	xTo = follow.x;
	yTo = follow.y
} else	{/*show_debug_message("Camera got no Target!")*/}

//update Object Position
x += (xTo - x) / 15;
y += (yTo - y) / 15;

//Keep Camera Center inside Room
x = clamp(x, viewWidthHalf, room_width-viewWidthHalf);
y = clamp(y, viewHeightHalf, room_height-viewHeightHalf);


//Setting Actual Camera Position
camera_set_view_pos(cam , x - viewWidthHalf, y - viewHeightHalf);
} else	{//show_debug_message("Game Paused for Camera!")
}
display_set_gui_size(camera_get_view_width(cam), camera_get_view_height(cam));




























