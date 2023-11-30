// Item Definitions
#macro item_none 0
#macro item_stick 1
#macro item_rock 2
#macro item_wood 3
#macro item_grass 4
#macro item_raw_meat 5
#macro item_meat 6
#macro item_string 7
#macro item_coal 8
#macro item_copper_ore 9
#macro item_copper_bar 10
#macro item_iron_ore 11
#macro item_iron_bar 12
#macro item_torch 13
#macro item_campfire 14
#macro item_crafting_table 15
#macro item_furnace 16
#macro item_copper_anvil 17
#macro item_iron_anvil 18
#macro item_arrow 19
#macro item_bow 20
#macro item_crossbow 21
#macro item_wood_pickaxe 22
#macro item_stone_pickaxe 23
#macro item_copper_pickaxe 24
#macro item_iron_pickaxe 25
#macro item_wood_ax 26
#macro item_stone_ax 27
#macro item_copper_ax 28
#macro item_iron_ax 29
#macro item_wood_sword 30
#macro item_stone_sword 31
#macro item_copper_sword 32
#macro item_iron_sword 33

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
item_sprites[4] = sGrass;
item_sprites[5] = sRawMeat;
item_sprites[6] = sMeat;
item_sprites[7] = sString;
item_sprites[8] = sCoal;
item_sprites[9] = sCopperOre;
item_sprites[10] = sCopperBar;
item_sprites[11] = sIronOre;
item_sprites[12] = sIronBar;
item_sprites[13] = sTorch;
item_sprites[14] = sCampfire;
item_sprites[15] = sCraftingTable;
item_sprites[16] = sFurnace;
item_sprites[17] = sCopperAnvil;
item_sprites[18] = sIronAnvil;
item_sprites[19] = sArrow;
item_sprites[20] = sBow;
item_sprites[21] = sCrossbow;
item_sprites[22] = sWoodPickaxe;
item_sprites[23] = sStonePickaxe;
item_sprites[24] = sCopperPickaxe;
item_sprites[25] = sIronPickaxe;
item_sprites[26] = sWoodAx;
item_sprites[27] = sStoneAx;
item_sprites[28] = sCopperAx;
item_sprites[29] = sIronAx;
item_sprites[30] = sWoodSword;
item_sprites[31] = sStoneSword;
item_sprites[32] = sCopperSword;
item_sprites[33] = sIronSword;

//alarm[0] = 0.1 * room_speed;