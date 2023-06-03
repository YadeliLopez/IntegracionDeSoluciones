import Vue from 'vue'
import VueRouter from 'vue-router'
//import HomeView from '../views/HomeView.vue'
import Principal from '../views/Principal.vue'
import PaginaYayis from '../views/PaginaYayis.vue'
import Login from '../views/Login.vue'
Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Principal',
    component: Principal
  },
  {
    path: '/PaginaYayis',
    name: 'PaginaYayis',
    component: PaginaYayis
  },
  {
    path: '/Login',
    name: 'Login',
    component: Login
  },
]

const router = new VueRouter({
  routes
})

export default router
