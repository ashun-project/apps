import Vue from 'vue'
import Router from 'vue-router'
import home from '@/views/home'
import hot from '@/views/hot'
import banner from '@/views/banner'
import addbanner from '@/views/addbanner'
import shenhe from '@/views/shenhe'
import login from '@/views/login'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/home',
      name: 'home',
      component: home
    },
    {
      path: '/hot',
      name: 'hot',
      component: hot
    },
    {
      path: '/banner',
      name: 'banner',
      component: banner
    },
    {
      path: '/addbanner',
      name: 'addbanner',
      component: addbanner
    },
    {
      path: '/shenhe',
      name: 'shenhe',
      component: shenhe
    },
    {
      path: '/',
      name: 'login',
      component: login
    }
  ]
})
