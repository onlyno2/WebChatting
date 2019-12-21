<template>
  <v-container class="grey lighten-5">
    <v-row no-gutters>
      <v-col cols="12" sm="3"> </v-col>
      <v-col cols="12" sm="6">
        <v-card class="mx-auto mt-5">
          <v-card-title class="pb-0">
            <h1>{{ $t('contact') }}</h1>
          </v-card-title>
          <v-card-text class="mt-4">
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                v-model="name"
                :counter="10"
                :rules="nameRules"
                :label="$t('name')"
                outlined
                required
              ></v-text-field>

              <v-text-field
                v-model="email"
                :rules="emailRules"
                label="E-mail"
                outlined
                required
              ></v-text-field>

              <v-textarea
                name="input-7-1"
                :counter="255"
                v-model="content"
                :rules="contentRules"
                :label="$t('content')"
                outlined
                required
                auto-grow
              ></v-textarea>
            </v-form>
          </v-card-text>
          <v-divider></v-divider>
          <v-card-actions>
            <v-btn
              :disabled="!valid"
              color="success"
              class="mr-4"
              @click="submitForm()"
            >
              {{ $t('submit') }}
            </v-btn>
          </v-card-actions>
        </v-card>
      </v-col>
      <v-col cols="12" sm="3"> </v-col>
    </v-row>
  </v-container>
</template>
<script>
export default {
  data: () => ({
    valid: true,
    name: '',
    nameRules: [
      v => !!v || 'Name is required',
      v => (v && v.length <= 10) || 'Name must be less than 10 characters'
    ],
    email: '',
    emailRules: [
      v => !!v || 'E-mail is required',
      v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
    ],
    content: '',
    contentRules: [
      v => !!v || 'Content is required',
      v => (v && v.length <= 255) || 'Name must be less than 255 characters'
    ]
  }),
  methods: {
    submitForm() {
      if (this.$refs.form.validate()) {
        this.$axios
          .post(
            'http://localhost:3000/api/contact',
            {
              name: this.name,
              content: this.content,
              email: this.email
            },
            {}
          )
          .then(response => {
            console.log(response)
            this.$alertify.success('Login success');
          })
          .catch(error => {
            console.log(error);
          });
      } else {
        console.log('error submit!!');
        return false;
      }
    }
  }
};
</script>
