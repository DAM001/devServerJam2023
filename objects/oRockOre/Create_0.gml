/// @description Drop and health settings
event_inherited();

randomize();
rock_type = 0;
rock_type += irandom(2);
set_max_health(20);

create_drop = function() {
	if (irandom(3) < 3) {
		instance_create_layer(x, y, 0, oRock);
	}
	
	// spawn ores based on type
	if (rock_type == 0) {
		create_object(oCoal);
	} else if (rock_type == 1) {
		create_object(oCopperOre);
	} else if (rock_type == 2) {
		create_object(oIronOre);
	}
}

// visuals
image_xscale = 2;
image_yscale = 2;
image_speed = 0;
image_index = rock_type;
depth = -y;