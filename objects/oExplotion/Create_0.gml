/// @description Create effect

explotion_distance = 1 * grid_size;
alarm[0] = 1 * room_speed;

var distance_from_player = point_distance(x, y, oPlayer.x, oPlayer.y);
if (distance_from_player < explotion_distance) {
	var health_manager = instance_nearest(x, y, oHealthManager);
	health_manager.damage();
}

// visuals
image_xscale = 4;
image_yscale  = 4;

/*var instances = instance_position_list(x, y, oDamageable, false, false);

for (var i = 0; i < ds_list_size(instances); i++) {
    var inst = ds_list_find_value(instances, i);
    var distance = point_distance(x, y, inst.x, inst.y);
    if (distance <= damage_radius) {
        inst.health -= damage_amount;

        if (inst.health <= 0) {
            instance_destroy(inst);
        }
    }
}
ds_list_destroy(instances);*/