<template>
    <div>
        <div style="height: 20px"></div>
        <div class="formDate">
            <el-form :model="formDate" label-width="120px">
                    <el-form-item label="轮播图名称">
                        <el-input v-model="formDate.name" autocomplete="off" style="width: 220px"></el-input>
                    </el-form-item>
                    <el-form-item label="跳转地址">
                        <el-input v-model="formDate.open_url" autocomplete="off" style="width: 220px"></el-input>
                    </el-form-item>
                    <el-form-item label="轮播图">
                        <el-upload
                            class="avatar-uploader"
                            action="/api/upload"
                            :show-file-list="false"
                            :on-success="handleAvatarSuccess"
                            :before-upload="beforeAvatarUpload">
                            <img v-if="imageUrl" :src="imageUrl" class="avatar">
                            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
                            </el-upload>
                    </el-form-item>
            </el-form>
            <div class="dialog-footer">
                    <el-button @click="gotoList" size="small">查看列表</el-button>
                    <el-button type="primary" size="small" @click="confirmDialog">确 定</el-button>
            </div>
        </div>
    </div>
</template>


<script>
var loading = '';
  export default {
    data() {
      return {
        imageUrl: '',
        formDate: {
            open_url: '',
            img_url: '',
            name: ''
        }
      };
    },
    methods: {
        handleAvatarSuccess(res, file) {
            this.formDate.img_url = res.fileName;
            this.imageUrl = URL.createObjectURL(file.raw);
            loading.close();
        },
        beforeAvatarUpload(file) {
            loading = this.$loading({
                lock: true,
                text: '上传中...',
                spinner: 'el-icon-loading',
                background: 'rgba(0, 0, 0, 0.7)'
            });
            const isJPG = file.type === 'image/jpeg';
            const isLt2M = file.size / 1024 / 1024 < 2;
            // if (!isJPG) {
            //   this.$message.error('上传头像图片只能是 JPG 格式!');
            // }
            // if (!isLt2M) {
            //   this.$message.error('上传头像图片大小不能超过 2MB!');
            // }
            // return isJPG && isLt2M;
            return true
        },
        gotoList() {
            this.$router.push('/banner');
        },
        confirmDialog() {
            if (!this.formDate.img_url) {
                this.$Message.error('没有获取到图片地址，请重新上传');
                return;
            }
            this.$http({url: '/api/admin/app/updatebanner', method:'post', data: this.formDate }).then(response => {
                if (response.code == -1) {
                    this.$Message.success(response.message);
                } else {
                    this.$Message.success('添加成功');
                     this.$router.push('/banner');
                }
            })
        }
    }
  }
</script>

<style>
  .avatar-uploader .el-upload {
    border: 1px dashed #d9d9d9;
    border-radius: 6px;
    cursor: pointer;
    position: relative;
    overflow: hidden;
  }
  .avatar-uploader .el-upload:hover {
    border-color: #409EFF;
  }
  .avatar-uploader-icon {
    font-size: 28px;
    color: #8c939d;
    width: 460px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
  .el-icon-plus{
      background: #eee;
  }
  .formDate{
      background: #fff;
      padding: 50px 20px;
  }
  .dialog-footer{
      padding-left: 120px;
      padding-top: 20px;
  }
  .avatar-uploader .el-upload{
      width: 460px;
  }
  .avatar-uploader .el-upload img{
      width: auto !important;
        max-width: 100%
  }
</style>
