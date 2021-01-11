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
		if(selectCrop = 0 and InInventory("TomatoSeeds", 1)){
			instance_create_crop(mx, my, selectCrop);
			RemoveItemFromInventory("TomatoSeeds", 1);
		}
		else if(selectCrop = 1 and InInventory("PotatoSeeds", 1)){
			instance_create_crop(mx, my, selectCrop);
			RemoveItemFromInventory("PotatoSeeds", 1);
		}
		else if(selectCrop = 1 and InInventory("CarrotSeeds", 1)){
			instance_create_crop(mx, my, selectCrop);
			RemoveItemFromInventory("CarrotSeeds", 1);
		}
		else if(selectCrop = 1 and InInventory("ArtichokeSeeds", 1)){
			instance_create_crop(mx, my, selectCrop);
			RemoveItemFromInventory("ArtichokeSeeds", 1);
		}
		else if(selectCrop = 1 and InInventory("ChilliSeeds", 1)){
			instance_create_crop(mx, my, selectCrop);
			RemoveItemFromInventory("ChilliSeeds", 1);
		}
		else if(selectCrop = 1 and InInventory("GourdSeeds", 1)){
			instance_create_crop(mx, my, selectCrop);
			RemoveItemFromInventory("GourdSeeds", 1);
		}
		else if(selectCrop = 1 and InInventory("CornSeeds", 1)){
			instance_create_crop(mx, my, selectCrop);
			RemoveItemFromInventory("CornSeeds", 1);
		}
	}
}