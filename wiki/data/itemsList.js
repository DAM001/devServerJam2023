/* EXAMPLE ITEM

{
    containerId: "folderId",
    index: 0,
    imagePath: "sItem",
    description: "Description",
    resource: ["sItem", "sItem"],
    stats: ["Property: 0", "Property: 1"],
    howToGet: "Random happening",
    crafting: ["sFurnace", ["sCoal", "1"], ["sMeat", 1]]
},
*/

window.onload = function() {
    const items = [{
            containerId: "resources",
            index: 0,
            imagePath: "sItem",
            description: "A placeholder item for development only, this should not appear in the game",
            howToGet: "You cant get this item"
        },
        {
            containerId: "resources",
            index: 1,
            imagePath: "sStick",
            description: "A crafting resource, used for most of the tools",
            resource: ["sWoodPickaxe", "sWoodAx", "sWoodSword", "sTorch"],
            howToGet: "Spawns randomly on the ground; Trees drop when chopped 50%",
        },
        {
            containerId: "resources",
            index: 2,
            imagePath: "sRock",
            description: "A crafting resource, mainly used for the stone tools",
            resource: ["sStonePickaxe", "sStoneAx", "sStoneSword", "sFurnace", "sArrow"],
            howToGet: "Spawns randomly on the ground; Stone with ores drops when mined"
        },
        {
            containerId: "resources",
            index: 3,
            imagePath: "sWood",
            description: "A crafting resource, gained from trees",
            resource: ["sWoodPickaxe", "sWoodAx", "sWoodSword", "sCraftingTable"],
            howToGet: "Dropped by trees when chopped"
        },
        {
            containerId: "food-source",
            index: 4,
            imagePath: "sGrass",
            description: "An easily accessable food source",
            stats: ["Hunger: +1"],
            howToGet: "Randomly spawns on the ground"
        },
        {
            containerId: "food-source",
            index: 5,
            imagePath: "sRawMeat",
            description: "Food dropped by living creatures. Can be improved",
            stats: ["Hunger: +2"],
            howToGet: ["Dropped by living creatures after killing them"]
        },
        {
            containerId: "food-source",
            index: 6,
            imagePath: "sMeat",
            description: "Cooked Raw Meat",
            stats: ["Hunger: +5"],
            crafting: [
                ["sFurnace", "2"],
                ["sCoal", "1"],
                ["sRawMeat", "1"]
            ]
        },
        {
            containerId: "resources",
            index: 7,
            imagePath: "sString",
            description: "Description",
            resource: ["sBow", "sCrossbow"],
            howToGet: ["Kill enemy mobs"]
        },
        {
            containerId: "resources",
            index: 8,
            imagePath: "sCoal",
            description: "Description",
            resource: ["sTorch", "sCopperBar", "sIronBar", "sMeat"],
            howToGet: ["Mine Rock"]
        },
        {
            containerId: "resources",
            index: 9,
            imagePath: "sCopperOre",
            description: "Description",
            resource: ["sCopperBar"],
            howToGet: ["Mine Stone with a Stone Pickaxe or better"]
        },
        {
            containerId: "resources",
            index: 10,
            imagePath: "sCopperBar",
            description: "Description",
            resource: ["sCopperAnvil", "sCrossbow", "sCopperPickaxe", "sCopperAx", "sCopperSword"],
            crafting: [
                ["sFurnace", "2"],
                ["sCopperOre", "1"],
                ["sCoal", "1"]
            ]
        },
        {
            containerId: "resources",
            index: 11,
            imagePath: "sIronOre",
            description: "Description",
            resource: ["sIronBar"],
            howToGet: ["Mine Stone with a Copper Pickaxe or better"]
        },
        {
            containerId: "resources",
            index: 12,
            imagePath: "sIronBar",
            description: "Description",
            resource: ["sIronAnvil", "sIronPickaxe", "sIronAx", "sIronSword"],
            crafting: [
                ["sFurnace", "2"],
                ["sIronOre", "1"],
                ["sCoal", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 13,
            imagePath: "sTorch",
            description: "Description",
            crafting: [
                ["sPlayer", "0"],
                ["sCoal", "1"],
                ["sStick", "1"]
            ]
        },
        /*{
            containerId: "tools",
            index: 14,
            imagePath: "sCampfire",
            description: "Description",
            crafting: [
                ["sPlayer", "0"],
                ["sCoal", "1"],
                ["sStick", "1"]
            ]
        },*/
        {
            containerId: "Crafting Table",
            index: 15,
            imagePath: "sCraftingTable",
            description: "Crafting station for making basic tools and more advanced crafting stations",
            crafting: [
                ["sPlayer", "0"],
                ["sWood", "4"]
            ]
        },
        {
            containerId: "Furnace",
            index: 16,
            imagePath: "sFurnace",
            description: "Crafting station for resources witch require heat",
            crafting: [
                ["sCraftingTable", "1"],
                ["sRock", "4"]
            ]
        },
        {
            containerId: "Copper Anvil",
            index: 17,
            imagePath: "sCopperAnvil",
            description: "Crafting station for advanced items made from copper",
            crafting: [
                ["sCraftingTable", "1"],
                ["sCopperBar", "4"]
            ]
        },
        {
            containerId: "Iron Anvil",
            index: 18,
            imagePath: "sIronAnvil",
            description: "Crafting station for advanced items made from iron",
            crafting: [
                ["sCraftingTable", "1"],
                ["sIronBar", "4"]
            ]
        },
        {
            containerId: "resources",
            index: 19,
            imagePath: "sArrow",
            description: "Ammunition for range weapons (Bow, Crossbow)",
            crafting: [
                ["sCraftingTable", "1"],
                ["sRock", "1"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 20,
            imagePath: "sBow",
            description: "Weak range weapon, useful for killing enemies from a distance",
            stats: [" Durability: 40", "Range: 70", " Enemy damage: 4"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sWood", "1"],
                ["sStick", "2"],
                ["sString", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 21,
            imagePath: "sCrossbow",
            description: "Strong range weapon, useful for killing enemies from a distance",
            stats: [" Durability: 40", "Range: 100", " Enemy damage: 7"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sCopperBar", "1"],
                ["sStick", "2"],
                ["sString", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 22,
            imagePath: "sWoodPickaxe",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 2", " Tree damage: 1"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sWood", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 23,
            imagePath: "sStonePickaxe",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 3", " Tree damage: 1"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sRock", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 24,
            imagePath: "sCopperPickaxe",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 4", " Tree damage: 1"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sCopperBar", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 25,
            imagePath: "sIronPickaxe",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 5", " Tree damage: 1"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sIronBar", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 26,
            imagePath: "sWoodAx",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 2"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sWood", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 27,
            imagePath: "sStoneAx",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 3"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sRock", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 28,
            imagePath: "sCopperAx",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 4"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sCopperBar", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 29,
            imagePath: "sIronAx",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 5"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sIronBar", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 30,
            imagePath: "sWoodSword",
            description: "A tool for fighting against living creatures",
            stats: [" Durability: 40", " Enemy damage: 2", " Mining damage: 1", " Tree damage: 1"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sWood", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 31,
            imagePath: "sStoneSword",
            description: "A tool for fighting against living creatures",
            stats: [" Durability: 40", " Enemy damage: 3", " Mining damage: 1", " Tree damage: 1"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sRock", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 32,
            imagePath: "sCopperSword",
            description: "A tool for fighting against living creatures",
            stats: [" Durability: 40", " Enemy damage: 4", " Mining damage: 1", " Tree damage: 1"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sCopperBar", "2"],
                ["sStick", "1"]
            ]
        },
        {
            containerId: "tools",
            index: 33,
            imagePath: "sIronSword",
            description: "A tool for fighting against living creatures",
            stats: [" Durability: 40", " Enemy damage: 5", " Mining damage: 1", " Tree damage: 1"],
            crafting: [
                ["sCraftingTable", "1"],
                ["sIronBar", "2"],
                ["sStick", "1"]
            ]
        }
    ];

    items.forEach(item => createItemBlock(item));
};