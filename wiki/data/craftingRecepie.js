class CraftingRecipe extends HTMLElement {
    connectedCallback() {
        const result = this.getAttribute('result');
        const index = this.getAttribute('index');

        // Create the result item element with the "block-list-first" class
        const resultItem = document.createElement('item-link');
        resultItem.setAttribute('imageSource', result);
        resultItem.classList.add('block-list-first');

        // Create the index display element
        if (index) {
            const indexElement = document.createElement('span');
            indexElement.textContent = `${index} | `;
            resultItem.appendChild(indexElement);
        }

        this.appendChild(resultItem);

        // Create a div for all items
        const itemsDiv = document.createElement('div');
        itemsDiv.className = 'block-list-items';
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