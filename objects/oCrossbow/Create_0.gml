event_inherited();

hide_attack_cooloff = function() {
	attack_cooloff_bar.set_health(0, attack_cooloff);
}

item_use = function() {
	if (is_loaded) {
		shoot();
	} else if (check_arrow() && equipped && usable && attack_cooloff_current <= 0) {
		attack_cooloff_current = 0;
		
		is_loaded = true;
		is_attack_charging = true;
		current_durability--;
		
		alarm[1] = .1 * room_speed;
	}
}

item_use_up = function() {
	if (is_loaded && attack_cooloff_current < attack_cooloff) {
		shoot();
	}
	
	if (current_durability <= 0) {
		item_inventory[item_inventory_selected] = -1;
		item_inventory_items[item_inventory_selected] = noone;
		item_inventory_active = noone;
		instance_destroy(self);
	}
}

shoot = function() {
	if (attack_cooloff_current > 0) {
		attack_cooloff_current++;
	}
		
	shoot_arrow(attack_cooloff_current);
	is_loaded = false;
	is_attack_charging = false;
	attack_cooloff_current = 0;
	image_index = 0;
		
	attack_cooloff_bar.set_health(attack_cooloff_current, attack_cooloff);
}