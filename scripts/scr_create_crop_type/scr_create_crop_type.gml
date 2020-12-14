// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@description create_crop_type
///@arg growth_stage_duration
///@arg cost
function scr_create_crop_type(){
var argNum = argument_count;

//Resize
if(!ds_exists(ds_crops_types, ds_type_grid)){
	ds_crops_types = ds_grid_create(argNum,1);
	var height = 1;
} else {
	var height = ds_grid_height(ds_crops_types);
	ds_grid_resize(ds_crops_types, argNum, height+1);
	height += 1;
}
var yy = height-1;
var i = 0; repeat(argNum){
	ds_crops_types [# i,yy] =  argument[i];
	i += 1;
}
}