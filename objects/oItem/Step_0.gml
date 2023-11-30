// ITEM MOVEMENT
var player = instance_nearest(x, y, oPlayer);
var item_depth = -y;

// Move item with the player if it's equipped
if (instance_exists(player) && equipped) {
    var offset_x, offset_y, scale_x;

    switch (player.my_facing) {
        case 0: // Facing right
            offset_x = 16;
            offset_y = 0;
            scale_x = 2;
			item_depth -= 24;
            break;
        case 1: // Facing left
            offset_x = -16;
            offset_y = 0;
            scale_x = -2;	
            break;
        case 2: // Facing down
            offset_x = -12;
            offset_y = 3;
            scale_x = -2;
			item_depth -= 24;
            break;
        case 3: // Facing up
            offset_x = 12;
            offset_y = -3;
            scale_x = 2;
			break;
    }

	// update items position
    x = player.x + offset_x;
    y = player.y + offset_y;
    image_xscale = scale_x;
	
	attack_cooloff_bar.target_object = player;
	attack_cooloff_bar.desired_position_y = -18;
}

// VISUALS
depth = item_depth;

// USE
if (keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left)) {
	if (equipped && usable && attack_cooloff_current <= 0) {
		var atteck_effect = instance_create_layer(oPlayer.x, oPlayer.y, 0, oAttack);
		atteck_effect.attack_direction = oPlayer.my_facing;
		atteck_effect.attack_enemy_damage = attack_enemy_damage;
		atteck_effect.attack_tree_damage = attack_tree_damage;
		atteck_effect.attack_mining_damage = attack_mining_damage;
		
		attack_cooloff_current = attack_cooloff;
		alarm[1] = .1 * room_speed;
	}
}
