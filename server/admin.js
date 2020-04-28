var express = require('express');
var router = express.Router();
var mysql = require('mysql');
var common = require('./common');
var pool = mysql.createPool({
    connectionLimit: 100,
    host: 'localhost',
    user: 'root',
    port: 3306,
    password: 'ashun666',
    database: 'zyb'
});

// 列表页
router.post('/admin/app/list',function(req, res){
    var params = req.body;
    var limit = Number(params.page) || 1;
    var pageSize = params.pageSize || 10;
    var limitBefore = ((limit - 1) * pageSize);
    var sql = "select * FROM data_list order by create_time desc limit " + limitBefore + "," + pageSize;
    var sqlCount =  "select COUNT(1) FROM data_list";
    if (params.name && params.type) {
        sql = "select * FROM data_list where type = '"+ params.type +"' and title like '%"+ params.name +"%' order by create_time desc limit " + limitBefore + "," + pageSize;
        sqlCount = "select COUNT(1) FROM data_list where type = '"+ params.type +"' and title like '%"+ params.name +"%'";
    } else if (params.name) {
        sql = "select * FROM data_list where title like '%"+ params.name +"%' order by create_time desc limit " + limitBefore + "," + pageSize;
        sqlCount = "select COUNT(1) FROM data_list where title like '%"+ params.name +"%'";
    } else if (params.type) {
        sql = "select * FROM data_list where type = '"+ params.type +"' order by create_time desc limit " + limitBefore + "," + pageSize;
        sqlCount = "select COUNT(1) FROM data_list where type = '"+ params.type +"'";
    }
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            var arr = [];
            if (!err) {
                for (var i = 0; i < result.length; i++) {
                    arr.push({
                        id: result[i].id,
                        logo: '/images/img/logo/' + result[i].logo,
                        title: result[i].title,
                        brief: result[i].brief,
                        downloadTotal: result[i].download_total || 0,
                        androidUrl: result[i].android_download,
                        iosUrl: result[i].ios_download,
                        date: common.getFormatDate(result[i].create_time),
                        type: result[i].type,
                        score: result[i].score,
                        hot: result[i].hot,
                        qq: result[i].qq
                    })
                }
            }
            conn.query(sqlCount, function (err, count) {
                var total = count[0]['COUNT(1)'] || 0;
                common.result(res, conn, err, {list: arr, total: total})
            })
            
        })
    })
})

// 列表页
router.post('/admin/app/edit',function(req, res){
    var params = req.body;
    var sqlUpdate = "UPDATE data_list SET download_total = " + params.downloadTotal || 0;
    sqlUpdate += ", device = " + params.device;
    sqlUpdate += ", android_download = '" + params.androidUrl + "'";
    sqlUpdate += ", ios_download = '" + params.iosUrl + "'";
    sqlUpdate += ", hot = '" + params.hot + "'";
    sqlUpdate += ", score = '" + params.score + "'";
    sqlUpdate += ", title = '" + params.title + "'";
    sqlUpdate += ", type = '" + params.type + "'";
    sqlUpdate += ", brief = '" + params.brief + "'";
    sqlUpdate += " WHERE id = " + params.id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sqlUpdate, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})

// 删除
router.post('/admin/app/delete',function(req, res){
    var sql = "DELETE from data_list WHERE id = " + req.body.id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})

// 获取推荐列表
router.post('/admin/app/hot',function(req, res){
    var params = req.body;
    var limit = Number(params.page) || 1;
    var pageSize = params.pageSize || 10;
    var limitBefore = ((limit - 1) * pageSize);
    var sql = "select * FROM data_list WHERE hot = 1 order by create_time desc limit " + limitBefore + "," + pageSize;
    var sqlCount =  "select COUNT(1) FROM data_list WHERE hot = 1";
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            var arr = [];
            if (!err) {
                for (var i = 0; i < result.length; i++) {
                    arr.push({
                        id: result[i].id,
                        title: result[i].title,
                        brief: result[i].brief,
                        downloadTotal: result[i].download_total || 0,
                        androidUrl: result[i].android_download,
                        iosUrl: result[i].ios_download,
                        date: common.getFormatDate(result[i].create_time),
                        type: result[i].type,
                        score: result[i].score,
                        hot: result[i].hot,
                        qq: result[i].qq
                    })
                }
            }
            conn.query(sqlCount, function (err, count) {
                var total = count[0]['COUNT(1)'] || 0;
                common.result(res, conn, err, {list: arr, total: total})
            })
        })
    })
})

// 下架
router.post('/admin/app/xiajia',function(req, res){
    var params = req.body;
    var sqlUpdate = "UPDATE data_list SET hot = 0 WHERE id = " + params.id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sqlUpdate, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})





module.exports = router;