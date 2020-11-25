/// @description Camera Setup

//Camera
cameraX = 0;
cameraY = 0;
switchDone = false;


screenWidtAdjustment = 16;
screenHeightAdjustment = 9;


cameraWidth = 40 * screenWidtAdjustment;
cameraHeight = 40 * screenHeightAdjustment;

view_enabled = true;
view_visible[0] = true;

camera_set_view_size(view_camera[0], cameraWidth, cameraHeight);

///Display
displayScale = 2;
displayWidth = cameraWidth * displayScale;
displayHeight = cameraHeight * displayScale;

window_set_size(displayWidth,displayHeight);
surface_resize(application_surface,displayWidth,displayHeight);
//setting an alarm once for screenadjustment(runs smoother)
alarm[0] = 1;
//second alarm for starting the game so Camera is able to set a target
if(!global.pause){
	alarm[1] = 1;
}

//Adjusting GUI size to e in line with cam size
display_set_gui_size(cameraWidth, cameraHeight);























