// Inherit the parent event
event_inherited();

item_use = function() {
	oHealthManager.heal(6);
	
	item_inventory[item_inventory_selected] = -1;
	item_inventory_items[item_inventory_selected] = noone;
	item_inventory_active = noone;
	instance_destroy(self);
}