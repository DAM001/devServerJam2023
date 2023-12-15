/// @description Health system

max_health = 10;
current_health = max_health;

// create healthbar
health_bar = instance_create_layer(x, y, 0, oHealthBar);
alarm[0] = 0.05 * room_speed;

set_max_health = function(max_health_value){
	max_health = max_health_value;
	current_health = max_health;
}

// damage logic
damage = function(damage_amount = 0) {	
    current_health -= damage_amount;
	health_bar.set_health(current_health, max_health);
	health_bar.set_color(make_color_rgb(255, 0, 0));
	
	if (current_health <= 0) {
		destroy();
	}
	
	effect_create_above(ef_spark, x, y, 20, c_white);
}

destroy = function() {
	create_drop();
	
	var effect = effect_create_above(ef_ring, x, y, 0.01, c_white);
	
	//destroy related objects
	instance_destroy(health_bar);
	instance_destroy(self);
}

// overrride this function to make resource drop
create_drop = function() {
	// drop items code here
}

create_object = function(resource_object = noone) {
	var random_x = x + irandom(20) - 10;
	var random_y = y + irandom(20) - 10;
	instance_create_layer(random_x, random_y, 0, resource_object);
}

// visuals
image_xscale = 2;
image_yscale = 2;