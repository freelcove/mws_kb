<template>
    <div class="text-editor">
      <h1>Text Editor</h1>
      <div class="controls">
        <label for="text-size">Text Size:</label>
        <input type="number" id="text-size" v-model="textSize" min="10" max="50" />
      </div>
      <textarea v-model="text" :style="{ fontSize: textSize + 'px' }"></textarea>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        text: '',
        textSize: 16,
      };
    },
  };
  </script>
  
  <style scoped>
    .text-editor {
      width: 100%;
      display: flex;
      flex-direction: column;
    }
  
    .controls {
      display: flex;
      align-items: center;
      gap: 0.5rem;
      margin-bottom: 1rem;
    }
  
    textarea {
      width: 100%;
      height: 400px;
      resize: none;
      box-sizing: border-box;
    }
  </style>
  