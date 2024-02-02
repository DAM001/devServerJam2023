// Inherit the parent event
event_inherited();

grass_multiply_time = 20;

// Spawn grass
alarm[3] = (irandom(grass_multiply_time) + (grass_multiply_time / 2)) * room_speed;


item_use = function() {
	oHealthManager.heal();
	
	item_inventory[item_inventory_selected] = -1;
	item_inventory_items[item_inventory_selected] = noone;
	item_inventory_active = noone;
	instance_destroy(self);
}