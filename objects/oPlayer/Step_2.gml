// ---------- EQUIP ITEMS INDICATOR ----------
with (oItem) {
    var distance = point_distance(other.x, other.y, x, y);
    
    if (oPlayer.near_item == noone || distance < oPlayer.near_item_distance) {
		if (!equipped && distance < item_inventory_pickup_range) {
			oPlayer.near_item_distance = distance;
			oPlayer.near_item = id;
		}	
    }
}

// show the pickup indicator
if (pickup_indicator != noone && near_item != noone) {
	pickup_indicator.indicator_position(near_item.x, near_item.y - 16);
	pickup_indicator.show_indicator();
} else {
	pickup_indicator.hide_indicator();
}

near_item = noone;
near_item_distance = 1000;