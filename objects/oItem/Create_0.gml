// basic items
item_index = item_none;
equipped = false;

item_name = "";
item_description = "";

// usable items
usable = false;
durability = 40;
attack_mining_damage = 1;
attack_tree_damage = 1;
attack_enemy_damage = 1;
attack_cooloff = 10; // 1 is 100ms

attack_cooloff_current = 0;
attack_cooloff_bar = instance_create_layer(x, y, 0, oHealthBar);

// setup item properties
alarm[0] = 0.1 * room_speed;

// visual part
image_xscale = 2;
image_yscale = 2;

item_equip = function() {
	equipped = true;
}

item_unequip = function() {
	equipped = false;
	
	x += irandom(20) - 10;
	y += irandom(20) - 10;
}