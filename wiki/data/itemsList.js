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
            resource: ["sStonePickaxe", "sStoneAx", "sStoneSword", "sFurnace"],
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
                ["sFurnace", "0"],
                ["sCoal", "1"],
                ["sMeat", "1"]
            ]
        },
        {
            containerId: "resources",
            index: 7,
            imagePath: "sString",
            description: "Description",
            stats: ["Material for: Bow", " Crossbow"],
            howToGet: ["Kill enemy mobs"]
        },
        {
            containerId: "resources",
            index: 8,
            imagePath: "sCoal",
            description: "Description",
            stats: ["Material for: Torch", " Copper Ore", " Iron Ore", " Meat"],
            howToGet: ["Mine Rock"]
        },
        {
            containerId: "resources",
            index: 9,
            imagePath: "sCopperOre",
            description: "Description",
            stats: ["Material for: Torch", " Copper Ore", " Iron Ore", " Meat"],
            howToGet: ["Mine Rock"]
        },
        {
            containerId: "tools",
            index: 13,
            imagePath: "sTorch",
            description: "Description",
            stats: ["???"],
            howToGet: ["Craft"]
        },
        /*{
            containerId: "tools",
            index: 22,
            name: "Wood Pickaxe",
            imagePath: "source/sWoodPickaxe.png",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 2", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Wood"]
        },
        {
            containerId: "tools",
            index: 23,
            name: "Stone Pickaxe",
            imagePath: "source/sStonePickaxe.png",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 3", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Stone"]
        },
        {
            containerId: "tools",
            index: 24,
            name: "Copper Pickaxe",
            imagePath: "source/sCopperPickaxe.png",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 4", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Copper Bar"]
        },
        {
            containerId: "tools",
            index: 25,
            name: "Iron Pickaxe",
            imagePath: "source/sIronPickaxe.png",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 5", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Iron Bar"]
        },
        {
            containerId: "tools",
            index: 26,
            name: "Wood Ax",
            imagePath: "source/sWoodAx.png",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 2"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Wood"]
        },
        {
            containerId: "tools",
            index: 27,
            name: "Stone Ax",
            imagePath: "source/sStoneAx.png",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 3"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Stone"]
        },
        {
            containerId: "tools",
            index: 28,
            name: "Copper Ax",
            imagePath: "source/sCopperAx.png",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 4"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Copper"]
        },
        {
            containerId: "tools",
            index: 29,
            name: "Iron Ax",
            imagePath: "source/sIronAx.png",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 5"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Iron"]
        },
        {
            containerId: "tools",
            index: 30,
            name: "Wood Sword",
            imagePath: "source/sWoodSword.png",
            description: "A tool for fighting against living creatures",
            stats: [" Durability: 40", " Enemy damage: 2", " Mining damage: 1", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Wood"]
        },
        {
            containerId: "tools",
            index: 31,
            name: "Stone Sword",
            imagePath: "source/sStoneSword.png",
            description: "A tool for fighting against living creatures",
            stats: [" Durability: 40", " Enemy damage: 3", " Mining damage: 1", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Stone"]
        },
        {
            containerId: "tools",
            index: 32,
            name: "Copper Sword",
            imagePath: "source/sCopperSword.png",
            description: "A tool for fighting against living creatures",
            stats: [" Durability: 40", " Enemy damage: 4", " Mining damage: 1", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Copper"]
        },
        {
            containerId: "tools",
            index: 33,
            name: "Iron Sword",
            imagePath: "source/sIronSword.png",
            description: "A tool for fighting against living creatures",
            stats: [" Durability: 40", " Enemy damage: 5", " Mining damage: 1", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Iron"]
        }*/
    ];

    items.forEach(item => createItemBlock(item));
};