function CreateItem(itemName, itemCost, itemStacksize, itemCount, itemSpriteIndex, itemGrowDuration){
	var Item = {
		ItemName: "",
		ItemCost: 0,
		ItemStacksize: 0,
		ItemCount: 0,
		ItemSprite: 0,
		ItemGrowDuration: 0,
	}
	Item.ItemName = itemName;
	Item.ItemCost = itemCost;
	Item.ItemStacksize = itemStacksize;
	Item.ItemCount = itemCount;
	Item.ItemSprite = itemSpriteIndex;
	Item.ItemGrowDuration = itemGrowDuration;
	return Item;
}
function AddItemToInventory(itemName, amount){
	if(CountUsedInventorySlots() < inv_slot_maxslots){
		for(i = 0; i < array_length(ItemList); i++){
			if(ItemList[i].ItemName == itemName){
				ItemList[i].ItemCount+= amount;
			}
		}
	}
	else{
		for(i = 0; i < array_length(ItemList); i++){
			if(ItemList[i].ItemName == itemName){
				while((ItemList[i].ItemCount mod ItemList[i].ItemStacksize) > 0 && amount > 0){
					ItemList[i].ItemCount++;
					amount++;
				}
			}
		}
	}
}
function RemoveItemFromInventory(itemName, amount){
	for(i = 0; i < array_length(ItemList); i++){
		if(ItemList[i].ItemName == itemName){
			if(ItemList[i].ItemCount < amount) ItemList[i].ItemCount = 0;
			else ItemList[i].ItemCount -= amount;
		}
	}
}
function CountUsedInventorySlots(){
	var slots = 0;
	for(i = 0; i < array_length(ItemList); i++){
		slots += ceil(ItemList[i].ItemCount / ItemList[i].ItemStacksize);
	}
	return slots;
}
function ClearInventory(){
	for(i = 0; i < array_length(ItemList); i++){
		ItemList[i].ItemCount = 0;
	}
}