window.onload = function() {
    const items = [{
            containerId: "resources",
            index: 0,
            name: "Nothing",
            imagePath: "source/sItem.png",
            description: "A placeholder item for development only, this should not appear in the game",
            stats: ["Nothing"],
            howToGet: ["You cant get this item"]
        },
        {
            containerId: "resources",
            index: 1,
            name: "Stick",
            imagePath: "source/sStick.png",
            description: "A crafting resource, used for most of the tools",
            stats: ["Material for: Pickaxe", " Ax", " Sword", " Torch"],
            howToGet: ["Spawns randomly on the ground", " Trees drop when chopped 50%"]
        },
        {
            containerId: "resources",
            index: 2,
            name: "Rock",
            imagePath: "source/sRock.png",
            description: "A crafting resource, mainly used for the stone tools",
            stats: ["Material for: Pickaxe", " Ax", " Sword", " Furnace"],
            howToGet: ["Spawns randomly on the ground", " Stone with ores drops when mined"]
        },
        {
            containerId: "resources",
            index: 3,
            name: "Wood",
            imagePath: "source/sWood.png",
            description: "A crafting resource, gained from trees",
            stats: ["Material for: Pickaxe", " Ax", " Sword", " Crafting Table"],
            howToGet: ["Dropped by trees when chopped"]
        },
        {
            containerId: "food-source",
            index: 4,
            name: "Grass",
            imagePath: "source/sGrass.png",
            description: "An easily accessable food source",
            stats: ["Restores 1 unit of hunger"],
            howToGet: ["Randomly spawns on the ground"]
        },
        {
            containerId: "food-source",
            index: 5,
            name: "Raw Meat",
            imagePath: "source/sRawMeat.png",
            description: "Food dropped by living creatures. Can be improved",
            stats: ["Restores 2 unit of hunger"],
            howToGet: ["Dropped by living creatures after killing them"]
        },
        {
            containerId: "food-source",
            index: 6,
            name: "Meat",
            imagePath: "source/sMeat.png",
            description: "Cooked Raw Meat",
            stats: ["Restores 5 unit of hunger"],
            howToGet: ["Furnace: 1x Raw Meat, 1x Coal"]
        },
        {
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
        },
    ];

    items.forEach(item => createItemBlock(item));
};

function createItemBlock(item) {
    const header = document.createElement("div");
    header.className = "block-header-2";
    header.textContent = item.index + " | " + item.name;

    const itemFolder = document.createElement("div");
    itemFolder.className = "item-folder";

    // Create image element
    const itemImage = createItemImage(item.imagePath);

    // Append image to the item folder
    const imageElement = document.createElement("div");
    imageElement.className = "item-element";
    imageElement.appendChild(itemImage);
    itemFolder.appendChild(imageElement);

    // Create and append description element
    const descriptionElement = createItemElement("div", "item-element", "Description:", item.description);
    itemFolder.appendChild(descriptionElement);

    // Create and append stats element
    const statsElement = createItemElement("div", "item-element", "About:", item.stats);
    itemFolder.appendChild(statsElement);

    // Create and append how to get element
    const howToGetElement = createItemElement("div", "item-element", "How to get:", item.howToGet);
    itemFolder.appendChild(howToGetElement);

    // Append to the specific container by ID
    const container = document.getElementById(item.containerId);
    if (container) {
        container.appendChild(header);
        container.appendChild(itemFolder);
    } else {
        console.error(`Container with ID '${item.containerId}' not found.`);
    }
}

function createItemElement(elementType, elementClass, header, content) {
    const itemElement = document.createElement(elementType);
    itemElement.className = elementClass;

    const itemHeader = document.createElement("div");
    itemHeader.className = "item-header";
    itemHeader.textContent = header;

    const itemDescription = document.createElement("div");
    itemDescription.textContent = content;

    itemElement.appendChild(itemHeader);
    itemElement.appendChild(itemDescription);

    return itemElement;
}

function createItemImage(imagePath) {
    const itemImage = document.createElement("img");
    itemImage.src = imagePath;
    itemImage.alt = "item";
    itemImage.className = "item-image";
    return itemImage;
}