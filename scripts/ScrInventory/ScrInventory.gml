function CreateItem(itemName, itemCost, itemStacksize, itemCount, itemSpriteIndex){
	var Item = {
		ItemName: "",
		ItemCost: 0,
		ItemStacksize: 0,
		ItemCount: 0,
		ItemSprite: 0,
	}
	Item.ItemName = itemName;
	Item.ItemCost = itemCost;
	Item.ItemStacksize = itemStacksize;
	Item.ItemCount = itemCount;
	Item.ItemSprite = itemSpriteIndex;
	return Item;
}
function AddItemToInventory(itemName, amount, inventoryArray){
	for(i = 0; i < array_length(inventoryArray); i++){
		if(inventoryArray[i].ItemName == itemName){
			inventoryArray[i].ItemCount+= amount;
		}
	}
}