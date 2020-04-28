<template>
    <div>
        <el-form :inline="true" :model="formData" class="demo-form-inline">
            <el-form-item>
                <el-button type="primary" size="small" @click="$router.push('/addbanner')">添加</el-button>
            </el-form-item>
        </el-form>
         <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="createTime" align="center" label="日期" width="150"></el-table-column>
            <el-table-column prop="img_url" align="center" label="图片名称"></el-table-column>
            
            <el-table-column prop="open_url" align="center" label="跳转地址"></el-table-column>
            
            <el-table-column label="操作" width="100">
                <template slot-scope="scope">
                    <el-button style="color:red" @click="deleteRow(scope.row)" type="text" size="small">删除</el-button>
                    <!-- <el-button type="text" size="small">编辑</el-button> -->
                </template>
            </el-table-column>
        </el-table>
        <!-- <div class="my-page" v-if="tableData.length">
            <el-pagination background layout="prev, pager, next" :page-size="formData.pageSize"  :total="total" @current-change="handleCurrentChange"></el-pagination>
       </div> -->
    </div>
</template>

<script>
export default {
    data() {
        return {
            tableData: [],
            total: 0,
            formData: {
                page: 1,
                pageSize: 10
            }
        }
    },
    created() {
        this.getList();
    },
    methods: {
        handleCurrentChange(page) {
            this.formData.page = page;
            this.getList();
        },
        deleteRow(row) {
            this.$confirm('此操作将永久删除该轮播图, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning',
                center: true
            }).then(() => {
                this.$http({url: '/api/admin/banner/delete',  method:'post', data: {id: row.id}}).then(response => {
                    this.$Message.success('删除成功');
                    this.getList();
                })
            }).catch(() => {});
        },
        getList() {
            this.$http({url: '/api/banners', method:'post', data: this.formData}).then(response => {
                this.tableData = response.data;
                // this.total = response.data.total;
            })
        }
    },
    
}
</script>

<style scoped>
  .demo-form-inline{
        background: #fff;
        margin: 0 -20px 20px;
        padding: 15px 20px 5px 30px;
    }
.el-form-item{
        margin-bottom: 10px;
    }
</style>