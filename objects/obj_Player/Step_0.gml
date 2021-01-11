/// @description Character Interactions




if(keyboard_check_pressed(global.key_openMenu))		{scr_pause_game(); } 
else												{
	
///SCORE CHECKING ONLY FOR DEVELOPMENT
if(keyboard_check(vk_space)){
		score++;
}
/// END OF CHECK
//==============MOVEMENT
//--------------Update input
input_left		=	keyboard_check(vk_left) || keyboard_check_direct(ord("A"));
input_right		=	keyboard_check(vk_right) || keyboard_check_direct(ord("D"));
input_up		=	keyboard_check(vk_up) || keyboard_check_direct(ord("W"));
input_down		=	keyboard_check(vk_down) || keyboard_check_direct(ord("S"));
input_walk		=	keyboard_check(vk_control);
input_sprint	=	keyboard_check(vk_shift);
input_plant		=	mouse_check_button_pressed(mb_left);


//Alter speed if key is pressed
if(input_walk || input_sprint)		{spd = abs((input_walk*walkspeed)-(input_sprint*sprintspeed));}
else								{spd = normalspeed;}

if(!global.pause) script_execute(state);

depth = -bbox_bottom;
}








