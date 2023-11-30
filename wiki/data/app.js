window.onload = function() {
    const items = [{
            containerId: "tools",
            index: 0,
            name: "Wood Ax",
            imagePath: "source/sItem.png",
            description: "An item made for gathering wood resources efficiently",
            stats: [" Durability: 40", " Enemy damage: 1", " Mining damage: 1", " Tree damage: 2"],
            howToGet: ["Place: Crafting Table", " Resources: 1x Stick and 2x Wood"]
        },
        {
            containerId: "tools",
            index: 1,
            name: "Wood Sword",
            imagePath: "source/sItem.png",
            description: "A tool for mining stones and ores",
            stats: [" Durability: 40", " Enemy damage: 2", " Mining damage: 1", " Tree damage: 1"],
            howToGet: ["Place: Crafting Table", " Resources: 3x Stone and 2x Stick"]
        }
        // Add more items as needed
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
    const statsElement = createItemElement("div", "item-element", "Stats:", item.stats);
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