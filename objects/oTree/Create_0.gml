tree_max_health = 10;
tree_health = tree_max_health;

tree_damage = function(damage_amount = 0) {	
    tree_health -= damage_amount;
	health_bar.set_health(tree_health, tree_max_health);
	
	if (tree_health <= 0) {
		tree_destroy();
	}
	
	effect_create_above(ef_spark, x, y, 20, c_white);
}

tree_destroy = function() {
	//create wood when destroyed
	instance_create_layer(x, y, 0, oWood);
	
	var number_of_sticks = irandom(1);
	for (var i = 0; i < number_of_sticks; ++i;) {
		var random_x = irandom(20) - 10;
		var random_y = irandom(20) - 10;
		instance_create_layer(x + random_x, y + random_y, 0, oStick);
    }
	
	
	//destroy related objects
	instance_destroy(health_bar);
	instance_destroy(self);
}

// create healthbar
health_bar = instance_create_layer(x, y, 0, oHealthBar);

alarm[0] = 0.05 * room_speed;