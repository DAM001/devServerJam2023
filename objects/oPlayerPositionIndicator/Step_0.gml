/// @description Update position

if (item_inventory[item_inventory_selected] != -1 && item_inventory_active.is_placeable) {
	x = round(item_inventory_active.x / grid_size) * grid_size;
	y = round(item_inventory_active.y / grid_size) * grid_size;
} else {
	x = 0;
	y = 0;
}