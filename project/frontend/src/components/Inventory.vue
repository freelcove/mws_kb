<template>
    <div class="inventory">
        <h2>Inventory</h2>
        <p>Money: {{ formatMoney(money) }}</p>
        <draggable v-model="inventory" tag="ul">
            <template #item="{ element, index }">
                <li class="inventory-item" :key="index">
                    <img :src="element.image" :alt="element.name" class="inventory-item-image" />
                    {{ element.name }} x{{ element.quantity }}
                </li>
            </template>
        </draggable>
    </div>
</template>
  
<script>
import { money } from "../auth";
import { inventory } from "../auth";
import draggable from "vuedraggable";

export default {
    name: "InventoryComp",
    components: {
        draggable,
    },
    setup() {
        return {
            inventory,
        };
    },
    computed: {
        money() {
            return money.value;
        },
    },
    methods: {
        formatMoney(amount) {
            return `$${amount.toLocaleString(undefined, { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`;
        },
    },
};
</script>
  
<style scoped>
.inventory {
    padding: 1rem;
    display: flex;
    flex-direction: column;
    align-items: center;
}

h2 {
    text-align: center;
    margin-bottom: 1rem;
}

p {
    font-size: 1.4rem;
    margin-bottom: 1rem;
}

.inventory-item {
    cursor: move;
    display: flex;
    align-items: center;
    margin: 8px;
    width: 200px;
}

.inventory-item-image {
    width: 50px;
    height: 50px;
    margin-right: 1rem;
}
</style>
  