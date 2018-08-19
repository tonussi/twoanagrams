<template>
  <v-card class="pa-4 ma-4">
    <v-container>
      <v-form v-model="valid">
        <v-flex>
          <h1>Two Anagrams</h1>
        </v-flex>
        <v-flex class="pa-4 ma-4">
          <p>This software gets two words and check if they are anagrams between them.</p>
          <v-alert value="true" type="info" outline>Words with less than 2 characters will not be accepted.</v-alert>
          <v-alert value="true" type="info" outline>Words that do not match the same length will not be accepted.</v-alert>
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
          :color="alertcolor"
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
import axios from "axios";

export default {
  name: "TwoAnagrams",
  data() {
    return {
      valid: false,
      alert: false,
      error: [],
      firstword: "",
      secondword: "",
      alertmsg: ``,
      alertcolor: "",
      timeout: 6000,
      editedItem: undefined
    };
  },
  mounted() {
    this.$root.$on("FillFormAtTwoAnagrams", payloadMessage => {
      this.firstword = payloadMessage.firstword;
      this.secondword = payloadMessage.secondword;
    });
  },
  methods: {
    verifyWordsLengthies() {
      if (this.firstword.length != this.secondword.length) {
        this.alertmsg = "First and Second Word Must Be Equal In Length.";
        this.alertcolor = "pink darken-2";
        this.alert = true;
        return true;
      } else {
        this.alert = false;
        return false;
      }
    },
    verifyQuantity() {
      if (this.firstword.length <= 2 || this.secondword.length <= 2) {
        this.alertmsg =
          "First and Second Words Must Have More Than 2 Characters Each.";
        this.alertcolor = "cyan darken-2";
        this.alert = true;
        return true;
      } else {
        this.alert = false;
        return false;
      }
    },
    verifyEqualWords() {
      if (this.firstword === this.secondword) {
        this.alertmsg = "First and Second Words Must Not Be Equal.";
        this.alertcolor = "teal darken-2";
        this.alert = true;
        return true;
      } else {
        this.alert = false;
        return false;
      }
    },
    emitPushElementToMatchingHistory() {
      this.$root.$emit("PushElementToMatchingHistory", this.editedItem);
    },
    submit() {
      if (this.verifyWordsLengthies()) {
        return;
      } else if (this.verifyQuantity()) {
        return;
      } else if (this.verifyEqualWords()) {
        return;
      } else {
        this.editedItem = {
          firstword: this.firstword,
          secondword: this.secondword,
          matching: undefined,
          created_at: new Date(),
          updated_at: new Date()
        };
        axios
          .post("/anagrams.json", this.editedItem)
          .catch(e => {
            this.error.push(e);
          });
      }
      this.emitPushElementToMatchingHistory();
    },
    clear() {
      this.firstword = "";
      this.secondword = "";
    }
  }
};
</script>
