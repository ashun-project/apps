<template>
    <div>
        <el-form :inline="true" :model="formData" class="demo-form-inline">
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
        </el-form>
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
            <el-table-column label="操作" width="100">
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
        <el-dialog title="修改" :visible.sync="dialogFormVisible" class="edit">
            <el-form :model="dialogForm" label-width="120px">
                <el-form-item label="APP名称">
                    <el-input v-model="dialogForm.title" autocomplete="off" style="width: 220px"></el-input>
                </el-form-item>
                <el-form-item label="APP类型">
                     <el-select v-model="dialogForm.type" clearable placeholder="请选择">
                        <el-option
                        v-for="item in typeList"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item label="APP下载次数">
                    <el-input v-model="dialogForm.downloadTotal" autocomplete="off" style="width: 220px"></el-input>
                </el-form-item>
                <el-form-item label="APP评分">
                    <el-input v-model.number="dialogForm.score" autocomplete="off" style="width: 220px"></el-input>
                    <span style="color:red">最高评5分</span>
                </el-form-item>
                <el-form-item label="设为热门推荐">
                    <el-switch
                    v-model="dialogForm.hot"
                    active-value="1"
                    inactive-value="0"
                    active-color="#13ce66"
                    inactive-color="#ff4949">
                    </el-switch>
                </el-form-item>
                <el-form-item label="安卓下载连接">
                    <el-input v-model="dialogForm.androidUrl" autocomplete="off" style="width: 420px"></el-input>
                </el-form-item>
                <el-form-item label="IOS下载连接">
                    <el-input v-model="dialogForm.iosUrl" autocomplete="off" style="width: 420px"></el-input>
                </el-form-item>
                <el-form-item label="APP简介">
                    <el-input v-model="dialogForm.brief" type="textarea" :rows="3" autocomplete="off" style="width: 420px"></el-input>
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
            type: '',
            downloadTotal: '',
            score: '',
            hot: '',
            androidUrl: '',
            iosUrl: '',
            brief: ''
        },
        typeList: [
            {label: '棋牌', value: '1'},
            {label: '游戏', value: '2'},
            {label: '小说', value: '3'},
            {label: '视频', value: '4'},
            {label: '直播', value: '5'},
            {label: '其他', value: '6'}
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
            // debugger
            for (var key in this.dialogForm) {
                this.dialogForm[key] = row[key]
            }
            this.dialogFormVisible = true;
        },
        deleteRow(row) {
            this.$confirm('此操作将永久删除该APP, 是否继续?', '提示', {
                confirmButtonText: '确定',
                cancelButtonText: '取消',
                type: 'warning',
                center: true
            }).then(() => {
                this.$http({url: '/api/admin/app/delete',  method:'post', data: {id: row.id}}).then(response => {
                    this.$Message.success('删除成功');
                    this.getList();
                })
            }).catch(() => {});
        },
        confirmDialog() {
            var obj = Object.assign({}, this.dialogForm);
            var err = '';
            obj.downloadTotal = Number(obj.downloadTotal);
            obj.score = Number(obj.score);
            if(!obj.score) {
                this.$message.err('请设置评分')
                err = '请设置评分';
            }
            if (!obj.androidUrl && !obj.iosUrl ) {
                err = '最少设置一个下载连接';
            }
            if (obj.score && obj.score > 5) {
                err = '评分最高设置5分';
            }
            if (err) {
                this.$Message.error(err)
                return
            }
            if (obj.androidUrl && obj.iosUrl) {
                obj.device = 2;
            } else if (obj.androidUrl) {
                obj.device = 3;
            } else {
                obj.device = 1;
            }
            this.$http({url: '/api/admin/app/edit', method:'post', data: obj}).then(response => {
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
            this.$http({url: '/api/admin/app/list', method:'post', data: this.formData}).then(response => {
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