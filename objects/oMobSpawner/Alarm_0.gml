/// @description Spawn mob
randomize();

var min_distance = grid_size * 16;
var mob_type = irandom(1);
var mobs_type = [oSlime, oSpider];

var player = instance_nearest(x, y, oPlayer);
var position_x = player.x + (grid_size * (irandom(32) - 16) * 4);
var position_y = player.y + (grid_size * (irandom(32) - 16) * 4);
var distance_from_player = point_distance(position_x, position_y, player.x, player.y);

if (position_x > 0 && position_y > 0) {
	if (distance_from_player > min_distance) {
		instance_create_layer(position_x, position_y, 0, mobs_type[mob_type]);
	}
}

alarm[0] = (irandom(mob_spawn_time) + (mob_spawn_time / 2)) * room_speed;