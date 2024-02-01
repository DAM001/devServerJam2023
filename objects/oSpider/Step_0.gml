/// @description Explotion
event_inherited();

var distance_from_player = point_distance(x, y, oPlayer.x, oPlayer.y);
if (distance_from_player < explotion_distance) {
	instance_create_layer(x, y, 0, oExplotion);

	// kill the mob
	damage(max_health);
}