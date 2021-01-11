/// @description Insert description here
// You can write your code in this editor
if(InInventory("PotatoSeeds", 1)){
	instance_create_crop(mouse_x, mouse_y, crop.corn);
	RemoveItemFromInventory("PotatoSeeds", 1);
}