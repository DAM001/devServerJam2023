if keyboard_check_pressed(vk_tab)
{
	is_crafting = !is_crafting;
	
	if (!is_crafting) {
		cursor_position = 0;
	}
}

