<template>
  <div>
    <h1>Settings</h1>
    <p class='display-name' v-if="displayName">{{ displayName }}</p>
    <button @click="signOut">Sign Out</button>
  </div>
</template>

<script>
import { computed } from "vue";
import { user, signOut } from "../auth";

export default {
  name: "SettingsComp",
  setup() {
    const displayName = computed(() => user.value?.displayName || "");

    return {
      signOut,
      displayName,
    };
  },
};
</script>

<style scoped>
h1 {
  text-align: center;
}
.display-name {
  text-align: center;

}
button {
  background-color: transparent;
  border: none;
  color: rgb(0, 0, 0);
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 1.4rem;
  transition-duration: 0.3s;
  cursor: pointer;
  padding: 0.5rem 1rem;
  border-radius: 2px;
  margin: 1rem auto;
  display: block;
}

button:hover {
  color: rgb(255, 176, 176);
}
</style>
