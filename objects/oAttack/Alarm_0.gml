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

// Do damage to trees
var _list = ds_list_create();
var _num = instance_place_list(x, y, oTree, _list, false);

if (_num > 0) {
    for (var i = 0; i < _num; ++i;) {
		_list[| i].tree_damage(attack_resource_damage);
    }
}

ds_list_destroy(_list);