/// @description Character Interactions
if(keyboard_check_pressed(global.key_openMenu))		{script_execute(pause_game());} 
else												{global.pause = false;	}
	
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

//Alter speed if key is pressed
if(input_walk || input_sprint)		{spd = abs((input_walk*walkspeed)-(input_sprint*sprintspeed));}
else								{spd = normalspeed;}

//---------------Reset move variables
moveX = 0;
moveY = 0;
//---------------intended movement
moveX = (input_right - input_left) * spd;
if(moveX==0)	{moveY = (input_down - input_up) * spd;}


//---------------Collision Check
//----Horizontal Check
if(moveX !=0){
	if(place_meeting(x+moveX,y,obj_Collision)){
		while(!place_meeting(x+sign(moveX),y,obj_Collision)){
			x += sign(moveX);
		} 
		moveX=0;
	}
}
//----Vertical Check
if(moveY != 0){
	if(place_meeting(x,y+moveY,obj_Collision)){
			while(!place_meeting(x,y+sign(moveY),obj_Collision)){
				y += sign(moveY);
			}
			moveY=0;

	}
}

//Link moveX to global.moveX and saem for %y
moveX	=	moveX;
moveY	=	moveY;
//---------------Apply Movement
x += moveX;
y += moveY;

//===============END MOVEMENT






