//Update Inventory UI
var _ItemList = ItemList;
var count = 0;
with(oInventoryPlaceholder){
	if(count < array_length(_ItemList)){
		sprite_index = _ItemList[count].ItemSpriteIndex;
	}
	count++;
}