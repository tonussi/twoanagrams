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
            @click="snackbar = false">
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
export default {
  data() {
    return {
      valid: false,
      alert: false,
      firstword: '',
      secondword: '',
      alertmsg: ``,
      timeout: 6000,
      // wordRules: [
      //   v => this.getLengthsCompared() || 'First and Second Must Be Equal In Length!'
      // ]
    }
  },
  methods: {
    verifyWords() {
      if (this.firstword.length != this.secondword.length) {
        this.alertmsg = "First and Second Must Be Equal In Length."
        this.alert = true
      } else {
        this.alert = false
      }
    },
    submit() {
      this.verifyWords()
    },
    clear() {
      this.firstword = ''
      this.secondword = ''
    }
  }
}
</script>
