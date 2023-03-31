<template>
  <div id="app">
    <div v-if="!user" class="sign-in-container">
      <img class="title-img" src="@/assets/app_name_small.png" alt="Mini Web Simulator">
      <button class="signin-button" @click="signInWithGoogle">Sign In with Google</button>
    </div>
    <div v-if="user">
      <div id="top-panel">
        <div class="tab-bar">

          <div v-for="(tab, index) in tabs" :key="index" @click="selectTab(index)" class="tab"
            :class="{ active: index === activeTabIndex }">
            <span class="tab-title">{{ tab.title }}</span>
            <button @click.stop="closeTab(index)" class="close-tab-button">
              ✖
            </button>
          </div>
          <button class="new-tab-button" @click="addNewTab" v-if="tabs.length < 4">+</button>
        </div>
        <div class="top-menu">
          <button class="menu-button" @click="goHome"><i class="fas fa-home"></i></button>
          <button class="menu-button" @click="toggleInventory"><i class="fas fa-box-open"></i></button>
          <button class="menu-button" @click="toggleSettings"><i class="fas fa-cog"></i></button>
        </div>
      </div>
      <div id="main-content">

        <keep-alive>
          <component :is="tabs[activeTabIndex].component" @navigate="onNavigate" @open-in-new-tab="onOpenInNewTab">
          </component>
        </keep-alive>
        <div v-if="activeMenu === 'Settings'" class="right-panel">
          <Settings @close="closePanel" />
        </div>
        <div v-if="activeMenu === 'Inventory'" class="right-panel">
          <Inventory @close="closePanel" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import Home from './components/Home/Home.vue';

import MiniStore from "./components/MiniStore/MiniStore.vue";
import MiniTalk from './components/MiniTalk/MiniTalk.vue';

import TextEditor from './components/TextEditor.vue';
import Clicker from './components/Clicker.vue';
import Blackjack from './components/Blackjack.vue';
import NumberBaseball from './components/NumberBaseball.vue';

import Settings from './components/Settings.vue';
import Inventory from './components/Inventory.vue';
import { user, money, signInWithGoogle, signOut } from './auth';
import { ref, onMounted, onUnmounted } from "vue";

export default {
  components: {
    MiniStore,
    TextEditor,
    MiniTalk,
    Clicker,
    Blackjack,
    Home,
    Settings,
    Inventory,
    NumberBaseball,
  },

  setup() {

    const activeMenu = ref('');

    const closePanel = () => {
      activeMenu.value = '';
    };

    const clickOutsidePanel = (event) => {
      if (!event.target.closest(".right-panel") && !event.target.closest(".top-menu button")) {
        closePanel();
      }
    };

    onMounted(() => {
      document.addEventListener("click", clickOutsidePanel);
    });

    onUnmounted(() => {
      document.removeEventListener("click", clickOutsidePanel);
    });

    return {
      user,
      money,
      signInWithGoogle,
      signOut,
      closePanel,
      clickOutsidePanel,
      activeMenu,
    };
  },

  data() {
    return {
      websites: {
        texteditor: { component: TextEditor, title: 'Text Editor', icon: 'fas fa-file-alt' },
        minitalk: { component: MiniTalk, title: 'Mini Talk', icon: 'fas fa-comments' },
        clicker: { component: Clicker, title: 'Clicker', icon: 'fas fa-hand-pointer' },
        blackjack: { component: Blackjack, title: 'Blackjack', icon: 'fas fa-clipboard' },
        ministore: { component: MiniStore, title: 'MiniStore', icon: 'fas fa-clipboard' },
        numberbaseball: { component: NumberBaseball, title: 'NumberBaseball'}

      },

      tabs: [{ component: Home, title: 'Home' }],
      activeTabIndex: 0,

    };
  },

  methods: {
    navigate(title, openInNewTab = false) {

      const website = this.websites[title] || null;

      if (website) {
        const { component, title } = website;
        if (openInNewTab) {
          this.tabs.push({ title, component });
          this.activeTabIndex = this.tabs.length - 1;
        } else {
          this.tabs.splice(this.activeTabIndex, 1, { title, component });
        }
      }
    },

    getTitleFromAddress(address) {
      const website = this.websites[address];
      if (website) {
        return website.name || address;
      }
      return address;
    },

    goHome() {
      this.inputAddress = 'Home';
      this.tabs.splice(this.activeTabIndex, 1, { component: Home, title: 'Home' });
    },

    onNavigate(title) {
      this.navigate(title, false);
    },

    selectTab(index) {
      this.activeTabIndex = index;
      this.inputAddress = this.tabs[index].title;
    },

    closeTab(index) {
      if (this.tabs.length === 1 && this.tabs[0].title !== "Home") {
        this.goHome();
        return;
      }
      if (this.activeTabIndex === index) {
        this.activeTabIndex = Math.max(0, this.activeTabIndex - 1);
      } else if (this.activeTabIndex > index) {
        this.activeTabIndex -= 1;
      }
      this.tabs.splice(index, 1);
    },

    addNewTab() {
      this.tabs.push({ component: Home, title: 'Home' });
      this.activeTabIndex = this.tabs.length - 1;
    },


    toggleSettings() {
      this.activeMenu = this.activeMenu === "Settings" ? "" : "Settings";
    },

    toggleInventory() {
      this.activeMenu = this.activeMenu === "Inventory" ? "" : "Inventory";
    },


    formatMoney(amount) {
      return `$${amount.toLocaleString(undefined, { minimumFractionDigits: 0, maximumFractionDigits: 0 })}`;
    },
  },
};
</script>

<style>
html,
body {
  font-size: 62.5%;
  margin: 0;
  height:100%;

}

body {
  font-family: 'Roboto', sans-serif;
  background-color: #f0f0f0;
  font-size: 1.6rem;
  justify-content: center;
  align-items: center;

}

.sign-in-container {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%;
  min-height: 100vh;
  height: 100%;
  
}

.title-img {
  margin-top: -130px;
  width: 30vw;
  height: auto;
  
}

.signin-button{

  color: black;
  font-size: 1.5vw;
}

#app {
  display: flex;
  flex-direction: column;
  min-height: 100vh;

  background-color: white;
}



#top-panel {
  width: 100%;
  height: 40px;
  background-color: #2a2a2a;
  display: flex;
  justify-content: space-between;
  align-items: center;
  border-bottom: none;
  padding: 0;
  flex-grow: 0;
  box-sizing: border-box;
}


.top-menu {
  display: flex;
  justify-content: flex-end;
  width: 30%;
  gap: 0rem;
  margin-right: 1rem;
}

#main-content {
  flex-grow: 1;
  padding: 1rem;
  display: flex;
  flex-direction: column;
  overflow: auto;
  border:none;
}

.right-panel {
  position: absolute;
  top: 40px;
  right: 0;
  width: 300px;
  height: 94%;
  background-color: #ffffff;
  border-left: 1px solid #ccc;
  overflow-y: auto;
  padding: 1rem;
  box-sizing: border-box;
}

#app-name {
  font-size: 1.3rem;
  margin: 0;
}

button {
  background-color: transparent;
  border: none;
  color: white;
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

.menu-button {
  position: relative;
  top: 2.5px;
}

.tab-bar {
  display: inline-flex;
  gap: 0.0rem;
  flex-wrap: nowrap;
  margin-bottom: 0;
  height: 100%;
  margin-left: 1rem;
  position: relative;
  top: 3px;
}

.tab {
  height: 27px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  color: white;
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
  margin-bottom: -3px;
}

.tab-title {
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
  margin-left: 3px;
}

.tab.active {
  height: 27px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 5px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  color: white;
  border-top-left-radius: 6px;
  border-top-right-radius: 6px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
  margin-bottom: -3px;
  background-color: #ffffff;
  color: black;
  border-bottom: none;

}

.tab:hover {
  color: rgb(255, 176, 176);
  margin-bottom: -3px;
  transition: background-color 0.3s ease, color 0.3s ease;
}

.tab button {
  background-color: transparent;
  border: none;
  color: #555;
  font-size: 1.2rem;
  padding: 0;
  margin-left: 8px;
  margin-right: 5px;
  cursor: pointer;
  position: relative;
  top: 2px;
}

.tab button:hover {
  color: rgb(255, 176, 176);
}

.new-tab-button {
  background-color: transparent;
  border: none;
  color: #555;
  font-size: 2.6rem;
  padding: 3px;
  cursor: pointer;
  position: relative;
  top: 0.6px;
  margin-left: 6px;
}

.new-tab-button:hover {
  color: rgb(255, 176, 176);
}

</style>