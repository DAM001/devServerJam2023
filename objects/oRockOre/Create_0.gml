rock_max_health = 20;
rock_health = rock_max_health;

damage = function(damage_amount = 0) {	
    rock_health -= damage_amount;
	health_bar.set_health(rock_health, rock_max_health);
	health_bar.set_color(make_color_rgb(255, 0, 0));
	
	if (rock_health <= 0) {
		rock_destroy();
	}
	
	effect_create_above(ef_spark, x, y, 20, c_white);
}

rock_destroy = function() {
	//create wood resource when destroyed
	instance_create_layer(x, y, 0, oRock);
	
	/*var number_of_sticks = irandom(1);
	for (var i = 0; i < number_of_sticks; ++i;) {
		var random_x = irandom(20) - 10;
		var random_y = irandom(20) - 10;
		instance_create_layer(x + random_x, y + random_y, 0, oStick);
    }*/
	
	
	//destroy related objects
	instance_destroy(health_bar);
	instance_destroy(self);
}

// create healthbar
health_bar = instance_create_layer(x, y, 0, oHealthBar);

alarm[0] = 0.05 * room_speed;

// scale (2 - 3)
var tree_scale = 2 + irandom(10) / 10;
image_xscale = 2;
image_yscale = 2;
image_speed = 0;
image_index = 0;