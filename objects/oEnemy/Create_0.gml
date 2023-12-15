move_speed = 1;
view_distance = 0;

enemy_max_health = 10;
enemy_health = enemy_max_health;

alarm[0] = 0.1 * room_speed;

// Visuals
image_xscale = 2;
image_yscale = 2;

damage = function(damage_amount = 0) {	
    enemy_health -= damage_amount;
	health_bar.set_health(enemy_health, enemy_max_health);
	health_bar.set_color(make_color_rgb(255, 0, 0));
	
	if (enemy_health <= 0) {
		enemy_destroy();
	}
	
	effect_create_above(ef_spark, x, y, 20, c_white);
}

enemy_destroy = function() {
	//create wood resource when destroyed
	/*instance_create_layer(x, y, 0, oWood);
	
	var number_of_sticks = irandom(1);
	for (var i = 0; i < number_of_sticks; ++i;) {
		var random_x = irandom(20) - 10;
		var random_y = irandom(20) - 10;
		instance_create_layer(x + random_x, y + random_y, 0, oStick);
    }*/
	
	var effect = effect_create_above(ef_ring, x, y, 0.01, c_white);
	
	//destroy related objects
	instance_destroy(health_bar);
	instance_destroy(self);
}

// create healthbar
health_bar = instance_create_layer(x, y, 0, oHealthBar);

alarm[0] = 0.05 * room_speed;
