<template>
    <div id="anagrams">
        <v-subheader>History</v-subheader>
        <v-divider></v-divider>
        <v-list dense>
            <div v-for="(anagram, index) in anagrams" :key="anagram.id + '_' + index">
                <v-list-tile @click="getThisMatching(anagram)">
                    <v-list-tile-action>
                        <v-flex v-if="anagram.matching">
                            <v-icon medium>mood</v-icon>
                        </v-flex>
                        <v-flex v-else>
                            <v-icon medium>mood_bad</v-icon>
                        </v-flex>
                    </v-list-tile-action>
                    <v-list-tile-content>
                        <v-subheader>{{anagram.firstword}}</v-subheader>
                        <v-subheader>{{anagram.secondword}}</v-subheader>
                        <v-subheader>{{anagram.created_at}}</v-subheader>
                    </v-list-tile-content>
                </v-list-tile>
            </div>
        </v-list>
    </div>
</template>

<script>
import axios from 'axios'

export default {
  data: () => ({
    anagram_sep: undefined,
    anagrams: [],
    message: undefined
  }),
  created() {
    axios.get('http://localhost:3000/anagrams.json').then(response => {
        this.anagrams = response.data
    }).catch(e => {
        this.error.push(e)
    })
  },
  mounted: function () {
      this.$root.$on('myEvent', (text) => {
      this.message = text
    })
  },
  methods: {
    getThisMatching(anagram) {
        this.anagram_sep = anagram
    }
  }
}
</script>
