/// @description Tree spawner

randomize();
var position_x = x + (irandom(4) - 2) * 32;
var position_y = y + (irandom(4) - 2) * 32;
var object_type = irandom(5);

var object_at_position = instance_position(position_x, position_y, [oTree, oRockOre, oItem, oPlayer, oWall]);

if (object_at_position == noone) {
	if (object_type <= 4) {
		instance_create_layer(position_x, position_y, 0, oTree);
	} else {
		instance_create_layer(position_x, position_y, 0, oStick);
	}
}

alarm[1] = (irandom(tree_multiply_time) + (tree_multiply_time / 2)) * room_speed;