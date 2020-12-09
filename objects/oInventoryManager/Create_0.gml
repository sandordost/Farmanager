#region Adding Items
//List of Items
ItemList = array_create(0);

//Create Items

	//Potato
	array_push(ItemList, CreateItem("Potato", 15, 64, 0, sItemPotato, 5));

	//Strawberry
	array_push(ItemList, CreateItem("Strawberry", 25, 32, 0, sItemStrawberry, 10));

	//Apple
	array_push(ItemList, CreateItem("Apple", 10, 16, 0, sItemApple, 20));

	//Pear
	array_push(ItemList, CreateItem("Pear", 10, 20, 0, sItemApple, 30));
	
#endregion
#region InventoryUI Variables
inv_sprite = sInventory;
inv_enabled = false;
inv_scale = 2;
inv_width = 128 * inv_scale;
inv_height = 101 * inv_scale;
inv_pos_x = display_get_gui_width() - inv_width;
inv_pos_y = display_get_gui_height() / 2 - inv_height /2;
inv_slot_padding_left = 8;
inv_slot_padding_top = 17
inv_slot_rowsize = 6;
inv_slot_size = 17;
inv_slot_space_x = 2;
inv_slot_space_y = 3;


#endregion