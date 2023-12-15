/// @description Animate heart icons left
if (highlighted_heart_anim_index >= 0) {
	highlighted_heart_anim_index--;
} else {
	highlighted_heart_anim_index = -1;
}

alarm[0] = .1 * room_speed;