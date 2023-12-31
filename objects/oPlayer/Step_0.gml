// --------- MOVEMENT ---------
var collide_objects = [oWall, oTree, oRockOre];

//input for the movement
var _right = keyboard_check(ord("D"));
var _left = keyboard_check(ord("A"));
var _up = keyboard_check(ord("W"));
var _down = keyboard_check(ord("S"));

my_speed_modifier = 1;
if (keyboard_check(vk_shift)) {
	my_speed_modifier = 1.4;
}

//calculate the move direction
var _xinput = _right - _left;
var _yinput = _down - _up;

var _magnitude = point_distance(0, 0, _xinput, _yinput);
if (_magnitude > 0) {
    _xinput /= _magnitude;
    _yinput /= _magnitude;
}

move_and_collide(_xinput * my_speed * my_speed_modifier, _yinput * my_speed * my_speed_modifier, collide_objects);

// play step sound
if (play_step_audio && (_xinput != 0 || _yinput != 0)) {
	play_step_audio = false;
	alarm[0] = 0.3 * room_speed;
}

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
// USE ITEM (BUTTON DOWN)
if (keyboard_check_pressed(vk_space) or mouse_check_button_pressed(mb_left)) {
	if (item_inventory[item_inventory_selected] >= 0) {
		item_inventory_active.item_use();
	}
}

// USE ITEM (BUTTON UP)
if (mouse_check_button_released(vk_space) or mouse_check_button_released(mb_left)) {
	if (item_inventory[item_inventory_selected] >= 0) {
		item_inventory_active.item_use_up();
	}
}

// THROW ITEM
if (!is_crafting && (keyboard_check_pressed(ord("Q")) 
|| keyboard_check_pressed(vk_down) || mouse_check_button_pressed(mb_right))) {
	if (item_inventory[item_inventory_selected] >= 0) {
		item_inventory[item_inventory_selected] = -1;

		item_inventory_active.item_unequip();
	}
}

// EQUIP ITEM
if (!is_crafting && (keyboard_check_pressed(ord("E")) || keyboard_check_pressed(vk_up) 
|| mouse_check_button_pressed(mb_left))) {
    var nearestItem = noone;
    var nearestDistance = 10000;
    
    with (oItem) {
        var distance = point_distance(x, y, other.x, other.y);
        
        if (nearestItem == noone || distance < nearestDistance) {
			nearestItem = id;
			nearestDistance = distance;
        }
    }


	if (nearestDistance < item_inventory_pickup_range && item_inventory[item_inventory_selected] == -1 && !nearestItem.equipped) {
		item_inventory[item_inventory_selected] = nearestItem.item_index;
		item_inventory_items[item_inventory_selected] = nearestItem;
		
		nearestItem.item_equip();
		change_active_inventory(item_inventory_selected);
	}
}

// Change active inventory slot
change_active_inventory = function (active_index) {
	item_inventory_selected = active_index;
	
	if (item_inventory[active_index] >= 0) {
		item_inventory_active = item_inventory_items[active_index];
	}
	
	for (var i = 0; i < item_inventory_length; i += 1) {
		if (item_inventory[i] >= 0) {
			if (i == item_inventory_selected) {
				item_inventory_items[i].item_show();
			} else {
				item_inventory_items[i].item_hide();
			}
		}
	}
}

// INVENTORY SLOT CHANGE ALPHA KEYS
for (var i = 0; i < item_inventory_length; i += 1) {
	if (!is_crafting && (keyboard_check_pressed(ord(i + 1)))) {
		change_active_inventory(i);
	}
}

// INVENTORY SLOT CHANGE UP MOUSE WHEEL AND ARROW KEY
if (!is_crafting && (mouse_wheel_up() || keyboard_check_pressed(vk_right))) {
    item_inventory_selected++;
	if (item_inventory_selected >= item_inventory_length - 1) {
		item_inventory_selected = item_inventory_length - 1;
	}
	
	change_active_inventory(item_inventory_selected);
}

// INVENTORY SLOT CHANGE DOWN MOUSE WHEEL AND ARROW KEY
if (!is_crafting && (mouse_wheel_down() || keyboard_check_pressed(vk_left))) {
    item_inventory_selected--;
	if (item_inventory_selected < 0) {
		item_inventory_selected = 0;
	}
	
	change_active_inventory(item_inventory_selected);
}

// ---------- VISUALS ----------
depth = -y - 16;