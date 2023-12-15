/// @description Animate heart icons right
if (highlighted_heart_anim_index < player_max_health) {
	highlighted_heart_anim_index++;
	alarm[0] = .1 * room_speed;
} else {
	highlighted_heart_anim_index = -1;
}