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
globalvar item_sprites; 
item_sprites = [];

item_sprites[item_none] = sItem;
item_sprites[item_stick] = sStick;
item_sprites[item_rock] = sRock;
item_sprites[item_wood] = sWood;
item_sprites[item_grass] = sGrass;
item_sprites[item_raw_meat] = sRawMeat;
item_sprites[item_meat] = sMeat;
item_sprites[item_string] = sString;
item_sprites[item_coal] = sCoal;
item_sprites[item_copper_ore] = sCopperOre;
item_sprites[item_copper_bar] = sCopperBar;
item_sprites[item_iron_ore] = sIronOre;
item_sprites[item_iron_bar] = sIronBar;
item_sprites[item_torch] = sTorch;
item_sprites[item_campfire] = sCampfire;
item_sprites[item_crafting_table] = sCraftingTable;
item_sprites[item_furnace] = sFurnace;
item_sprites[item_copper_anvil] = sCopperAnvil;
item_sprites[item_iron_anvil] = sIronAnvil;
item_sprites[item_arrow] = sArrow;
item_sprites[item_bow] = sBow;
item_sprites[item_crossbow] = sCrossbow;
item_sprites[item_wood_pickaxe] = sWoodPickaxe;
item_sprites[item_stone_pickaxe] = sStonePickaxe;
item_sprites[item_copper_pickaxe] = sCopperPickaxe;
item_sprites[item_iron_pickaxe] = sIronPickaxe;
item_sprites[item_wood_ax] = sWoodAx;
item_sprites[item_stone_ax] = sStoneAx;
item_sprites[item_copper_ax] = sCopperAx;
item_sprites[item_iron_ax] = sIronAx;
item_sprites[item_wood_sword] = sWoodSword;
item_sprites[item_stone_sword] = sStoneSword;
item_sprites[item_copper_sword] = sCopperSword;
item_sprites[item_iron_sword] = sIronSword;

globalvar item_objects; 
item_objects = [];

item_objects[item_none] = oItem;
item_objects[item_stick] = oStick;
item_objects[item_rock] = oRock;
item_objects[item_wood] = oWood;
//item_objects[item_grass] = oGrass;
//item_objects[item_raw_meat] = oRawMeat;
//item_objects[item_meat] = oMeat;
//item_objects[item_string] = oString;
item_objects[item_coal] = oCoal;
//item_objects[item_copper_ore] = oCopperOre;
//item_objects[item_copper_bar] = oCopperBar;
//item_objects[item_iron_ore] = oIronOre;
//item_objects[item_iron_bar] = oIronBar;
item_objects[item_torch] = oTorch;
//item_objects[item_campfire] = oCampfire;
//item_objects[item_crafting_table] = oCraftingTable;
//item_objects[item_furnace] = oFurnace;
//item_objects[item_copper_anvil] = oCopperAnvil;
//item_objects[item_iron_anvil] = oIronAnvil;
//item_objects[item_arrow] = oArrow;
//item_objects[item_bow] = oBow;
//item_objects[item_crossbow] = oCrossbow;
//item_objects[item_wood_pickaxe] = oWoodPickaxe;
//item_objects[item_stone_pickaxe] = oStonePickaxe;
//item_objects[item_copper_pickaxe] = oCopperPickaxe;
//item_objects[item_iron_pickaxe] = oIronPickaxe;
item_objects[item_wood_ax] = oWoodAx;
//item_objects[item_stone_ax] = oStoneAx;
//item_objects[item_copper_ax] = oCopperAx;
//item_objects[item_iron_ax] = oIronAx;
//item_objects[item_wood_sword] = oWoodSword;
//item_objects[item_stone_sword] = oStoneSword;
//item_objects[item_copper_sword] = oCopperSword;
//item_objects[item_iron_sword] = oIronSword;


// CRAFTING RECEPIES
// Example:  [[result, 0], [item_1, 1], [item_2, 1]]
// [result, crafting level], [resource_1, quantity], [resource_2, quantity]...
globalvar item_crafting_recepies;
item_crafting_recepies = [];

item_crafting_recepies[0] = [[item_crafting_table, 0], [item_wood, 4]];
item_crafting_recepies[1] = [[item_torch, 0], [item_stick, 1], [item_coal, 1]];
item_crafting_recepies[2] = [[item_furnace, 1], [item_rock, 4]];

