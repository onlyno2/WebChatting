const token = {
  namespaced: true,
  state: { token },
  mutations: {
    TOKEN(state, token) {
      state.token = token;
    }
  },
  getters: {
    getToken(state) {
      return state.token;
    }
  }
};

export default token;