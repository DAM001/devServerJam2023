rock_spawn_time = 30;

instance_create_layer(x, y, 0, oRockOre);

// Spawn rocks
//alarm[0] = (irandom(rock_spawn_time) + (rock_spawn_time / 2)) * room_speed;
alarm[0] = 1 * room_speed;