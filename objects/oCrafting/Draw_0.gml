// Positioning and Crafting UI
var position_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
var position_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

var width = 300;
var height = 500;

var number_of_items = 0;
var starter_crafting_index = 0;

// crafting
var list_of_items = [];
var number_of_items_have = 0;

// Find Closest Crafting Station and Crafting Level
var closest_crafting_station_distance = 10000;
var closest_crafting_station = noone;
var player = instance_nearest(x, y, oPlayer);
var crafting_level = 0; // Assuming the player object has a crafting_level attribute

with (oItem) {
    var distance = point_distance(x, y, player.x, player.y);
    if (!equipped && distance < item_inventory_pickup_range) {
        if (distance < closest_crafting_station_distance) {
            closest_crafting_station_distance = distance;
            closest_crafting_station = id;
        }
    }
}

if (closest_crafting_station != noone && closest_crafting_station.crafting_station_level > crafting_level) {
    crafting_level = closest_crafting_station.crafting_station_level;
}

// Drawing the Crafting UI
if (is_crafting) {
    // background
    draw_sprite_stretched(sInventory, 0, position_x - width / 2, position_y - height / 2, width, height);
    
    // craftings
    for (var i = 0; i < array_length(item_crafting_recepies); i++) {
        if (item_crafting_recepies[i][0][1] == crafting_level) {
            var item_sprite = item_sprites[item_crafting_recepies[i][0][0]];
            var item_position_x = position_x - (width / 2) + 60;
            var item_position_y = position_y - (height / 2) + 30 + number_of_items * (32 + 6);
            var item_scale = 4;
            draw_sprite_ext(item_sprite, 0, item_position_x, item_position_y, item_scale, item_scale, 0, c_white, 1);
            
            // draw resources
            var resource_count = 0;
            for (var j = 1; j < array_length(item_crafting_recepies[i]); j++) {
                for (var k = 0; k < item_crafting_recepies[i][j][1]; k++) {
                    resource_count++;
                    var resource_sprite = item_sprites[item_crafting_recepies[i][j][0]];
                    var resource_item_position_x = item_position_x + resource_count * (16 + 8) + 32;
                    draw_sprite_ext(resource_sprite, 0, resource_item_position_x, item_position_y + 6, 2, 2, 0, c_white, 1);
                }
            }
            
            // Update number_of_items and starter_crafting_index
            if (number_of_items == 0) {
                starter_crafting_index = i;
            }
            number_of_items++;
            
            // cursor
            var cursor_position_x = position_x - (width / 2) + 24;
            var cursor_position_y = position_y - (height / 2) + 30 + cursor_position * (32 + 6);
            var cursor_craftable = has_all_items(cursor_position + starter_crafting_index) ? 1 : 0;
            draw_sprite_ext(sIndicatorArrow, cursor_craftable, cursor_position_x, cursor_position_y, 2, 2, 0, c_white, 1);
        }
    }
}

// ---------- CRAFT ITEM ----------
has_all_items = function(craft_item_index = -1) {
    list_of_items = [];
    number_of_items_have = 0;
    
    var recipe = item_crafting_recepies[craft_item_index];
    
    // Populate list_of_items with needed items
    for (var i = 1; i < array_length(recipe); i += 1) {
        for (var j = 0; j < recipe[i][1]; j += 1) {
            list_of_items[array_length(list_of_items)] = recipe[i][0];
        }
    }

    // Track which items in the inventory have been used
    var used_inventory_slots = ds_list_create();

    // Check if the player has all the items
    for (var i = 0; i < array_length(list_of_items); i += 1) {
        var item_found = false;
        for (var j = 0; j < item_inventory_length; j += 1) {
            if (item_inventory[j] == list_of_items[i] && !(ds_list_find_index(used_inventory_slots, j) >= 0)) {
                // Mark this inventory slot as used
                ds_list_add(used_inventory_slots, j);
                item_found = true;
                break; // Stop searching after finding the item
            }
        }
        if (item_found) {
            number_of_items_have++;
        }
    }

    // Clean up the list
    ds_list_destroy(used_inventory_slots);

    return number_of_items_have == array_length(list_of_items);
}


craft_item = function(craft_item_index = -1) {
    // Check if the item is craftable
    if (has_all_items(craft_item_index)) {
        var recipe = item_crafting_recepies[craft_item_index];
        
        // Populate list_of_items with needed items
        list_of_items = [];
        for (var i = 1; i < array_length(recipe); i += 1) {
            for (var j = 0; j < recipe[i][1]; j += 1) {
                list_of_items[array_length(list_of_items)] = recipe[i][0];
            }
        }

        // Track which items in the inventory have been used for crafting
        var used_inventory_slots = ds_list_create();

        // Remove items from the inventory
        for (var i = 0; i < array_length(list_of_items); i += 1) {
            for (var j = 0; j < item_inventory_length; j += 1) {
                if (item_inventory[j] == list_of_items[i] && ds_list_find_index(used_inventory_slots, j) == -1) {
                    // Mark this inventory slot as used
                    ds_list_add(used_inventory_slots, j);
                    item_inventory[j] = -1;

                    // Check the currently in-hand item; if it's in the craft, then destroy it
                    if (j == item_inventory_selected) {
                        instance_destroy(item_inventory_active);    
                    }
                    break; // Stop after removing one item
                }
            }
        }

        // Clean up the list
        ds_list_destroy(used_inventory_slots);

        // Create the crafted item near the player
        with (instance_nearest(x, y, oPlayer)) {
            var crafted_item = item_objects[recipe[0][0]];
            var random_x = irandom(20) - 10;
            var random_y = irandom(20) - 10;
            instance_create_layer(x + random_x, y + random_y, "Instances", crafted_item);
        }

        // Close the crafting tab
        is_crafting = false;
    }
}

// Navigation and Controls
if (keyboard_check_pressed(vk_enter) || mouse_check_button_pressed(mb_left)) {
	if (is_crafting) {
		craft_item(cursor_position + starter_crafting_index);
	}
}

if (keyboard_check_pressed(vk_down) || mouse_wheel_down()) {
    if (cursor_position < number_of_items - 1 && is_crafting) {
        cursor_position++;
    }
}

if (keyboard_check_pressed(vk_up) || mouse_wheel_up()) {
    if (cursor_position > 0 && is_crafting) {
        cursor_position--;
    }
}
