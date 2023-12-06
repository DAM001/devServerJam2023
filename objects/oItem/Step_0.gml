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
