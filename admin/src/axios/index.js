import Vue from 'vue'
import axios from 'axios'
import { MessageBox } from 'element-ui';
Vue.prototype.$http = axios    //全局注册，使用方法为:this.$axios
// 请求拦截
axios.interceptors.request.use(config => {
    const token = localStorage.getItem('token');
    if (token) {
        // 在发起请求前，给所有请求的头部添加token
        config.headers.common['token'] = JSON.parse(token).token;
    }
    return config;
}, error => {
    // 对请求失败做处理
    return Promise.reject(error);
})
// 响应拦截
axios.interceptors.response.use(res => {
    // 对响应数据做处理
    const data = res.data;
    if (data.code === 3301) {
        MessageBox.confirm('你已退出登录状态，请重新登入?', '提示', {
            confirmButtonText: '确定',
            cancelButtonText: '取消',
            type: 'warning'
          }).then(() => {
            window.location.href = '/';
          }).catch(() => {})
    }
    return res.data;
}, error => {
    // 对响应错误做处理
    return Promise.reject(error);
})