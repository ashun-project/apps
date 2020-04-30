<template>
    <div>
        <el-form :inline="true" :model="formData" class="demo-form-inline">
            <el-form-item label="名称">
                <el-input v-model="formData.title" clearable placeholder="名称"></el-input>
            </el-form-item>
            <el-form-item label="url">
                <el-input v-model="formData.url" clearable placeholder="url"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchList">搜索</el-button>
            </el-form-item>
             <el-form-item>
                <el-button type="primary" @click="editRow({})">添加</el-button>
            </el-form-item>
        </el-form>
        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="date" align="center" label="日期"></el-table-column>
            <el-table-column prop="title" align="center" label="名称"></el-table-column>
            <el-table-column prop="url" align="center" label="url"></el-table-column>
            <el-table-column label="操作" width="160" align="center">
                <template slot-scope="scope">
                    <el-button type="text" size="small" @click="editRow(scope.row)">修改</el-button>
                    <el-button style="color:red" @click="deleteRow(scope.row)" type="text" size="small">删除</el-button>
                    <!-- <el-button type="text" size="small">编辑</el-button> -->
                </template>
            </el-table-column>
        </el-table>
       <div class="my-page" v-if="tableData.length">
            <el-pagination background layout="prev, pager, next" :page-size="formData.pageSize"  :total="total" @current-change="handleCurrentChange"></el-pagination>
       </div>

        <!-- 对话框 -->
        <el-dialog :title="titleTxt" :visible.sync="dialogFormVisible" width="400px" class="edit">
            <el-form :model="dialogForm" label-width="90px">
                <el-form-item label="APP名称">
                    <el-input v-model="dialogForm.title" autocomplete="off" style="width: 220px"></el-input>
                </el-form-item>
                <el-form-item label="url">
                    <el-input v-model.number="dialogForm.url" autocomplete="off" style="width: 220px"></el-input>
                </el-form-item>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogFormVisible = false">取 消</el-button>
                <el-button type="primary" @click="confirmDialog">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
export default {
    data() {
      return {
        formData: {
            title: '',
            url: '',
            page: 1,
            pageSize: 10
        },
        titleTxt: '',
        dialogFormVisible: false,
        dialogForm: {
            id: '',
            title: '',
            url: '',
        },
        total: 0,
        tableData: [],
        num: 0
      }
    },
    created() {
        this.getList();
    },
    methods: {
        searchList() {
            this.formData.page = 1;
            this.getList();
        },
        editRow(row) {
            // debugger
            if (row.id) {
                this.titleTxt = '修改';
            } else {
                this.titleTxt = '添加';
            }
            for (var key in this.dialogForm) {
                this.dialogForm[key] = row[key]
            }
            this.dialogFormVisible = true;
        },
        deleteRow(row) {
            this.$confirm('此操作将永久删除该友连, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning',
                center: true
            }).then(() => {
                this.$http({url: '/api/admin/app/deleteFriendly',  method:'post', data: {id: row.id}}).then(response => {
                    this.$Message.success('删除成功');
                    this.getList();
                })
            }).catch(() => {});
        },
        confirmDialog() {
            var obj = Object.assign({}, this.dialogForm);
            var err = '';
            var url = '/api/admin/app/addFriendly';
            if(!obj.url || !obj.title) {
                err = '请填写完整内容';
            }
            if (err) {
                this.$Message.error(err)
                return
            }
            if (obj.id) {
                url = '/api/admin/app/friendlyUpdate'
            }
            this.$http({url: url, method:'post', data: obj}).then(response => {
                this.dialogFormVisible = false;
                this.$Message.success('修改成功');
                this.getList();
            })
        },
        handleCurrentChange(page) {
            this.formData.page = page;
            this.getList();
        },
        getList() {
            this.$http({url: '/api/admin/app/frienlyList', method:'post', data: this.formData}).then(response => {
                this.tableData = response.data.list;
                this.total = response.data.total;
            })
        }
    }
}
</script>

<style scoped>
    .demo-form-inline{
        background: #fff;
        margin: 0 -20px 20px;
        padding: 20px 20px 10px;
    }
    .el-form-item{
        margin-bottom: 10px;
    }
    .dialog-footer{
        text-align: center;
    }
    .dialog-footer button{
        width: 40%;
    }
</style>