ovar position_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2;
var position_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) / 2;

var width = 300;
var height = 500;

var number_of_items = 0;

if (is_crafting) {
	// background
	draw_sprite_stretched(
	    sInventory,
	    0,
	    position_x - width / 2,
	    position_y - height / 2,
	    width,
	    height
	);
	
	// cursor
	var cursor_position_x = position_x - (width / 2) + 24;
	var cursor_position_y = position_y - (height / 2) + 30 + cursor_position * (32 + 6);
	draw_sprite_ext(sIndicatorArrow, 0, cursor_position_x, cursor_position_y, 2, 2, 0, c_white, 1);
	
	// craftings
	for (var i = 0; i < array_length(item_crafting_recepies); i += 1) {
		if (item_crafting_recepies[i][0][1] == crafting_level) {
			number_of_items++;
			
			// draw item
			var item_sprite = item_sprites[item_crafting_recepies[i][0][0]];
			var item_position_x = position_x - (width / 2) + 60;
			var item_position_y = position_y - (height / 2) + 30 + i * (32 + 12);
			var item_scale = 4;
			draw_sprite_ext(item_sprite, 0, item_position_x, item_position_y, item_scale, item_scale, 0, c_white, 1);
		
			// draw resources
			var resource_count = 0;
			for (var j = 1; j < array_length(item_crafting_recepies[i]); j += 1) {
				for (var k = 0; k < item_crafting_recepies[i][j][1]; k += 1) {
					resource_count++;
					
					var resource_sprite = item_sprites[item_crafting_recepies[i][j][0]];
					var resource_item_position_x = (position_x - (width / 2) + 60) + resource_count * (16 + 8) + 32;
					
					draw_sprite_ext(resource_sprite, 0, resource_item_position_x, item_position_y + 6, 2, 2, 0, c_white, 1);
				}
			}
			
			// draw decor line
			//draw_sprite_stretched(sInventory, 0, item_position_x - 20, item_position_y + 20, width - 80, 4);
		}
	}
}

// ---------- CRAFT ITEM ----------
craft_item = function(craft_item_index = -1) {
	var list_of_items = [];
	var number_of_items_have = 0;
	for (var i = 1; i < array_length(item_crafting_recepies[craft_item_index]); i += 1) {
		for (var j = 0; j < item_crafting_recepies[craft_item_index][i][1]; j += 1) {
			list_of_items[array_length(list_of_items)] = item_crafting_recepies[craft_item_index][i][0];
		}
	}
	
	// check if player has all the items
	for (var i = 0; i < array_length(list_of_items); i += 1) {
		for (var j = 0; j < item_inventory_length; j += 1) {
			if (item_inventory[j] >= 0) {
				var item_index = item_inventory[j];
				if (item_index == list_of_items[i]) { 
					number_of_items_have++;
				}
			}
		}
	}
	
	// check if the item is craftable
	if (number_of_items_have == array_length(list_of_items)) {
		//remove items from the inventory
		for (var i = 0; i < array_length(list_of_items); i += 1) {
			for (var j = 0; j < item_inventory_length; j += 1) {
				if (item_inventory[j] >= 0) {
					var item_index = item_inventory[j];
					if (item_index == list_of_items[i]) { 
						item_inventory[j] = -1;
						
						// check the currently in hand item, if its in the craft then destroy it
						if (j == item_inventory_selected) {
							instance_destroy(item_inventory_active);	
						}
					}
				}
			}
		}
	
		// create item
		var player = instance_nearest(x, y, oPlayer);
		if (instance_exists(player)) {
			var crafted_item = item_objects[item_crafting_recepies[craft_item_index][0][0]];
			var random_x = irandom(20) - 10;
			var random_y = irandom(20) - 10;
			instance_create_layer(player.x + random_x, player.y + random_y, 0, crafted_item);
		}
		
		//close the crafting tab
		is_crafting = false;
	}
}
// ---------- NAVIGATION ----------

if (keyboard_check_pressed(vk_enter)) {
	craft_item(cursor_position);
}

if (keyboard_check_pressed(vk_down)) {
	if (cursor_position < number_of_items - 1) {
		cursor_position++;
	}
}

if (keyboard_check_pressed(vk_up)) {
	if (cursor_position > 0) {
		cursor_position--;
	}
}