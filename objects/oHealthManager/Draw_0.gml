var heart_widht = 9;
var folder_width = 12 + (player_max_health * heart_widht) * 2;
var inventory_width = 12 + (item_inventory_length * 16) * 2;
var x_offset = inventory_width / 2 - folder_width / 2 + 6;

var position_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2 - folder_width / 2 - x_offset;
var position_y = camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 80;

get_highlighted_heart_anim = function(index = 0) {
	var anim_index = (index < player_current_health) ? 2 : 3;
	
	if (index == highlighted_heart_anim_index) {
		anim_index = (index < player_current_health) ? 0 : 1;
	}
	
	return anim_index;
}

for (var i = 0; i < player_max_health; i += 1)
{
    var item_position_x = position_x + i * heart_widht * 2 + 6;
	var has_health = get_highlighted_heart_anim(i);
	draw_sprite_ext(sHeart, has_health, item_position_x, position_y + 6, 2, 2, 0, c_white, 1);
}