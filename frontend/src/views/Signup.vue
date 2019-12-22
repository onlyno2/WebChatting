<template>
  <v-container class="grey lighten-5">
    <v-row no-gutters>
      <v-col cols="12" sm="3"> </v-col>
      <v-col cols="12" sm="6">
        <v-card class="mx-auto mt-5">
          <v-card-title class="pb-0">
            <h1 class="mx-auto">{{ $t('signup') }}</h1>
          </v-card-title>
          <v-card-text class="mt-4">
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                v-model="name"
                :rules="nameRules"
                label="Name"
                outlined
                required
                clearable
              ></v-text-field>
              <v-text-field
                v-model="email"
                :rules="emailRules"
                label="E-mail"
                outlined
                required
                clearable
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
              <v-text-field
                v-model="passwordConfirm"
                :append-icon="show2 ? 'mdi-eye' : 'mdi-eye-off'"
                :rules="passConfirmRules"
                :type="show2 ? 'text' : 'password'"
                name="input-10-2"
                label="Confirm password"
                counter
                outlined
              ></v-text-field>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-btn
              :disabled="!valid"
              color="primary"
              class="mx-auto"
              @click="submitForm()"
            >
              {{ $t('submit') }}
            </v-btn>
          </v-card-actions>
          <v-divider></v-divider>
        </v-card>
      </v-col>
      <v-col cols="12" sm="3"> </v-col>
    </v-row>
  </v-container>
</template>

<script>
  export default {
    data() {
      return {
        valid: true,
        show1: false,
        show2: false,
        email: '',
        password: '',
        name: '',
        passRules: [
          value => !!value || 'Required.'
        ],
        nameRules: [
          value => !!value || 'Required.'
        ],
        emailRules: [
          v => !!v || 'E-mail is required',
          v => /.+@.+\..+/.test(v) || 'E-mail must be valid'
        ],
        passConfirmRules: [
          v => this.password == v || 'Password must match'
        ]
      }
    }
  }
</script>
