<template>
    <div>
        <el-form v-if="admin" :inline="true" :model="formData" class="demo-form-inline">
            <el-form-item label="名称">
                <el-input v-model="formData.name" placeholder="名称"></el-input>
            </el-form-item>
            <el-form-item label="URL">
                <el-input v-model="formData.url" placeholder="url"></el-input>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="onSubmit">添加</el-button>
            </el-form-item>
        </el-form>
        <div class="mask" @click="showMask"></div>
        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="date" label="日期" width="150"></el-table-column>
            <el-table-column prop="name" label="姓名"></el-table-column>
            <el-table-column prop="url" label="url"></el-table-column>
            <el-table-column label="操作" width="100">
                <template slot-scope="scope">
                    <el-button v-if="admin" @click="deleteRow(scope.row)" type="text" size="small">删除</el-button>
                    <!-- <el-button type="text" size="small">编辑</el-button> -->
                </template>
            </el-table-column>
        </el-table>
    </div>
</template>

<script>
export default {
    data() {
      return {
        formData: {
            name: '',
            url: '',
            type: 'sb'
        },
        admin: false,
        tableData: [],
        num: 0
      }
    },
    methods: {
        onSubmit() {
            this.$http({url: '/friendly/add',  method:'post', data: this.formData}).then(response => {
                this.getList();
            })
        },
        deleteRow(row) {
            this.$http({url: '/friendly/delete',  method:'post', data: {id: row.id}}).then(response => {
                this.getList();
            })
        },
        getList() {
            this.$http({url: '/friendly/list',  method:'post'}).then(response => {
                this.tableData = response.list.data;
            })
        },
        showMask() {
            this.num += 1;
            if (this.num > 5) {
                this.admin = true;
            }
        }
    },
    created() {
        this.getList();
    }
}
</script>

<style scoped>
    .mask{
        position: fixed;
        top: 0;
        right: 0;
        height: 60px;
        width: 60px;
        opacity: 0;
    }
</style>