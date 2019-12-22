const post = {
  namespaced: true,
  state: { posts: [] },
  mutations: {
    APPEND_POST(state, posts) {
      console.log(posts);
      state.posts = state.posts.concat(posts);
    }
  },
  getters: {
    getPosts(state) {
      return state.posts;
    }
  }
};

export default post;
