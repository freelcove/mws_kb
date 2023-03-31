<template>
    <div class="external-content">
      <iframe class = 'iframe' ref="iframe" width="100%" height="500px" @load="onIframeLoad"></iframe>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        externalUrl: '/NumberBaseball.html',
        iframeLoaded: false,
      };
    },
    methods: {
      onIframeLoad() {
        this.iframeLoaded = true;
        console.log('Iframe has been loaded.');
      },
    },
    mounted() {
      this.$refs.iframe.src = this.externalUrl;
    },
  };
  </script>
  
  <style scoped>
  .external-content {

  }

  .iframe{
    border:none;
  }
  </style>