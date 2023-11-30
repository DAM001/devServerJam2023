// ---------- Inventory stuffs ----------
globalvar item_inventory_length; // the amount of items what the player can equip
globalvar item_inventory; // an array of indexes about the items equipped
globalvar item_inventory_selected; // the index of the highlighted inventory slot
globalvar item_inventory_active; // the currently in-hand item
globalvar item_inventory_pickup_range; // pickuprange for the items
globalvar item_inventory_items; // the list of items equipped;

item_inventory_pickup_range = 50;
item_inventory_length = 8;
item_inventory_selected = 0;
item_inventory = [item_inventory_length];
item_inventory_items = [item_inventory_length];

for (var i = 0; i < item_inventory_length; i += 1)
{
	item_inventory[i] = -1;
}