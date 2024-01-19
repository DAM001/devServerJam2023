/// @description Movement

//movement
x = lerp(x, oPlayer.x + x_offset, move_speed);
y = lerp(y, oPlayer.y + y_offset, move_speed);

//facing
var target_x = oPlayer.x + x_offset;
var target_y = oPlayer.y + y_offset;
var angle  = point_direction(x, y, target_x, target_y);
angle = (angle + 360) % 360;

if (angle < 45 || angle >= 315) {
	sprite_index = sCompanionRight;
    direction = 0;
} else if (angle >= 45 && angle < 135) {
	sprite_index = sCompanionUp;
    direction = 2;
} else if (angle >= 135 && angle < 225) {
	sprite_index = sCompanionLeft;
    direction = 1;
} else {
	sprite_index = sCompanionDown;
    direction = 3;
}