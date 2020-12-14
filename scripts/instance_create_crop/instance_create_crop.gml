///@description instance_create_crop
///@arg x
///@arg y
///@arg crop_type
function instance_create_crop(){
//create the instance
	var inst = instance_create_layer(argument0, argument1, "Instances", CropData.corn);

//Give the crop its characteristics
	with(inst){
		cropType = argument2;
		growthStageDuration = CropData.ds_crops_types[# 0, cropType];
	}
	return inst;
}