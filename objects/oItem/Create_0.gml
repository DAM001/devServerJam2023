// basic items
item_index = item_none;
equipped = false;
item_position_secondary = false;

item_name = "Item";
item_description = "";

// usable items
usable = false;
durability = 40;
current_durability = durability;
attack_mining_damage = 1;
attack_tree_damage = 1;
attack_enemy_damage = 1;
attack_cooloff = 10; // 1 is 100ms

attack_cooloff_current = 0;
attack_cooloff_bar = instance_create_layer(x, y, 0, oHealthBar);

// placeable object
is_placeable = false;

// crafting station
crafting_station_level = -1;

// setup item properties
alarm[0] = 0.1 * room_speed;

// visual part
image_xscale = 2;
image_yscale = 2;

hide_attack_cooloff = function() {
	attack_cooloff_bar.set_health(0, attack_cooloff);
}

item_equip = function() {
	equipped = true;
	
	audio_play_sound(pop, 1, false, .5);
}

item_unequip = function() {
	hide_attack_cooloff();

	equipped = false;
	
	image_xscale = 2;
	
	if (is_placeable) {
		x = round(x / grid_size) * grid_size;
		y = round(y / grid_size) * grid_size;
	} else {
		x += irandom(20) - 10;
		y += irandom(20) - 10;
	}
}

item_hide = function() {
	hide_attack_cooloff();
	visible = false;
	instance_deactivate_object(self);
}

item_show = function() {
	instance_activate_object(self);
	alarm[2] = .05 * room_speed;
}

item_use = function() {
	if (equipped && usable && attack_cooloff_current <= 0) {
		var atteck_effect = instance_create_layer(oPlayer.x, oPlayer.y, 0, oAttack);
		atteck_effect.attack_direction = oPlayer.my_facing;
		atteck_effect.attack_enemy_damage = attack_enemy_damage;
		atteck_effect.attack_tree_damage = attack_tree_damage;
		atteck_effect.attack_mining_damage = attack_mining_damage;
		
		item_position_secondary = !	item_position_secondary;
		attack_cooloff_current = attack_cooloff;
		
		current_durability--;
		
		alarm[1] = .1 * room_speed;
	}
}

item_use_up = function() {
	if (current_durability <= 0) {
		item_inventory[item_inventory_selected] = -1;
		item_inventory_items[item_inventory_selected] = noone;
		item_inventory_active = noone;
		instance_destroy(self);
	}
}