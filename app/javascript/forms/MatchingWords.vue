<template>
    <div id="anagrams">
        <v-list dense>
            <div v-for="(anagram, index) in anagrams" :key="anagram.id + '_' + index">
                <v-list-tile @click="getThisMatching(anagram)">
                    <v-list-tile-action>
                        <v-icon>mood</v-icon>
                        <!-- <v-icon>mood_bad</v-icon> -->
                    </v-list-tile-action>
                    <v-list-tile-content>
                        <v-list-tile-title>Matching #nro</v-list-tile-title>
                        <span>{{anagram.firstword}}</span>
                        <span>{{anagram.secondword}}</span>
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
    anagrams: []
  }),
  created() {
    axios.get('/anagrams.json').then(response => {
        this.anagrams = response.data
    }).catch(e => {
        this.error.push(e)
    })
  },
  methods: {
    getThisMatching(anagram) {
        this.anagram_sep = anagram
    }
  }
}
</script>
