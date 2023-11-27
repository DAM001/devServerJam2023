draw_sprite_stretched(
    sInventory,
    0,
    x - 6,
    y - 6,
    12 + (item_inventory_length * 16) * 2,
    12 + 16 * 2
);

for (var i = 0; i < item_inventory_length; i += 1)
{
    var xx = x + i * 16 * 2;
	draw_sprite_ext(sSlot, 0, xx, y, 2, 2, 0, c_white, 1);
    
    if (item_inventory[i] != -1 && array_length(item_sprites) > 0)
    {
        var spriteIndex = item_inventory[i];
        
        // Make sure spriteIndex is a valid index before attempting to access the array
        if (spriteIndex >= 0 && spriteIndex < array_length(item_sprites))
        {
            var sprite = item_sprites[spriteIndex];
			draw_sprite_ext(sprite, 0, xx + 8, y + 8, 2, 2, 0, c_white, 1);
		}
    }
}