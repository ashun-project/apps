<template>
    <div>
        <!-- <el-form :inline="true" :model="formData" class="demo-form-inline">
            <el-form-item label="名称">
                <el-input v-model="formData.name" clearable placeholder="名称"></el-input>
            </el-form-item>
            <el-form-item label="类型">
                <el-select v-model="formData.type" clearable placeholder="请选择">
                    <el-option
                    v-for="item in typeList"
                    :key="item.value"
                    :label="item.label"
                    :value="item.value">
                    </el-option>
                </el-select>
            </el-form-item>
            <el-form-item>
                <el-button type="primary" @click="searchList">搜索</el-button>
            </el-form-item>
        </el-form> -->
         <div style="height: 20px"></div>
        <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="date" align="center" label="日期" width="150"></el-table-column>
            <el-table-column prop="title" align="center" label="名称"></el-table-column>
            
            <el-table-column prop="downloadTotal" align="center"  width="80" label="下载次数"></el-table-column>
            <el-table-column prop="type" align="center" width="60" label="类型">
                <template slot-scope="scope">
                    <span>{{ scope.row.type | getTypgeList}}</span>
                </template>
            </el-table-column>
            <el-table-column prop="androidUrl" align="center" label="安卓连接">
                <template slot-scope="scope">
                    <div>{{ scope.row.androidUrl }}</div>
                </template>
            </el-table-column>
            <el-table-column prop="iosUrl" align="center" label="IOS连接">
                <template slot-scope="scope">
                    <div>{{ scope.row.iosUrl }}</div>
                </template>
            </el-table-column>
            <!-- <el-table-column prop="brief" align="center" label="简介">
                <template slot-scope="scope">
                    <div style="max-height: 65px;overflow:hidden;text-overflow: ellipsis;">{{ scope.row.brief }}</div>
                </template>
            </el-table-column> -->
            <el-table-column prop="qq" align="center" label="QQ"></el-table-column>
            <el-table-column label="操作" align="center" width="100">
                <template slot-scope="scope">
                    <el-button type="text" size="small" @click="editRow(scope.row)">审核</el-button>
                    <!-- <el-button type="text" size="small">编辑</el-button> -->
                </template>
            </el-table-column>
        </el-table>
       <div class="my-page" v-if="tableData.length">
            <el-pagination background layout="prev, pager, next" :page-size="formData.pageSize"  :total="total" @current-change="handleCurrentChange"></el-pagination>
       </div>

        <!-- 对话框 -->
        <el-dialog title="修改" :visible.sync="dialogFormVisible" class="edit">
            <el-form :model="dialogForm" label-width="120px">
                <el-form-item label="APP名称">
                    <b>{{ dialogForm.title }}</b>
                </el-form-item>
                <el-form-item label="APP类型">
                     <el-select v-model="dialogForm.status" clearable placeholder="请选择">
                        <el-option
                        v-for="item in statusList"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                        </el-option>
                    </el-select>
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
            name: '',
            type: '',
            page: 1,
            pageSize: 10
        },
        dialogFormVisible: false,
        dialogForm: {
            id: '',
            title: '',
            status: 1
        },
        typeList: [
            {label: '棋牌', value: '1'},
            {label: '游戏', value: '2'},
            {label: '小说', value: '3'},
            {label: '视频', value: '4'},
            {label: '直播', value: '5'},
            {label: '其他', value: '6'}
        ],
        statusList: [
            {label: '通过', value: 1},
            {label: '失败', value: 2}
        ],
        total: 0,
        tableData: [],
        num: 0
      }
    },
    filters: {
        getTypgeList(num) {
            var typeList = ['', '棋牌', '游戏', '小说', '视频', '直播', '其他'];
            return typeList[num]
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
            this.dialogForm.title = row.title;
            this.dialogForm.id = row.id;
            this.dialogFormVisible = true;
        },
        confirmDialog() {
            var obj = Object.assign({}, this.dialogForm);
            this.$http({url: '/api/admin/app/shenheUpdate', method:'post', data: obj}).then(response => {
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
            this.$http({url: '/api/admin/app/shenheList', method:'post', data: this.formData}).then(response => {
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
</style>