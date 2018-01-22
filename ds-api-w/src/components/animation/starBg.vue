<template>
  <div id="starsBox"></div>
</template>
<script>
  var cols = ['#f5d76e','#f7ca18','#f4d03f','#ececec','#ecf0f1','#a2ded0'];
  var stars = 250;

  for (var i = 0; i <= stars; i++) {

    var size = Math.random()*3;
    var color = cols[parseInt(Math.random()*4)];

    $('#starsBox').prepend('<span style=" width: ' + size + 'px; height: ' + size + 'px; top: ' + Math.random()*100 + '%; left: ' + Math.random()*100 + '%; background: ' + color + '; box-shadow: 0 0 '+ Math.random()*10 +'px' + color + ';"></span>') ;
  };

  setTimeout(function(){
    $('#starsBox span').each(function(){
      $(this).css('top', Math.random()*100 + '%').css('left', Math.random()*100 + '%');
    });
  }, 1);

  setInterval(function(){
    $('#starsBox span').each(function(){
      $(this).css('top', Math.random()*100 + '%').css('left', Math.random()*100 + '%');
    });
  }, 100000);
</script>
<style scoped>
  * {
    box-sizing: border-box;
    padding: 0;
    margin: 0;
  }

  body {
    background: #22313f;
  }

  #starsBox {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0, 0, 0, 0.75);
    opacity: .5;
  }
  #starsBox span {
    display: inline-block;
    width: auto;
    position: absolute;
    border-radius: 100%;
    transition: 100s linear;
  }

  p {
    position: fixed;
    top: 50%;
    left: 0;
    right: 0;
    text-align: center;
    transform: translateY(-50%);
    font-size: 40px;
    font-weight: 900;
    color: white;
    text-shadow: 0 0 50px black;
    text-transform: uppercase;
    font-family: 'Roboto','Helvetica','Arial',sans-serif;
    letter-spacing: 5px;
  }
  p > span {
    display: block;
    font-size: 12px;
    color: #bdc3c7;
    margin-top: 30px;
    font-weight: 100;
    text-shadow: 0 0 50px black;
    letter-spacing: 3px;
  }
  p > span > a {
    font-weight: 700;
    text-decoration: none;
    color: #d64541;
    padding-bottom: 2px;
    border-bottom: 0px solid #d64541;
    transition: 0.5s;
  }
  p > span > a:hover {
    padding-bottom: 5px;
    border-bottom: 2px solid #d64541;
  }

</style>
