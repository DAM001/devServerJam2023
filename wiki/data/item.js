class ItemLink extends HTMLElement {
    constructor() {
        super();
    }

    connectedCallback() {
        const imageSource = this.getAttribute('imageSource');
        const quantity = this.getAttribute('quantity');
        const itemName = convertImageToName(imageSource);

        // Create the quantity display element
        if (quantity) {
            const quantityElement = document.createElement('span');
            quantityElement.textContent = `${quantity}x `;
            this.appendChild(quantityElement);
        }

        // Create the image element
        const imageElement = document.createElement('img');
        imageElement.src = convertImagePath(imageSource);
        imageElement.alt = itemName;
        imageElement.className = 'block-list-image';

        // Create the anchor element
        const anchorElement = document.createElement('a');
        anchorElement.href = `#${itemName}`;
        anchorElement.textContent = itemName;

        // Append the image and anchor elements to the custom element
        this.appendChild(imageElement);
        this.appendChild(anchorElement);
    }
}

function convertImageToName(inputString) {
    // Remove the leading "s" and insert a space before each uppercase letter
    const displayText = inputString.replace(/s/, '').replace(/([A-Z])/g, ' $1');
    return displayText.trim(0); // Remove the space before the first text
}

function convertImagePath(inputString) {
    return "source/" + inputString + ".png";
}
customElements.define('item-link', ItemLink);