<template>
  <div id="app">
    <el-row style="height: 100%;">
        <el-col :span="4" style="min-height: 100%; background-color: #324057;">
            <div class="toxiang">
                <img src="@/assets/img/tox.jpg" alt="">
            </div>
            <div style="height:1px;background:rgba(242, 242, 242, 0.03);"></div>
          <el-menu
            default-active="2"
            class="el-menu-vertical-demo"
            @open="handleOpen"
            @close="handleClose"
            background-color="#324057"
            text-color="#fff"
            router
            active-text-color="#ffd04b">
            <el-menu-item index="/home">
              <i class="el-icon-menu"></i>
              <span slot="title">APP列表</span>
            </el-menu-item>
            <!-- <el-menu-item index="3">
              <i class="el-icon-document"></i>
              <span slot="title">子帐号列表</span>
            </el-menu-item> -->
            <el-menu-item index="/hot">
              <i class="el-icon-document"></i>
              <span slot="title">热门推荐列表</span>
            </el-menu-item>
            <el-menu-item index="/banner">
              <i class="el-icon-setting"></i>
              <span slot="title">轮播图列表</span>
            </el-menu-item>
            <el-menu-item index="/shenhe">
              <i class="el-icon-setting"></i>
              <span slot="title">审核列表</span>
            </el-menu-item>
            <el-menu-item index="/friendly">
              <i class="el-icon-setting"></i>
              <span slot="title">友情连接</span>
            </el-menu-item>
            <el-menu-item index="/addbanner">
              <i class="el-icon-setting"></i>
              <span slot="title">添加轮播图</span>
            </el-menu-item>
             <el-menu-item index="/conf">
              <i class="el-icon-setting"></i>
              <span slot="title">系统管理</span>
            </el-menu-item>
             <!-- <el-menu-item index="8">
              <i class="el-icon-setting"></i>
              <span slot="title">添加子帐号</span>
            </el-menu-item> -->
          </el-menu>
        </el-col>
        <el-col :span="20" style="height: 100%;overflow: auto;">
          <!-- <keep-alive>
              <router-view></router-view>
          </keep-alive> -->
          <div class="head-top">
              <span @click="loginOut">退出</span>
          </div>
          <div class="content">
            <router-view></router-view>
          </div>
          
        </el-col>
    </el-row>
  </div>
</template>

<script>
export default {
  name: 'App',
  methods: {
    handleOpen(key, keyPath) {
      console.log(key, keyPath);
    },
    handleClose(key, keyPath) {
      console.log(key, keyPath);
    },
    loginOut() {
       this.$http({url: '/api/admin/app/signout', method:'post', data: this.loginForm}).then(response => {
          this.$Message.success('退出成功');
          this.$router.push('/') 
      })
    }
  }
}
</script>

<style>
*{
    box-sizing: border-box;
}
html,body{
  margin: 0;
  padding: 0;
  height: 100%;
}
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  height: 100%;
}
.toxiang{
    width: 70px;
    height: 70px;
    margin: 30px auto 20px;
    border-radius: 50%;
    overflow: hidden;
}
.toxiang img{
    width: 100%;
}
.el-menu{
    border-right: 0;
}
.head-top{
    height: 50px;
    line-height: 50px;
    font-size: 14px;
    text-align: right;
    padding-right: 20px;
    border-bottom: 1px solid #eee;
    background: rgba(176, 210, 245, 0.28);
    color: #ff3b3b;
    /* position: absolute;
    top: 0;
    right: 0; */
}
.head-top span{
  cursor: pointer;
}
.content{
    padding: 0 20px;
    background: #f1f1f1;
    min-height: calc(100vh - 50px);
}
.my-page{
    padding: 20px 0;
}
</style>
