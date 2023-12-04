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
    var xx = position_x + i * 16 * 2 + 6;
	var is_highlighted = (i == item_inventory_selected) ? 1 : 0;
	draw_sprite_ext(sSlot, is_highlighted, xx, position_y + 6, 2, 2, 0, c_white, 1);
    
    if (item_inventory[i] != -1 && array_length(item_sprites) > 0)
    {
        var spriteIndex = item_inventory[i];
        
        // Make sure spriteIndex is a valid index before attempting to access the array
        if (spriteIndex >= 0 && spriteIndex < array_length(item_sprites))
        {
            var sprite = item_sprites[spriteIndex];
			draw_sprite_ext(sprite, 0, xx + 16, position_y + 22, 2, 2, 0, c_white, 1);
		}
    }
}