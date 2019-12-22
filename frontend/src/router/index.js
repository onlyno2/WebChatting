import Vue from "vue";
import VueRouter from "vue-router";
import Home from "../views/Home.vue";
import Contact from "../views/Contact.vue";
import Feed from '../views/Feed.vue';
import UserProfile from '../views/UserProfile.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'home',
    component: Home
  },
  {
    path: '/about',
    name: 'about',
    // route level code-splitting
    // this generates a separate chunk (about.[hash].js) for this route
    // which is lazy-loaded when the route is visited.
    component: () =>
      import(/* webpackChunkName: "about" */ "../views/About.vue")
  },
  {
    path: "/contact",
    name: "contact",
    component: Contact
  },
  {
    path: '/feed',
    name: 'feed',
    component: Feed
  },
  {
    path: '/user/:id',
    name: 'user',
    component: UserProfile
  },
  {
    path: '*',
    name: 'not-found',
    component: Home
  }
];

const router = new VueRouter({
  routes
});

export default router;
