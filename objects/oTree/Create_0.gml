/// @description Drop and health settings
event_inherited();

tree_multiply_time = 30;
set_max_health(10);

create_drop = function() {
	instance_create_layer(x, y, 0, oWood);
	
	var number_of_sticks = irandom(1);
	for (var i = 0; i < number_of_sticks; ++i;) {
		var random_x = irandom(20) - 10;
		var random_y = irandom(20) - 10;
		instance_create_layer(x + random_x, y + random_y, 0, oStick);
	}
}

// Spawn trees
alarm[1] = (irandom(tree_multiply_time) + (tree_multiply_time / 2)) * room_speed;
//alarm[1] = 1 * room_speed;