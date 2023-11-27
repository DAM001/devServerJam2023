var player = instance_nearest(x, y, oPlayer);

// Move item with the player if it's equipped
if (instance_exists(player) && equipped) {
    var offset_x, offset_y, scale_x;

    switch (player.my_facing) {
        case 0: // Facing right
            offset_x = 40;
            offset_y = 26;
            scale_x = 2;
            break;
        case 1: // Facing left
            offset_x = 20;
            offset_y = 26;
            scale_x = -2;
            break;
        case 2: // Facing down
            offset_x = 20;
            offset_y = 24;
            scale_x = -2;
            break;
        case 3: // Facing up
            offset_x = 40;
            offset_y = 20;
            scale_x = 2;
            break;
    }

    x = player.x + offset_x;
    y = player.y + offset_y;
    image_xscale = scale_x;
}