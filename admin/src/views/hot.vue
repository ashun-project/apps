<template>
    <div>
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
            <el-table-column label="操作" width="100">
                <template slot-scope="scope">
                    <el-button style="color:red" @click="xiajiaRow(scope.row)" type="text" size="small">下架热门</el-button>
                    <!-- <el-button type="text" size="small">编辑</el-button> -->
                </template>
            </el-table-column>
        </el-table>
        <div class="my-page" v-if="tableData.length">
            <el-pagination background layout="prev, pager, next" :page-size="formData.pageSize"  :total="total" @current-change="handleCurrentChange"></el-pagination>
       </div>
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
        handleCurrentChange(page) {
            this.formData.page = page;
            this.getList();
        },
        xiajiaRow(row) {
            this.$http({url: '/api/admin/app/xiajia', method:'post', data: {id: row.id}}).then(response => {
                this.$Message.success('下架成功');
                this.getList();
            })
        },
        getList() {
            this.$http({url: '/api/admin/app/hot', method:'post', data: this.formData}).then(response => {
                this.tableData = response.data.list;
                this.total = response.data.total;
            })
        }
    },
    
}
</script>

<style scoped>
</style>