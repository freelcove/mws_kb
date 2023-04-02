<template>
    <div class="mini-store">
        <!-- Store Items -->
        <h1>Mini Store</h1>
        <div class="store-items">
            <div v-for="(item, index) in items" :key="index" class="store-item">
                <img :src="item.image" :alt="item.name" class="item-image" />
                <h3>{{ item.name }}</h3>
                <p class="item-description">{{ item.description }}</p>
                <p class="item-price">{{ formatMoney(item.price) }}</p>
                <p class="item-stock" :class="{ 'out-of-stock': item.stock === 0 }">{{ item.stock === 0 ? 'Out of Stock' :
                    `Stock: ${item.stock}` }}</p>
                <button @click="addToCart(index)" :disabled="item.stock === 0">Add to Cart</button>
            </div>
        </div>

        <!-- Cart -->
        <div class="cart">
            <h2>Cart</h2>
            <p>Balance: {{ formatMoney(money) }}</p>
            <ul>
                <li v-for="(item, index) in cart" :key="index">
                    {{ item.name }} x{{ item.quantity }}
                    <button @click="removeFromCart(index)">Remove</button>
                </li>
            </ul>
            <p>Total: {{ formatMoney(cartTotal) }}</p>
            <button @click="checkout" :disabled="!cart.length">Checkout</button>
        </div>

        <!-- Add Item Modal -->
        <button v-if="isAdmin" @click="showAddItemModal = true">Add New Item</button>
        <div v-if="showAddItemModal">
            <h2>Add New Item</h2>
            <label>Name: <input v-model="newItem.name" /></label>
            <label>Description: <input v-model="newItem.description" /></label>
            <label>Price: <input v-model.number="newItem.price" /></label>
            <label>Stock: <input v-model.number="newItem.stock" /></label>
            <label>Image Path: <input v-model="newItem.imagePath" /></label>
            <button @click="addItem">Add Item</button>
            <button @click="showAddItemModal = false">Close</button>
        </div>
    </div>
</template>
  
<script>
import { ref as vueRef, onMounted, computed, reactive } from "vue";
import { getDownloadURL, ref as storageRef } from "firebase/storage";
import {
    inventory,
    saveInventoryToDatabase,
    saveMoneyToDatabase,
    transferMoneyToUser,
    saveOrder,
} from "@/auth";
import { useMoneyStore } from "@/stores/moneyStore";
import { storage } from "@/firebase";
import { getFirestore, doc, getDoc, updateDoc } from "firebase/firestore";
import { auth } from "@/firebase";



export default {
    setup() {
        const { money } = useMoneyStore();
        const items = reactive([
        ]);

        const getImageUrl = async (path) => {
            const ref = storageRef(storage, path);
            return await getDownloadURL(ref);
        }

        const db = getFirestore();
        const storeRef = doc(db, "stores", "MiniStore");
        const showAddItemModal = vueRef(false);
        const isAdmin = vueRef(false);
        const cart = vueRef([]);
        const newItem = reactive({
            name: "",
            description: "",
            price: 0,
            imagePath: "components/MiniStore/img/",
            stock: 0,
        });

        const loadItemsFromFirestore = async () => {
            const storeSnapshot = await getDoc(storeRef);
            if (storeSnapshot.exists()) {
                const data = storeSnapshot.data();
                for (const item of data.items) {
                    items.push(item);
                }
            }
        };



        onMounted(() => {
            const user = auth.currentUser;
            if (user && user.uid === "auWPVB7abbcbtSPOyVTtReBGsHb2") {
                isAdmin.value = true;
            }
        });
        const addItem = async () => {
            newItem.image = await getImageUrl(newItem.imagePath);
            items.push(newItem);
            const updatedItems = items.map(item => {
                return {
                    ...item,
                    image: item.image
                };
            });
            await updateDoc(storeRef, { items: updatedItems });
            alert("Item added!");
            showAddItemModal.value = false;
        };

        onMounted(async () => {
            await loadItemsFromFirestore();
        });

        const addToInventory = (item, quantity) => {
            const existingItem = inventory.value.find(
                (invItem) => invItem.name === item.name
            );

            if (existingItem) {
                existingItem.quantity += quantity;
            } else {
                inventory.value.push({ ...item, quantity });
            }
        };

        const addToCart = (index) => {
            const itemInCart = cart.value.find(
                (cartItem) => cartItem.name === items[index].name
            );

            if (itemInCart) {
                if (itemInCart.quantity < items[index].stock) {
                    itemInCart.quantity++;
                } else {
                    alert("You cannot add more of this item, it has reached the available stock limit.");
                }
            } else {
                cart.value.push({ ...items[index], quantity: 1 });
            }
        };

        const removeFromCart = (index) => {
            if (cart.value[index]) {
                cart.value[index].quantity--;
            }

            if (cart.value[index].quantity === 0) {
                cart.value.splice(index, 1);
            }
        };
        const storeOwnerId = "auWPVB7abbcbtSPOyVTtReBGsHb2";

        const transferMoneyToStoreOwner = async (amount) => {
            const currentUser = auth.currentUser;
            if (!currentUser) {
                console.error("User not signed in");
                return;
            }

            try {
                await transferMoneyToUser(currentUser.uid, storeOwnerId, amount);
            } catch (error) {
                console.error("Failed to transfer money to store owner", error);
            }
        };

        const checkout = async () => {
            if (cartTotal.value > money.value) {
                alert("You don't have enough money to complete this purchase.");
                return;
            }

            if (Object.keys(cart.value).length === 0) {
                alert("Your cart is empty. Add some items before checking out.");
                return;
            }

            for (const item of cart.value) {
                addToInventory(item, item.quantity);

                // Decrease stock
                const itemIndex = items.findIndex((i) => i.name === item.name);
                if (itemIndex !== -1) {
                    items[itemIndex].stock -= item.quantity;

                    // Update the stock in the database
                    const updatedItems = items.map((i) => {
                        return {
                            ...i,
                            image: i.image
                        };
                    });
                    updateDoc(storeRef, { items: updatedItems });
                }
                // Save the order
                const orderData = {
                    id: `${item.name}-${Date.now()}`,
                    date: new Date(),
                    store_id: "MiniStore",
                    customer_id: auth.currentUser.uid,
                    customer_displayname: auth.currentUser.displayName,
                    item_id: item.name,
                    quantity: item.quantity,
                    price: item.price,
                    totalprice: item.price * item.quantity,
                };

                try {
                    await saveOrder(orderData);
                } catch (error) {
                    console.error("Error saving order:", error);
                }

            }

            saveInventoryToDatabase();
            saveMoneyToDatabase();
            transferMoneyToStoreOwner(cartTotal.value);
            cart.value.splice(0);
            alert("Purchase successful!");
        };


        const cartTotal = computed(() => {
            return cart.value.reduce((acc, item) => acc + item.price * item.quantity, 0);
        });

        const formatMoney = (amount) => {
            return `$${amount.toLocaleString(undefined, {
                minimumFractionDigits: 0,
                maximumFractionDigits: 0,
            })}`;
        };

        return {
            items,
            cart,
            addToCart,
            removeFromCart,
            checkout,
            cartTotal,
            formatMoney,
            showAddItemModal,
            isAdmin,
            newItem,
            addItem,
            money,

        };
    },
};
</script>

<style scoped>
button {
    background-color: transparent;
    border: none;
    color: rgb(0 0, 0);
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 1.4rem;
    transition-duration: 0.3s;
    cursor: pointer;
    padding: 0.5rem 1rem;
    border-radius: 2px;
}

button:hover {
    color: rgb(255, 176, 176);
}

.mini-store {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.store-items {
    display: flex;
    gap: 1rem;
    flex-wrap: wrap;
}

.store-item {
    display: flex;
    flex-direction: column;
    text-align: center;
    gap: 0.5rem;
    border: 1px solid #ccc;
    padding: 1rem;
    width: 300px;
    height: 600px;
    overflow: hidden;
}

.item-description {
    padding-right: 0.5rem;
}

.item-image {
    width: 300px;
    height: 300px;
}

.cart {
    width: 300px;
    border: 1px solid #ccc;
    padding: 1rem;
}

.cart button[disabled] {
    opacity: 0.5;
    cursor: not-allowed;
}

.out-of-stock {
    color: red;
}
</style>