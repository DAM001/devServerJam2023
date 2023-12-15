/// @description Pathfinging

// Create or update the grid
var grid = mp_grid_create(0, 0, room_width / grid_size, room_height / grid_size, grid_size, grid_size);
mp_grid_add_instances(grid, oTree, false); // Add non-solid instances only

// Find path to player
var path = path_add();
var distance_from_player = point_distance(x, y, oPlayer.x, oPlayer.y);
if (distance_from_player < view_distance) {
	if (mp_grid_path(grid, path, x, y, oPlayer.x, oPlayer.y, true)) {
	    path_start(path, move_speed, path_action_stop, false);
	}
	
	if (distance_from_player < grid_size) {
		var health_manager = instance_nearest(x, y, oHealthManager);
		health_manager.damage();
	}
}

// Cleanup
mp_grid_destroy(grid);