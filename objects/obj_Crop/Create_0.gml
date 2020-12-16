/// @description Insert description here
frameWidth = 32;
frameHeight = 64;

cropType = 2;
daysOld = 0;
growthStage = 3;
growthStageDuration = 0;
maxGrowthStage = (sprite_get_width(spr_Crops)/frameWidth) -1;
inv_obj_name = "";

fullyGrown = false;
spark = false;

xx = x-(frameWidth/2)+2;
yy = y-frameHeight+6;