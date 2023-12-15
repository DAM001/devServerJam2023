// Create or update the grid
var grid = mp_grid_create(0, 0, room_width / grid_size, room_height / grid_size, grid_size, grid_size);
mp_grid_add_instances(grid, oTree, false); // Add non-solid instances only

// Find path to player
var path = path_add();
if (point_distance(x, y, oPlayer.x, oPlayer.y) < view_distance) {
	if (mp_grid_path(grid, path, x, y, oPlayer.x, oPlayer.y, true)) {
	    path_start(path, move_speed, path_action_stop, false);
	}
}

// Cleanup
mp_grid_destroy(grid);