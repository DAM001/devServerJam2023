/// @description Attack cooloff
if (is_attack_charging) {
	attack_cooloff_current++;

	if (attack_cooloff_current < attack_cooloff) {
		image_index = attack_cooloff_current * 3 / 10 + 1;
		
		alarm[1] = .1 * room_speed;
	} else {
		audio_play_sound(loading_end, 1, false, .5);
	}
} else {
	attack_cooloff_current = 0;
	image_index = 0;
}

attack_cooloff_bar.set_health(attack_cooloff_current, attack_cooloff);