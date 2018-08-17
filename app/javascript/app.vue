<template>
  <v-app id="inspire" dark>
    <v-navigation-drawer
      v-model="drawer"
      clipped
      fixed
      app>
      <v-list dense>
        <v-list-tile @click="getThisMatching(none)">
          <v-list-tile-action>
            <v-icon>mood</v-icon>
            <!-- <v-icon>mood_bad</v-icon> -->
          </v-list-tile-action>
          <v-list-tile-content>
            <v-list-tile-title>Matching #nro</v-list-tile-title>
          </v-list-tile-content>
        </v-list-tile>
      </v-list>
    </v-navigation-drawer>
    <v-toolbar app fixed clipped-left>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Application</v-toolbar-title>
    </v-toolbar>
    <v-content>
      <two-anagrams></two-anagrams>
    </v-content>
    <v-footer app fixed>
      <span>&copy; Copyleft Rails App @ 2018</span>
    </v-footer>
  </v-app>
</template>

<script>
import TwoAnagrams from "./forms/TwoAnagrams.vue"

export default {
  data: () => ({
    drawer: true
  }),
  props: {
    source: String
  },
  components: {
    TwoAnagrams
  }
}
</script>

<!--
<template>
  <div id="app">
   <p>{{ message }}</p>
  </div>
</template>

<script>
export default {
  data: function () {
    return {
      message: "Hello Vue, Lucas Tonussi. This is your Vue App!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
-->