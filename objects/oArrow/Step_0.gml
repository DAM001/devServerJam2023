/// @description Movement
if (arrow_is_shooted) {
	switch (arrow_heading) {
	    case 0: // Facing right
			x += arrow_speed;
	        break;
	    case 1: // Facing left
			x -= arrow_speed;
	        break;
	    case 2: // Facing down
			y += arrow_speed;
	        break;
	    case 3: // Facing up
			y -= arrow_speed;
			break;
	}
	
	var distance = point_distance(x, y, arrow_start_position_x, arrow_start_position_y);
	if (arrow_distance < distance) {
		arrow_is_shooted = false;
	}
	
	// check collision
	var object_at_position = instance_position(x, y, [oTree, oRockOre, oPlayer, oWall]);
	if (object_at_position != noone) {
		arrow_is_shooted = false;
		
		var sounds = [bowhit1, bowhit2, bowhit3, bowhit4];
		audio_play_sound(sounds[irandom(3)], 1, false, .3);
	}
} else {
	event_inherited();
}