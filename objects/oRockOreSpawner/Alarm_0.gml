/// @description Spawn rocks

randomize();
var position_x = x + (irandom(2) - 1) * 32;
var position_y = y + (irandom(2) - 1) * 32;

var object_type = irandom(3);

var object_at_position = instance_position(position_x, position_y, [oTree, oRockOre, oItem, oPlayer]);

if (object_at_position == noone) {
	if (object_type <= 2) {
		instance_create_layer(position_x, position_y, 0, oRockOre);
	} else {
		instance_create_layer(position_x, position_y, 0, oRock);
	}
}

alarm[0] = (irandom(rock_spawn_time) + (rock_spawn_time / 2)) * room_speed;