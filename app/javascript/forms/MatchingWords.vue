<template>
    <div id="anagrams">
        <v-subheader>History</v-subheader>
        <v-divider></v-divider>
        <v-list two-line>
          <!-- <v-data-table
            :headers="headers"
            :items="anagrams"
            hide-actions>
            <template slot="items" slot-scope="props">
              <td class="text-xs-left">{{ props.item.firstword }}</td>
              <td class="text-xs-left">{{ props.item.secondword }}</td>
              <td class="text-xs-left">{{ props.item.matching }}</td>
            </template>
          </v-data-table> -->
          <div v-for="(anagram, index) in anagrams" :key="anagram.firstword + '-' + anagram.secondword + '-' + index">
            <v-list-tile @click="getThisMatching(anagram)">
              <v-list-tile-action>
                <v-flex v-if="anagram.matching">
                    <v-icon title="Match as Anagrams" medium>mood</v-icon>
                </v-flex>
                <v-flex v-else>
                    <v-icon title="Don't Match as Anagrams" medium>mood_bad</v-icon>
                </v-flex>
              </v-list-tile-action>
              <v-list-tile-content>
                  <v-list-tile-title>"{{anagram.firstword}}" <i>and</i>&nbsp;&nbsp;"{{anagram.secondword}}"</v-list-tile-title>
                  <v-list-tile-sub-title>{{anagram.created_at}}</v-list-tile-sub-title>
              </v-list-tile-content>
            </v-list-tile>
          </div>
        </v-list>
    </div>
</template>

<script>
import axios from "axios";

export default {
  name: "MatchingWords",
  data: () => ({
    anagrams: [],
    headers: [
      { text: "First W.", value: "firstword", sortable: false },
      { text: "Second W.", value: "secondword", sortable: false },
      { text: "Matching", value: "matching", sortable: false }
    ]
  }),
  created() {
    this.updateAnagramsLeftList();
  },
  mounted() {
    this.$root.$on("PushElementToMatchingHistory", payloadMessage => {
      // this.anagrams.unshift(payloadMessage);
      setTimeout(() => {
        this.updateAnagramsLeftList();
      }, 300);
    });
  },
  methods: {
    getThisMatching(anagram) {
      this.$root.$emit("FillFormAtTwoAnagrams", anagram);
    },
    updateAnagramsLeftList() {
      axios
        .get("/anagrams.json")
        .then(response => {
          this.anagrams = response.data;
        })
        .catch(e => {
          this.error.push(e);
        });
    }
  }
};
</script>
