/// @description Grass spawner

randomize();
var position_x = x + (irandom(4) - 2) * 32;
var position_y = y + (irandom(4) - 2) * 32;

var player = instance_nearest(x, y, oPlayer);
var distance_from_player = point_distance(position_x, position_y, player.x, player.y);
if (distance_from_player > grid_size * 2) {
	var object_at_position = instance_position(position_x, position_y, [oTree, oRockOre, oItem, oWall, oGrass]);

	if (object_at_position == noone) {
		instance_create_layer(position_x, position_y, 0, oGrass);
	}
}

alarm[3] = (irandom(grass_multiply_time) + (grass_multiply_time / 2)) * room_speed;