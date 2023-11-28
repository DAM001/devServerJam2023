// ---------- Inventory stuffs ----------
globalvar item_inventory_length;
globalvar item_inventory;
globalvar item_inventory_selected;
globalvar item_inventory_active;
globalvar item_inventory_items;
globalvar item_inventory_pickup_range;

item_inventory_pickup_range = 50;
item_inventory_length = 8;
item_inventory_selected = 0;
item_inventory_items = [item_inventory_length];
item_inventory = [item_inventory_length];
for (var i = 0; i < item_inventory_length; i += 1)
{
	item_inventory[i] = -1;
	//item_inventory_items[i] = [];
}

// Example
//item_inventory[2] = item_rock;
