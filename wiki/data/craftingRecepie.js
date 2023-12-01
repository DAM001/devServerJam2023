class CraftingRecipe extends HTMLElement {
    connectedCallback() {
        const result = this.getAttribute('result');

        // Create the result item element with the "block-list-first" class
        const resultItem = document.createElement('item-link');
        resultItem.setAttribute('imageSource', result);
        resultItem.classList.add('block-list-first');

        // Create a div for all items
        const itemsDiv = document.createElement('div');
        itemsDiv.className = 'block-list-items';

        // Append the result item element to the custom element
        this.appendChild(resultItem);

        // Append the items div to the custom element
        this.appendChild(itemsDiv);

        // Create and append item elements based on attributes
        let hasItems = false;

        for (let i = 0; i < 10; i++) {
            const itemName = this.getAttribute(`item${i}`);
            const itemQuantity = this.getAttribute(`item${i}-quantity`);

            if (itemName) {
                if (hasItems) {
                    const comma = document.createTextNode(', ');
                    itemsDiv.appendChild(comma);
                }

                const item = document.createElement('item-link');
                item.setAttribute('imageSource', itemName);
                item.setAttribute('quantity', itemQuantity);
                itemsDiv.appendChild(item);

                hasItems = true;
            }
        }
    }
}

customElements.define('crafting-recipe', CraftingRecipe);