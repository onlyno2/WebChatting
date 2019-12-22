const token = {
  namespaced: true,
  state: { token },
  mutations: {
    TOKEN(state, token) {
      state.token = token;
    },
    LOG_OUT(state) {
      state.token = null;
    }
  },
  getters: {
    getToken(state) {
      return state.token;
    }
  }
};

export default token;