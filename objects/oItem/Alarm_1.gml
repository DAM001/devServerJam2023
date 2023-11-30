/// @description Attack cooloff
attack_cooloff_current--;
attack_cooloff_bar.set_health(attack_cooloff_current, attack_cooloff);

if (attack_cooloff_current > 0){
	alarm[1] = .1 * room_speed;
}