<template>
    <div>
        <div style="height: 20px"></div>
         <el-table :data="tableData" border style="width: 100%">
            <el-table-column prop="createTime" align="center" label="日期" width="150"></el-table-column>
            <el-table-column prop="img_url" align="center" label="图片名称"></el-table-column>
            
            <el-table-column prop="open_url" align="center" label="跳转地址"></el-table-column>
            
            <el-table-column label="操作" width="100">
                <template slot-scope="scope">
                    <el-button style="color:red" @click="xiajiaRow(scope.row)" type="text" size="small">删除</el-button>
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
            this.$http({url: '/api/banners', method:'post', data: this.formData}).then(response => {
                this.tableData = response.data;
                // this.total = response.data.total;
            })
        }
    },
    
}
</script>

<style scoped>
</style>