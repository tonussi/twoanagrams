<template>
  <v-card class="pa-4 ma-4">
    <v-container>
      <v-form v-model="valid">
        <v-flex>
          <h1>Two Anagrams</h1>
        </v-flex>
        <v-flex>
          <p>This software gets two words and check if they are anagrams between them.</p>
        </v-flex>
        <v-flex>
          <v-text-field
            v-model="firstword"
            label="A Word"
            required>
          </v-text-field>
        </v-flex>
        <v-flex>
          <v-text-field
            v-model="secondword"
            label="Another Word"
            required>
          </v-text-field>
        </v-flex>
        <v-snackbar
          v-model="alert"
          color="pink lighten-2"
          :timeout="timeout">
          {{ alertmsg }}
          <v-btn
            dark
            flat
            @click="alert = false">
            Close
          </v-btn>
        </v-snackbar>
        <v-flex>
          <v-btn color="teal" @click="submit">submit</v-btn>
          <v-btn color="pink" @click="clear">clear</v-btn>
        </v-flex>
      </v-form>
    </v-container>
  </v-card>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      valid: false,
      alert: false,
      error: [],
      firstword: '',
      secondword: '',
      alertmsg: ``,
      timeout: 6000
    }
  },
  methods: {
    verifyWords() {
      if (this.firstword.length != this.secondword.length) {
        this.alertmsg = "First and Second Must Be Equal In Length."
        this.alert = true
        return false;
      } else {
        this.alert = false
        return true;
      }
    },
    submit() {
      if (this.verifyWords() != true) {
        console.log("Wrong Lengthies")
        return;
      } else {
        console.log("Right Lengthies")
        const editedItem = {
          firstword: this.firstword,
          secondword: this.secondword,
          matching: false
        }
        axios.post('http://localhost:3000/anagrams.json', editedItem).then(function (resp) {
          this.$root.$emit('myEvent', 'new message!')
        }).catch(e => {
          this.error.push(e)
        })
      }
    },
    clear() {
      this.firstword = ''
      this.secondword = ''
    }
  }
}
</script>
