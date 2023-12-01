function createItemBlock(item) {
    const name = convertImageToName(item.imagePath);
    item.imagePath = convertImagePath(item.imagePath);

    const header = document.createElement("div");
    header.className = "block-header-2";
    header.textContent = item.index + " | " + name;
    header.id = name;

    const itemFolder = document.createElement("div");
    itemFolder.className = "item-folder";

    // Create and append image to the item folder
    const itemImage = createItemImage(item.imagePath);
    const imageElement = document.createElement("div");
    imageElement.className = "block-image";
    imageElement.appendChild(itemImage);

    // Create and append description element
    if (item.description) {
        const descriptionElement = createItemElement("div", "item-element", "Description:", item.description);
        itemFolder.appendChild(descriptionElement);
    }

    // Create and append how to get element
    if (item.howToGet) {
        const howToGetElement = createItemElement("div", "item-element", "How to get:", item.howToGet);
        itemFolder.appendChild(howToGetElement);
    }

    // Create and append crafting element
    if (item.crafting) {
        const craftingElement = createItemElement("div", "item-element", "Crafting:");
        itemFolder.appendChild(craftingElement);

        // Append crafting data to the crafting element
        item.crafting.forEach((craftingData, index) => {
            // Create a new item-link element for each crafting item
            const itemLink = document.createElement('item-link');
            itemLink.setAttribute('imageSource', craftingData[0]);
            craftingElement.appendChild(itemLink);

            if (index === 0) {
                const colon = document.createTextNode(': ');
                craftingElement.appendChild(colon);
            } else {
                const quantityTextNode = document.createTextNode(` ${craftingData[1]}x`);
                craftingElement.appendChild(quantityTextNode);

                if (index < item.crafting.length - 1) {
                    const comma = document.createTextNode(', ');
                    craftingElement.appendChild(comma);
                }
            }
        });
    }


    // Create and append resource element
    if (item.resource) {
        const resourceElement = createItemElement("div", "item-element", "Resource:");
        itemFolder.appendChild(resourceElement);

        // Append item links to the stats element
        item.resource.forEach((element, index) => {
            const itemLink = document.createElement('item-link');
            itemLink.setAttribute('imageSource', element);

            resourceElement.appendChild(itemLink);

            // Add a comma after each itemLink except the last one
            if (index < item.resource.length - 1) {
                const comma = document.createTextNode(', ');
                resourceElement.appendChild(comma);
            }
        });
    }

    // Create and append stat element
    if (item.stats) {
        const statsElement = createItemElement("div", "item-element", "Stats:");

        // Iterate through each element in item.stats
        item.stats.forEach(stat => {
            // Create a new div for each stat and append it to the statsElement
            const statDiv = document.createElement("div");
            statDiv.textContent = stat;
            statsElement.appendChild(statDiv);
        });

        itemFolder.appendChild(statsElement);
    }

    // Append to the specific container by ID
    const container = document.getElementById(item.containerId);
    if (container) {
        container.appendChild(header);
        container.appendChild(imageElement);
        container.appendChild(itemFolder);
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

let isContentVisible = true;

function toggleContent() {
    isContentVisible = !isContentVisible;

    const contentTable = document.getElementById("table-of-content");
    contentTable.style.display = isContentVisible ? "block" : "none";
}