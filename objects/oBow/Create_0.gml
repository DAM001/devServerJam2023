event_inherited();

image_index = 0;
image_speed = 0;

is_loaded = false;
is_attack_charging = false;
shoot_distance = 100;

hide_attack_cooloff = function() {
	item_use_up();
	attack_cooloff_bar.set_health(0, attack_cooloff);
}

item_unequip = function() {	
	hide_attack_cooloff();

	equipped = false;
	
	x += irandom(20) - 10;
	y += irandom(20) - 10;
	image_xscale = 2;
	image_angle = 0;
}


item_use = function() {
	if (check_arrow() && equipped && usable && attack_cooloff_current <= 0) {
		attack_cooloff_current = 0;
		
		is_loaded = true;
		is_attack_charging = true;
		current_durability--;
		
		// TODO: destroy item if durability is zero
		/*if (current_durability <= 0) {
			instance_destroy(self);
		}*/
		
		alarm[1] = .1 * room_speed;
	}
}

item_use_up = function() {
	if (is_loaded) {
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
}

shoot_arrow = function(arrow_speed) {
    var arrow = instance_create_layer(x, y, 0, oArrow);

    var player = instance_nearest(x, y, oPlayer);
    if (instance_exists(player)) {
        arrow.arrow_shoot(player.my_facing, arrow_speed, shoot_distance / attack_cooloff * arrow_speed);
    }
}

check_arrow = function() {
	for (var i = 0; i < item_inventory_length; i += 1) {
		if (item_inventory[i] == item_arrow) {
			item_inventory[i] = -1;
			item_inventory_items[i] = noone;		
			return true;
		}
	}
	return false;
}