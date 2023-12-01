target_object = noone;
frame_number = 15;
desired_position_y = 0;

set_health = function(current_health = 0, max_health = 0) {
	var current_value = frame_number - (current_health / max_health * frame_number);
	image_index = current_value;
}

set_color = function(color = make_color_rgb(255, 255, 255)) {
	image_blend = color;
}

depth = -1000000;
image_speed = 0;
image_index = 15;