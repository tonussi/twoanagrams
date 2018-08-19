<template>
  <v-app id="inspire" dark>
    <v-navigation-drawer width="600" v-model="drawer" clipped fixed app>
      <div v-if="drawer">
        <matching-words></matching-words>
      </div>
    </v-navigation-drawer>
    <v-toolbar app fixed clipped-left>
      <v-toolbar-side-icon @click.stop="drawer = !drawer"></v-toolbar-side-icon>
      <v-toolbar-title>Anagrams Matcher App</v-toolbar-title>
    </v-toolbar>
    <v-content>
      <two-anagrams></two-anagrams>
    </v-content>
    <v-footer app fixed>
      <v-spacer></v-spacer>
      <v-subheader>&copy; Copyleft Rails App @ 2018</v-subheader>
    </v-footer>
  </v-app>
</template>

<script>
import TwoAnagrams from "./forms/TwoAnagrams.vue";
import MatchingWords from "./forms/MatchingWords.vue";

export default {
  data: () => ({
    drawer: true
  }),
  components: {
    TwoAnagrams,
    MatchingWords
  }
};
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