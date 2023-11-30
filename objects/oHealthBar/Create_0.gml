target_object = noone;
frame_number = 8;

set_health = function(current_health = 0, max_health = 0) {
	var current_value = frame_number - (current_health / max_health * frame_number);
	image_index = current_value;
}

depth = -1000000;
image_speed = 0;