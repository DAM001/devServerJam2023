// --------- MOVEMENT ---------
var collide_objects = [oWall, oTree];

//input for the movement
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

//calculate the move direction
var _xinput = _right - _left;
var _yinput = _down - _up;

var _magnitude = point_distance(0, 0, _xinput, _yinput);
if (_magnitude > 0) {
    _xinput /= _magnitude;
    _yinput /= _magnitude;
}

move_and_collide(_xinput * my_speed, _yinput * my_speed, collide_objects);


// movement anim
if (_xinput > 0) {
	my_facing = 0;
    sprite_index = sPlayerMoveRight;
} else if (_xinput < 0) {
	my_facing = 1;
    sprite_index = sPlayerMoveLeft;
} else if (_yinput > 0) {
	my_facing = 2;
    sprite_index = sPlayerMoveDown;
} else if (_yinput < 0) {
	my_facing = 3;
    sprite_index = sPlayerMoveUp;
}

//idle anim
if (_xinput == 0 && _yinput == 0)
{
	if (my_facing == 0) {
		sprite_index = sPlayerIdleRight;
	} else if (my_facing == 1) {
		sprite_index = sPlayerIdleLeft;
	} else if (my_facing == 2) {
		sprite_index = sPlayerIdleDown;
	} else if (my_facing == 3) {
		sprite_index = sPlayerIdleUp;
	}
}

// --------- ITEM HANDLING ---------
/*if (keyboard_check_pressed(ord("G"))) {

}

if (keyboard_check_pressed(ord("E"))) {
    var nearestItem = noone;
    var nearestDistance = -1;
    
    with (oItem) {
        var distance = point_distance(x - 32, y - 32, other.x, other.y);
        
        if (nearestItem == noone || distance < nearestDistance) {
            nearestItem = id;
            nearestDistance = distance;
        }
    }
    
	
	nearestItem.equipped = true;
}*/