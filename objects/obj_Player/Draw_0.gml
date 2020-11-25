

///Drawing the Character
var anim_lengt = 9
var frame_size = 64;
var anim_speed = 12;
//Determining wich sprite to use with wich direction of movement(left facing sprite when fadcing left, etc)
if		(moveX < 0)		{yFrame = 9;	}
else if	(moveX > 0)		{yFrame = 11;	}
else if	(moveY < 0)		{yFrame = 8;	}
else if	(moveY > 0)		{yFrame = 10;	}
else					{xFrame =0;		}
//
var xx = x-x_offset;
var yy = y-y_offset;

// increment frame for animation at 12 fps
if(xFrame + (anim_speed/60)< anim_lengt-1)		{ xFrame += anim_speed/60;	}
else											{ xFrame = 0;				}

// Draw character Base
draw_sprite_part(spr_base, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy)
// Draw character Feet
draw_sprite_part(spr_feet, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy)
// Draw character Legs
draw_sprite_part(spr_legs, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy)
// Draw character Torso
draw_sprite_part(spr_torso, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy)
// Draw character Hair
draw_sprite_part(spr_hair, 0,floor(xFrame)*frame_size,yFrame*frame_size,frame_size,frame_size,xx,yy)



//Drawing Collicionsbox for testing
draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,c_yellow);/// @description ?
