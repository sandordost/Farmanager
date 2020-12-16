/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("P"))){ planting = !planting }

if(planting) {
	mx = mouse_x;
	my = mouse_y;
	
	if(mouse_wheel_up()) selectCrop += 1;
	if(mouse_wheel_down()) selectCrop -= 1;
	
	if(selectCrop > sprite_get_number(spr_Crops_Item) - 1) { selectCrop = 0 }
	else if (selectCrop < 0) { selectCrop = sprite_get_number(spr_Crops_Item)-1; }
	
	if(mouse_check_button_pressed(mb_left)) {
		instance_create_crop(mx, my, selectCrop);
	
	}
}