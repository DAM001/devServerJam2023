var inventory_width = 12 + (item_inventory_length * 16) * 2;

var position_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - inventory_width / 2;
var position_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 54;

draw_sprite_stretched(
    sInventory,
    0,
	position_x,
    position_y, 
    inventory_width,
    12 + 16 * 2
);

for (var i = 0; i < item_inventory_length; i += 1)
{
    var item_position_x = position_x + i * 16 * 2 + 6;
	var is_highlighted = (i == item_inventory_selected) ? 1 : 0;
	draw_sprite_ext(sSlot, is_highlighted, item_position_x, position_y + 6, 2, 2, 0, c_white, 1);
    
    if (item_inventory[i] != -1 && array_length(item_sprites) > 0)
    {
        var item_sprite_index = item_inventory[i];
        
        if (item_sprite_index >= 0 && item_sprite_index < array_length(item_sprites))
        {
            var sprite = item_sprites[item_sprite_index];
			draw_sprite_ext(sprite, 0, item_position_x + 16, position_y + 22, 2, 2, 0, c_white, 1);
		}
		
		if (item_inventory_items[i] != noone && item_inventory_items[i].usable) {
			instance_activate_object(item_inventory_durability_bar[i]);
			item_inventory_durability_bar[i].set_health(item_inventory_items[i].current_durability, item_inventory_items[i].durability);
			
			item_inventory_durability_bar[i].x = item_position_x + 16;
			item_inventory_durability_bar[i].y = position_y + 37;
		}
    } else {
		instance_deactivate_object(item_inventory_durability_bar[i]);
	}
}