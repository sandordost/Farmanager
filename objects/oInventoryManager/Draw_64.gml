if(inv_enabled){
	inv_current_slot = 0;
	draw_sprite_ext(inv_sprite, 0, inv_pos_x, inv_pos_y, inv_scale, inv_scale, 0, c_white, 1);
	posX = inv_pos_x + inv_slot_padding_left * inv_scale;
	posY = inv_pos_y + inv_slot_padding_top * inv_scale;
	

	for(i = 0; i < array_length(ItemList); i++){
		if(ItemList[i].ItemCount > 0){
			if(ItemList[i].ItemCount > ItemList[i].ItemStacksize){
				inventoryItemCount = ItemList[i].ItemCount;
				while(inventoryItemCount > ItemList[i].ItemStacksize){
					CreateInventorySlot(ItemList[i].ItemSprite, ItemList[i].ItemStacksize);
					inventoryItemCount -= ItemList[i].ItemStacksize;
				}
				CreateInventorySlot(ItemList[i].ItemSprite, inventoryItemCount)
			}
			else{
				CreateInventorySlot(ItemList[i].ItemSprite, ItemList[i].ItemCount)
			}
		}
	}
}
function CreateInventorySlot(itemSprite, itemCount){
	currentRow = floor(inv_current_slot / inv_slot_rowsize);
	posX = inv_pos_x + inv_slot_padding_left * inv_scale + (inv_current_slot mod inv_slot_rowsize) * ((inv_slot_size + inv_slot_space_x) * inv_scale);
	itemPosYOffset = currentRow * (inv_slot_size + inv_slot_space_y) * inv_scale;
	draw_sprite_ext(itemSprite, 0, posX, posY + itemPosYOffset, inv_scale, inv_scale, 0, c_white, 1);
	draw_text_transformed(posX, posY + itemPosYOffset, itemCount, inv_scale / 2.5, inv_scale / 2.5, 0);
	inv_current_slot++;
}