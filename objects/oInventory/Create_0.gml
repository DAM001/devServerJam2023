// ---------- Inventory stuffs ----------
globalvar item_inventory_length; // the amount of items what the player can equip
globalvar item_inventory; // an array of indexes about the items equipped
globalvar item_inventory_selected; // the index of the highlighted inventory slot
globalvar item_inventory_active; // the currently in-hand item
globalvar item_inventory_pickup_range; // pickup range for the items
globalvar item_inventory_items; // the list of items equipped;

item_inventory_pickup_range = 50;
item_inventory_length = 8;
item_inventory_selected = 0;
item_inventory = [item_inventory_length];
item_inventory_items = [item_inventory_length];

item_inventory_durability_bar = [item_inventory_length];
position_x = 0;
position_y = 0;

for (var i = 0; i < item_inventory_length; i += 1)
{
	item_inventory[i] = -1;
	item_inventory_durability_bar[i] = instance_create_layer(0, 0, 0, oHealthBar);
	item_inventory_durability_bar[i].depth = -10000001;
}

// visuals
depth = -10000000;