<template>
  <div>
    <div>工具部分</div>
    <router-view></router-view>
  </div>

</template>
<script>
export default {
  name: 'tool',
  data () {
    return {
      tools: [
        {
          name: '编辑器',
          code: 'editors',
          list: [
            {
              name: 'alloyEditor',
              url: '/tool/editor/alloy'
            }
          ]
        }
      ]
    }
  },
  methods: {
    pageTo (toolVal) {
      console.log(toolVal);
    }
  }
}
</script>
