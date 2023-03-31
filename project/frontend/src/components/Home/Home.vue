<template>
  <div class="home">
    <div>
      <h2>Mini Web Simulator</h2>
      <p>Available websites:</p>
      <ul>
        <li><a @click.prevent="$emit('navigate', 'texteditor')">Text Editor</a></li>
        <li><a @click.prevent="$emit('navigate', 'minitalk')">MiniTalk</a></li>
        <li><a @click.prevent="$emit('navigate', 'clicker')">Clicker</a></li>
        <li><a @click.prevent="$emit('navigate', 'blackjack')">Blackjack</a></li>
        <li><a @click.prevent="$emit('navigate', 'ministore')">MiniStore</a></li>
        <li><a @click.prevent="$emit('navigate', 'numberbaseball')">Number Baseball</a></li>

      </ul>

    </div>
  </div>
</template>

<script>
export default {
  name: "HomeComp",
};
</script>

<style scoped>
.home {
  display: flex;

  justify-content: center;
  align-items: center;
}

a {
  color: #3e5eeb;
  text-decoration: none;
  cursor: pointer;
}

a:hover {
  text-decoration: underline;
}
</style>
