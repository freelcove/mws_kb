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
  apiKey: "AIzaSyAFBTmazyqFI8e1gg-L0-A4sucJZjaUeYE",
  authDomain: "mws-kb.firebaseapp.com",
  projectId: "mws-kb",
  storageBucket: "mws-kb.appspot.com",
  messagingSenderId: "918442026729",
  appId: "1:918442026729:web:a6b5e571383c83f6d87278",
  measurementId: "G-XY6M0C21HF"
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