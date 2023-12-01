var inventory_width = 12 + (item_inventory_length * 16) * 2;

draw_sprite_stretched(
    sInventory,
    0,
    640 - inventory_width / 2,
    y - 6,
    inventory_width,
    12 + 16 * 2
);

for (var i = 0; i < item_inventory_length; i += 1)
{
    var xx = x + i * 16 * 2 - inventory_width / 4 + 2;
	var is_highlighted = (i == item_inventory_selected) ? 1 : 0;
	draw_sprite_ext(sSlot, is_highlighted, xx, y, 2, 2, 0, c_white, 1);
    
    if (item_inventory[i] != -1 && array_length(item_sprites) > 0)
    {
        var spriteIndex = item_inventory[i];
        
        // Make sure spriteIndex is a valid index before attempting to access the array
        if (spriteIndex >= 0 && spriteIndex < array_length(item_sprites))
        {
            var sprite = item_sprites[spriteIndex];
			draw_sprite_ext(sprite, 0, xx + 16, y + 16, 2, 2, 0, c_white, 1);
		}
    }
}