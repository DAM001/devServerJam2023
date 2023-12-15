globalvar player_max_health;
globalvar player_current_health;
globalvar player_is_invincable;
globalvar player_invincable_time;

player_max_health = 6;
player_current_health = player_max_health;
player_is_invincable = false;
player_invincable_time = 3;

player_heart_icons = [player_max_health];
highlighted_heart_anim_index = -1;

damage = function() {
	if (player_is_invincable) {
		return;
	} else {
		player_is_invincable = true;
		alarm[2] = player_invincable_time * room_speed;
	}
	
	if (player_current_health > 0) {
		player_current_health--;
	}
	
	alarm[0] = .1 * room_speed;
	highlighted_heart_anim_index = -1;
}

heal = function() {
	if (player_current_health < player_max_health) {
		player_current_health++;
	}

	alarm[1] = .1 * room_speed;
	highlighted_heart_anim_index = player_max_health;
}

// visuals
depth = -10000000;

alarm[0] = .1 * room_speed;

