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
		for(i = 0; i < array_length(oInventoryManager.ItemList); i++){
			if(oInventoryManager.ItemList[i].ItemName == itemName){
				oInventoryManager.ItemList[i].ItemCount+= amount;
			}
		}
	}
	else{
		for(i = 0; i < array_length(oInventoryManager.ItemList); i++){
			if(oInventoryManager.ItemList[i].ItemName == itemName){
				while((oInventoryManager.ItemList[i].ItemCount mod oInventoryManager.ItemList[i].ItemStacksize) > 0 && amount > 0){
					oInventoryManager.ItemList[i].ItemCount++;
					amount++;
				}
			}
		}
	}
}
function RemoveItemFromInventory(itemName, amount){
	for(i = 0; i < array_length(oInventoryManager.ItemList); i++){
		if(oInventoryManager.ItemList[i].ItemName == itemName){
			if(oInventoryManager.ItemList[i].ItemCount < amount) oInventoryManager.ItemList[i].ItemCount = 0;
			else oInventoryManager.ItemList[i].ItemCount -= amount;
		}
	}
}
function CountUsedInventorySlots(){
	var slots = 0;
	for(i = 0; i < array_length(oInventoryManager.ItemList); i++){
		slots += ceil(oInventoryManager.ItemList[i].ItemCount / oInventoryManager.ItemList[i].ItemStacksize);
	}
	return slots;
}
function ClearInventory(){
	for(i = 0; i < array_length(oInventoryManager.ItemList); i++){
		oInventoryManager.ItemList[i].ItemCount = 0;
	}
}
function InInventory(itemName, amount){
	for(i = 0; i < array_length(oInventoryManager.ItemList); i++){
		if(oInventoryManager.ItemList[i].ItemName == itemName){
			if(oInventoryManager.ItemList[i].ItemCount < amount) return false;
			else return true;
		}
	}
}