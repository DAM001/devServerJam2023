// Inherit the parent event
event_inherited();

grass_multiply_time = 20;

// Spawn grass
alarm[3] = (irandom(grass_multiply_time) + (grass_multiply_time / 2)) * room_speed;