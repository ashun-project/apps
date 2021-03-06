import Vue from 'vue'
import Router from 'vue-router'
import home from '@/views/home'
import hot from '@/views/hot'
import banner from '@/views/banner'
import addbanner from '@/views/addbanner'
import shenhe from '@/views/shenhe'
import login from '@/views/login'
import friendly from '@/views/friendly'
import conf from '@/views/conf'

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
      path: '/friendly',
      name: 'friendly',
      component: friendly
    },
    {
      path: '/',
      name: 'login',
      component: login
    },
    {
      path: '/conf',
      name: 'conf',
      component: conf
    }
  ]
})
