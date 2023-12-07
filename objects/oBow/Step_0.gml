event_inherited();

var player = instance_nearest(x, y, oPlayer);

// Rotate bow or crossbow
if (instance_exists(player) && equipped) {
    switch (player.my_facing) {
        case 0: // Facing right
			image_angle = 135 + 180;
            break;
        case 1: // Facing left
			image_angle = 225 + 180;
            break;
        case 2: // Facing down
			image_angle = 135;
            break;
        case 3: // Facing up
			image_angle = 45;
			break;
    }
}