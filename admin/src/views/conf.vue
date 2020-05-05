<template>
    <div>
        <div style="height: 20px"></div>
        <div class="formDate">
            <el-form :model="formDate" label-width="120px">
                    <el-form-item label="联系QQ">
                        <el-input v-model="formDate.qq" :disabled="!updateModal" autocomplete="off" style="width: 320px"></el-input>
                    </el-form-item>
                    <el-form-item label="联系telegram">
                        <el-input v-model="formDate.telegram" :disabled="!updateModal" autocomplete="off" style="width: 320px"></el-input>
                    </el-form-item>
                   <el-form-item label="公告内容">
                        <el-input v-model="formDate.notice" :disabled="!updateModal" type="textarea" rows="3" autocomplete="off" style="width: 320px"></el-input>
                    </el-form-item>
            </el-form>
            <div class="dialog-footer">
                <el-button type="default" v-if="updateModal" size="small" @click="cancleModal">取 消</el-button>
                <el-button type="primary" v-if="updateModal" size="small" @click="confirmDialog">确 定</el-button>
                <el-button type="danger" v-if="!updateModal" size="small" @click="updateModal = true">修 改</el-button>
            </div>
        </div>
    </div>
</template>


<script>
var obj = {};
var loading = '';
  export default {
    data() {
      return {
        updateModal: false,
        formDate: {
            qq: '',
            telegram: '',
            notice: '',
            id: ''
        }
      };
    },
    created() {
        this.$http({url: '/api/admin/app/conf', method:'post', data: {} }).then(response => {
            this.formDate = response.data[0] || {}
            obj = response.data[0] || {}
        })
    },
    methods: {
        cancleModal() {
            this.formDate = Object.assign({}, obj);
            this.updateModal = false
        },
        confirmDialog() {
            this.$http({url: '/api/admin/app/updateConf', method:'post', data: this.formDate }).then(response => {
                if (response.code == -1) {
                    this.$Message.success(response.message);
                } else {
                    this.$Message.success('修改成功');
                    this.updateModal = false
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
