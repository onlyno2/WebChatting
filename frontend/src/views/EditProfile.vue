<template>
  <v-container class="grey lighten-5">
    <v-row no-gutters>
      <v-col cols="12" sm="3"> </v-col>
      <v-col cols="12" sm="6">
        <v-card class="mx-auto mt-5">
          <v-card-title class="pb-0">
            <h1 class="mx-auto">{{ $t('editProfile') }}</h1>
          </v-card-title>
          <v-card-text class="mt-4">
            <v-form ref="form" v-model="valid" lazy-validation>
              <v-text-field
                v-model="name"
                :rules="nameRules"
                :label="$t('name')"
                outlined
                required
                clearable
              ></v-text-field>
              <v-file-input
                v-model="avatar"
                accept="image/*"
                :label="$t('fileInput')"
              ></v-file-input>
            </v-form>
          </v-card-text>
          <v-card-actions>
            <v-btn
              :disabled="!valid"
              color="primary"
              class="mx-auto"
              @click="submitEdit()"
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
      name: '',
      nameRules: [value => !!value || 'Required.'],
      avatar: null
    };
  },
  methods: {
    submitEdit() {
      if (this.$refs.form.validate()) {
        this.$axios
          .patch(
            'http://localhost:3000/api/users/' + this.$route.params.id,
            {
              name: this.name
            },
            {
              headers: {
                Authorization: `Bearer ${this.$store.getters['token/getToken']}`
              }
            }
          )
          .then(response => {
            this.$alertify.success(response.data.message);
            if (this.avatar !== null) {
              let formData = new FormData();
              formData.set('image', this.avatar);

              this.$axios
                .post('http://localhost:3000/api/images', formData, {
                  headers: {
                    Authorization: `Bearer ${this.$store.getters['token/getToken']}`
                  }
                })
                .then(response => {
                  this.$alertify.success(response.data.message);
                  this.$router.push({
                    name: 'user',
                    params: { id: this.$route.params.id }
                  });
                })
                .catch(error => {
                  this.$alertify.error(error.response.data.errors);
                });
            } else {
              this.$router.push({
                name: 'user',
                params: { id: this.$route.params.id }
              });
            }
          })
          .catch(error => {
            this.$alertify.error(error.response.data.errors);
          });
      }
    }
  }
};
</script>
