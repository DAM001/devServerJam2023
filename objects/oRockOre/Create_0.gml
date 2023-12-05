randomize();
rock_type = 0;
rock_type += irandom(2);

// health
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
	create_object(oRock);
	
	/*if (irandom(1) == 1) {
		instance_create_layer(x, y, 0, oRock);
	}*/
	
	// spawn ores
	if (rock_type == 0) {
		create_object(oCoal);
	} else if (rock_type == 1) {
		create_object(oCopperOre);
	} else if (rock_type == 2) {
		create_object(oIronOre);
	}
	
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

create_object = function(resource_object = noone) {
	var random_x = x + irandom(20) - 10;
	var random_y = y + irandom(20) - 10;
	instance_create_layer(random_x, random_y, 0, resource_object);
}

// create healthbar
health_bar = instance_create_layer(x, y, 0, oHealthBar);

alarm[0] = 0.05 * room_speed;

// scale (2 - 3)
var tree_scale = 2 + irandom(10) / 10;
image_xscale = 2;
image_yscale = 2;
image_speed = 0;
image_index = rock_type;