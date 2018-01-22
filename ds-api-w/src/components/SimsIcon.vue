<template>
  <span>
    <i v-if="iconType==1" :class="[iconName, iconSize, 'iconfont']" :style="'color:' + iconColor"></i>
    <svg v-if="iconType==2" :class="[iconSize, 'icon']" aria-hidden="true">
        <use :xlink:href="'#'+iconName"></use>
      </svg>
  </span>
</template>
<script>
export default {
  props: ['iconName', 'iconType', 'iconSize', 'iconColor'],
  created () {

  }
}
</script>
<style scoped>
  .icon-l{
    font-size: 60px;
    width: 1em; height: 1em;
  }
  .icon-xs{
    font-size: 24px;
    width: 1em; height: 1em;
  }
  .icon-sm{
    font-size: 16px;
    width: 1em; height: 1em;
  }
</style>
