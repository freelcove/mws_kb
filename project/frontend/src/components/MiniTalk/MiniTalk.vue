<template>
  <div class="mini-talk">
    <div class="messages">
      <div v-for="(message, index) in messages" :key="index">
        <span class="username">{{ message.username }}:</span>
        <span class="text">{{ message.text }}</span>
      </div>
    </div>
    <form @submit.prevent="sendMessage">
      <input type="text" v-model="messageInput" placeholder="Type your message..." />
      <button type="submit">Send</button>
    </form>
  </div>
</template>

<script>
export default {
  name: "MiniTalk",
  data() {
    return {
      messages: [],
      messageInput: "",
    };
  },
  methods: {
    sendMessage() {
      if (!this.messageInput.trim()) return;
      this.messages.push({ username: "You", text: this.messageInput });
      this.messageInput = "";
    },
  },
};
</script>

<style scoped>
.mini-talk {
  display: flex;
  flex-direction: column;
  height: 100%;
}

.messages {
  flex-grow: 1;
  overflow-y: auto;
  padding: 0.5rem;
}

.username {
  font-weight: bold;
}

.text {
  margin-left: 0.5rem;
}

form {
  display: flex;
  gap: 0.5rem;
  width: 100%;
}

input {
  flex-grow: 1;
}
</style>
