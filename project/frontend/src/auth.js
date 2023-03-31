import {
  ref,
  computed
} from "vue";
import {
  auth,
  db
} from "./firebase";
import {
  doc,
  setDoc,
  getDoc,
  updateDoc
} from "firebase/firestore";
import {
  GoogleAuthProvider,
  onAuthStateChanged,
  signInWithPopup,
  signOut as firebaseSignOut
} from "firebase/auth";
import {
  useMoneyStore
} from "./stores/moneyStore";
import {
  onSnapshot,
  Timestamp
} from "firebase/firestore";

const user = ref(null);
const moneyStore = useMoneyStore();
const money = computed(() => moneyStore.money.value);
const inventory = ref([]);


onAuthStateChanged(auth, (currentUser) => {
  user.value = currentUser;
  if (currentUser) {
    const userDocRef = doc(db, "users", currentUser.uid);

    const unsubscribe = onSnapshot(userDocRef, (userDocSnapshot) => {
      if (userDocSnapshot.exists()) {
        const userData = userDocSnapshot.data();
        moneyStore.money.value = userData.money;
        inventory.value = userData.inventory || [];
      } else {
        setDoc(userDocRef, {
          id: currentUser.uid,
          displayName: currentUser.displayName,
          email: currentUser.email,
          money: 0,
        });
        moneyStore.money.value = 0;
      }
    });

    return () => {
      unsubscribe();
    };
  } else {
    money.value = 0;
  }
});

const signInWithGoogle = async () => {
  const provider = new GoogleAuthProvider();
  try {
    await signInWithPopup(auth, provider);
  } catch (error) {
    console.error("Sign in error", error);
  }
};

const saveMoneyToDatabase = async () => {
  if (auth.currentUser && moneyStore.money.value !== null) {
    const userDocRef = doc(db, "users", auth.currentUser.uid);
    await updateDoc(userDocRef, {
      money: moneyStore.money.value
    });
  }
};

const saveInventoryToDatabase = async () => {
  if (auth.currentUser && inventory.value !== null) {
    const userDocRef = doc(db, "users", auth.currentUser.uid);
    await updateDoc(userDocRef, {
      inventory: inventory.value
    });
  }
};

const signOut = async () => {
  try {
    await saveMoneyToDatabase(); // Save money value before signing out
    await firebaseSignOut(auth);
  } catch (error) {
    console.error("Sign out error", error);
  }
};

const transferMoneyToUser = async (senderUserId, recipientUserId, amount) => {
  const senderUserDocRef = doc(db, "users", senderUserId);
  const recipientUserDocRef = doc(db, "users", recipientUserId);

  const senderUserDocSnapshot = await getDoc(senderUserDocRef);
  const recipientUserDocSnapshot = await getDoc(recipientUserDocRef);

  if (!senderUserDocSnapshot.exists()) {
    console.error("Sender user not found");
    throw new Error("Sender user not found");
  }

  if (!recipientUserDocSnapshot.exists()) {
    console.error("Recipient user not found");
    throw new Error("Recipient user not found");
  }

  const senderUserData = senderUserDocSnapshot.data();
  const recipientUserData = recipientUserDocSnapshot.data();

  if (senderUserData.money < amount) {
    console.error("Sender does not have enough money");
    throw new Error("Sender does not have enough money");
  }

  await updateDoc(senderUserDocRef, {
    money: senderUserData.money - amount
  });

  await updateDoc(recipientUserDocRef, {
    money: recipientUserData.money + amount
  });
};

const saveOrder = async (orderData) => {
  if (!auth.currentUser) {
    console.error("User not authenticated");
    throw new Error("User not authenticated");
  }

  const orderId = orderData.id;
  const date = Timestamp.fromDate(new Date(orderData.date));
  const storeId = orderData.store_id;
  const customerId = auth.currentUser.uid;
  const customerDisplayName = auth.currentUser.displayName;
  const itemId = orderData.item_id;
  const quantity = orderData.quantity;
  const price = orderData.price;
  const totalPrice = orderData.totalprice;

  const orderDocRef = doc(db, "orders", orderId);

  try {
    await setDoc(orderDocRef, {
      id: orderId,
      date,
      store_id: storeId,
      customer_id: customerId,
      customer_displayname: customerDisplayName,
      item_id: itemId,
      quantity,
      price,
      totalprice: totalPrice,
    });
  } catch (error) {
    console.error("Error saving order:", error);
    throw error;
  }
};

// Call saveMoneyToDatabase every 10 minutes (600000 milliseconds)
//setInterval(saveMoneyToDatabase, 600000);

export {
  user,
  money,
  inventory,
  signInWithGoogle,
  signOut,
  saveInventoryToDatabase,
  saveMoneyToDatabase,
  transferMoneyToUser,
  saveOrder,

};