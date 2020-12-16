/// @description Create Vars
state = scr_PlayerStateFree;
lastState= state;

score = 100;
xFrame = 1;
yFrame = 8;
moveX = 0;
moveY = 0;
x_offset = sprite_get_xoffset(mask_index);
y_offset = sprite_get_yoffset(mask_index);

spr_base	=	spr_BaseMale_3;
spr_torso	=	spr_MaleTorsoWhite;
spr_legs	=	spr_MaleLegsGreen;
spr_feet	=	spr_FeetMaleBootsBlack;
spr_hair	=	spr_HairMalePink;


sprintspeed = 4;
normalspeed = 2;
walkspeed = 1;
spd = normalspeed;

