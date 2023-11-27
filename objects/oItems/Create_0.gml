// Item Definitions
#macro item_none 0
#macro item_stick 1
#macro item_rock 2
#macro item_wood 3

// Other
globalvar item_objects;
item_objects = [];
item_objects[0] = -1;

globalvar item_sprites; 
item_sprites = [];

item_sprites[0] = sItem;
item_sprites[1] = sStick;
item_sprites[2] = sRock;
item_sprites[3] = sWood;

alarm[0] = 0.1 * room_speed;