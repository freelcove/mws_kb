import {
  initializeApp
} from "firebase/app";
import {
  getAuth
} from "firebase/auth";
import {
  getFirestore
} from "firebase/firestore";
import {
  getStorage
} from "firebase/storage";

//import { collection, getDocs, updateDoc, doc } from "firebase/firestore";

const firebaseConfig = {

};

const app = initializeApp(firebaseConfig);
const auth = getAuth();
const db = getFirestore();
const storage = getStorage();

export {
  app,
  auth,
  db,
  storage
};



/*
  const addInventoryFieldToUsers = async () => {
    const usersRef = collection(db, "users");
    const usersSnapshot = await getDocs(usersRef);
  
    usersSnapshot.forEach(async (userDoc) => {
      const userData = userDoc.data();
  
      // Check if the user document already has an inventory field
      if (!("inventory" in userData)) {
        const userDocRef = doc(db, "users", userDoc.id);
        await updateDoc(userDocRef, { inventory: [] });
        console.log(`Added inventory field to user ${userDoc.id}`);
      }
    });
  };
  
  addInventoryFieldToUsers();
  */