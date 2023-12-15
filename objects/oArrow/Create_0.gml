/// @description Arrow properties

event_inherited();

arrow_max_speed = 10;
arrow_speed = 0;
arrow_distance = 0;
arrow_is_shooted = false;
arrow_heading = 0;
arrow_damage = 0;

arrow_start_position_x = x;
arrow_start_position_y = y;

item_equip = function() {
	equipped = true;
	image_angle = 0;
	
	audio_play_sound(pop, 1, false, .5);
}

arrow_shoot = function(heading = 0, move_speed = 0, move_distance = 0) {
	arrow_speed = move_speed;
	arrow_distance = move_distance;
	arrow_is_shooted = true;
	
	arrow_heading = heading;
	switch (heading) {
	    case 0: // Facing right
			image_angle = 135 + 180;
	        break;
	    case 1: // Facing left
			image_angle = 135;
	        break;
	    case 2: // Facing down
			image_angle = 45 + 180;
	        break;
	    case 3: // Facing up
			image_angle = 45;
			break;
	}
}