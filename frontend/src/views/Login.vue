<template>
  <v-container class="grey lighten-5">
    <v-row no-gutters>
      <v-col cols="12" sm="3"> </v-col>
      <v-col cols="12" sm="6">
        <v-card class="mx-auto mt-5">
          <v-card-title class="pb-0">
            <h1 class="mx-auto">{{ $t('login') }}</h1>
          </v-card-title>
          <v-card-text class="mt-4">
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                v-model="email"
                :rules="emailRules"
                label="E-mail"
                outlined
                required
              ></v-text-field>
              <v-text-field
                v-model="password"
                :append-icon="show1 ? 'mdi-eye' : 'mdi-eye-off'"
                :rules="passRules"
                :type="show1 ? 'text' : 'password'"
                name="input-10-1"
                label="Password"
                counter
                outlined
                @click:append="show1 = !show1"
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-btn
              :disabled="!valid"
              color="success"
              class="mx-auto"
              @click="submitForm()"
            >
              {{ $t('submit') }}
            </v-btn>
          </v-card-actions>
          <v-divider></v-divider>
          <v-card-actions>
            <VFacebookLogin app-id="480114589280370" @login="login" class="mx-auto mb-3"></VFacebookLogin>
          </v-card-actions>
        </v-card>
      </v-col>
      <v-col cols="12" sm="3"> </v-col>
    </v-row>
  </v-container>
</template>

<script>
  import { VFBLogin as VFacebookLogin } from 'vue-facebook-login-component';

  export default {
    data() {
      return {
        valid: true,
        email: '',
        password: '',
        show1: false,
        passRules: [
          value => !!value || 'Required.'
        ],
        emailRules: [
          v => !!v || 'E-mail is required',
          v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
        ]
      }
    },
    components: {
      VFacebookLogin
    },
    methods: {
      login(res) {
        this.$axios
          .post(
            'http://localhost:3000/auth/facebook_login',
            { credential: res },
            {}
          )
          .then(response => {
            this.$store.commit('token/TOKEN', response.data.data);
            this.$alertify.success('Login success');
          })
          .catch(error => {
            console.log(error);
          });
      }
    }
  }
</script>
