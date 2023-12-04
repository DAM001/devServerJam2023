indicator_position_x = 0;
indicator_position_y = 0;
indicator_visible = false;

show_indicator = function() {
	indicator_visible = true;
	instance_activate_object(self);
}

hide_indicator = function() {
	indicator_visible = false;
	instance_deactivate_object(self);
}

indicator_position = function(position_x, position_y) {
	indicator_position_x = position_x;
	indicator_position_y = position_y;
	
	x = indicator_position_x;
	y = indicator_position_y;
}

depth = -1000000;