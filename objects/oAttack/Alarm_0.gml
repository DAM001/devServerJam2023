/// @description Set rotation and do damage

// Set rotation
switch (attack_direction) {
    case 0: //right
        image_angle = 0;
		x += distance_from_player;
        break;
    case 1: //left
        image_angle = 180;
		x -= distance_from_player;
        break;
    case 2: //down
        image_angle = 270;
		y += distance_from_player;
        break;
    case 3: //up
        image_angle = 90;
        y -= distance_from_player;
		break;
}

// ---------- DAMAGE ----------
damage_object = function(damage_object_type = noone, damage_amount = 0) {
	var _list = ds_list_create();
	var _num = instance_place_list(x, y, damage_object_type, _list, false);

	if (_num > 0) {
		_list[| 0].damage(damage_amount);
		ds_list_destroy(_list);
		
		return true;
	}

	return false;
}

// Do damage
var is_object_damaged = damage_object(oTree, attack_tree_damage);
if (is_object_damaged) {
	var sounds = [wood1, wood2, wood3, wood4];
	audio_play_sound(sounds[irandom(3)], 1, false, .3);
} else {
	is_object_damaged = damage_object(oRockOre, attack_mining_damage);
}
if (is_object_damaged) {
	var sounds = [stone154, stone255, stone356, stone457];
	audio_play_sound(sounds[irandom(3)], 1, false, .3);
} else {
	is_object_damaged = damage_object(oEnemy, attack_enemy_damage);
}
if (is_object_damaged) {
	var sounds = [sweep1, sweep2, sweep3, sweep4, sweep5, sweep6, sweep7];
	audio_play_sound(sounds[irandom(6)], 1, false, .3);
}

if (!is_object_damaged) {
	var sounds = [sweep1, sweep2, sweep3, sweep4, sweep5, sweep6, sweep7];
	audio_play_sound(sounds[irandom(6)], 1, false, .3);
}