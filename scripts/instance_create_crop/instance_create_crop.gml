///@description instance_create_crop
function instance_create_crop(mouse_x, mouse_y, crop_type){
//create the instance
	var inst = instance_create_layer(mouse_x, mouse_y, "Instances", obj_Crop);
	show_debug_message(string(mouse_x) + " " + string(mouse_y));

//Give the crop its characteristics
	with(inst){
		growthStageDuration = CropData.ds_crops_types[# 0, crop_type];
	}
	show_debug_message(string(inst))
	return inst;
	
}

