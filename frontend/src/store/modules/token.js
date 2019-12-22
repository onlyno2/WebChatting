const token = {
  namespaced: true,
  state: { token: null, userId: null },
  mutations: {
    TOKEN(state, token) {
      state.token = token;
    },
    LOG_OUT(state) {
      state.token = null;
      state.userId = null;
    },
    USER_ID(state, userId) {
      state.userId = userId;
    }
  },
  getters: {
    getToken(state) {
      return state.token;
    },
    getUserId(state) {
      return state.userId;
    }
  }
};

export default token;
