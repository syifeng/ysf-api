<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
  export default {
    name: 'app'
  }
</script>

<style>
  #app {
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    color: #2c3e50;
    position: absolute;
    top: 0px;
    bottom: 0px;
    left: 0px;
    right: 0px;
  }

  body {
    font-family: '微软雅黑';
    margin: 0 auto;
    padding: 0;
    background: #FFF;
    font-size: 12px;
    color: #333;
  }

  body > div {
    margin-right: auto;
    margin-left: auto;
  }

  div, form, ul, ol, li, span, p {
    margin: 0;
    padding: 0;
    border: 0;
  }

  img, a img {
    border: 0;
    margin: 0;
    padding: 0;
  }

  h1, h2, h3, h4, h5, h6 {
    margin: 0;
    padding: 0;
    font-size: 12px;
    font-weight: normal;
  }

  ul, ol, li {
    list-style: none
  }

  table, td, input {
    font-size: 12px
  }

  a {
    outline-style: none;
    color: #333;
    text-decoration: none
  }

  a:hover {
    color: #c00;
    text-decoration: underline;
  }

  .info-label, .info-value {
    margin-bottom: 20px;
    height: 30px;
    line-height: 30px;
    &:last-child {
      margin-bottom: 0;
    }
  }

  .info-label {
    text-align: right;
  }

  .info-value {
    text-align: left;
  }

  .json-block {
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    background: aliceblue;
    padding: 5px;
    overflow-x: auto;
  }
</style>
