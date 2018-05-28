<template>
  <iframe  id="show-iframe"  frameborder=0 name="showHere" scrolling=auto src="http://localhost:5601"></iframe>
</template>

<script>
  export default {

    mounted(){
      const oIframe = document.getElementById('show-iframe');
      const deviceWidth = document.documentElement.clientWidth;
      const deviceHeight = document.documentElement.clientHeight;
      oIframe.style.width = deviceWidth-300+ 'px';
      oIframe.style.height = deviceHeight + 'px';
    }
  }


</script>

<style scoped>
  .iframe {
    width: 100%;
    height: 100%;
    border: 0;
    overflow: hidden;
    box-sizing: border-box;
  }
</style>
