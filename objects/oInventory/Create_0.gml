// ---------- Inventory stuffs ----------
globalvar item_inventory_length;
globalvar item_inventory;

item_inventory_length = 8;
item_inventory = [item_inventory_length];
for (var i = 0; i < item_inventory_length; i += 1)
{
	item_inventory[i] = -1;
}
