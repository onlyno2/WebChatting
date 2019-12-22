const post = {
  namespaced: true,
  state: { posts: [], userPosts: [] },
  mutations: {
    APPEND_POST(state, posts) {
      console.log(posts);
      state.posts = state.posts.concat(posts);
    },
    APPEND_USER_POST(state, posts) {
      state.userPosts = state.userPosts.concat(posts);
    }
  },
  getters: {
    getPosts(state) {
      return state.posts;
    },
    getUserPosts(state) {
      return state.userPosts;
    }
  }
};

export default post;
