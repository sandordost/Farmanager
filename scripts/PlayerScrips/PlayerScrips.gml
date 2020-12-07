// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
//UpdateSPrite
function scr_PlayerAnimationSprite(mX, mY){
///Drawing the Character
var anim_lengt = 9
var frame_size = 64;
var anim_speed = 12;
//Determining wich sprite to use with wich direction of movement(left facing sprite when fadcing left, etc)
if		(mX < 0)		{yFrame = 9;	}
else if	(mX > 0)		{yFrame = 11;	}
else if	(mY < 0)		{yFrame = 8;	}
else if	(mY > 0)		{yFrame = 10;	}
else					{xFrame =0;		}
//
var xx = x-x_offset;
var yy = y-y_offset;

// increment frame for animation at 12 fps
if(xFrame + (anim_speed/60)< anim_lengt-1)		{ xFrame += anim_speed/60;	}
else											{ xFrame = 0;				}

// Draw character Base
draw_sprite_part(spr_base, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy);
// Draw character Feet
draw_sprite_part(spr_feet, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy);
// Draw character Legs
draw_sprite_part(spr_legs, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy);
// Draw character Torso
draw_sprite_part(spr_torso, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy);
// Draw character Hair
draw_sprite_part(spr_hair, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy);



//Drawing Collisionsbox for testing
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow);
}

function scr_PlayerCollision(){
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
}
///----PLAYER STATES------
function scr_PlayerStateNothing(){
//Do nothing	
}

function scr_PlayerStateFree(){
//---------------Reset move variables
moveX = 0;
moveY = 0;
//---------------intended movement
moveX = (input_right - input_left) * spd;
if(moveX==0)	{moveY = (input_down - input_up) * spd;}

//Collision Check
scr_PlayerCollision();

//---------------Apply Movement
x += moveX;
y += moveY;

//===============END MOVEMENT

}