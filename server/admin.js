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

// 登入
router.post('/admin/app/login',function(req, res){
    var params = req.body;
    if (params.userName === 'zybadmin' && params.password === 'zyb123123') {
        req.session.loginUser = {userName: params.userName, code: 0};
        res.json({code: 0, message: '登入成功'})
    } else {
        res.json({code: -1, message: '登入失败'})
    }
})

// 退出登录
router.post('/admin/app/signout', function (req, res, next) {
    req.session.loginUser = null;
    res.clearCookie('testapp');
    res.json({message:'退出成功', code: 0});
});

// 列表页
router.post('/admin/app/list',function(req, res){
    var loginUser = req.session.loginUser;
    if (!loginUser || !loginUser.userName) {
        res.json({code: 3301, message: '请重新登录'})
        return;
    }
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
    var loginUser = req.session.loginUser;
    if (!loginUser || !loginUser.userName) {
        res.json({code: 3301, message: '请重新登录'})
        return;
    }
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
    var loginUser = req.session.loginUser;
    if (!loginUser || !loginUser.userName) {
        res.json({code: 3301, message: '请重新登录'})
        return;
    }
    var params = req.body;
    var sqlUpdate = "UPDATE data_list SET hot = 0 WHERE id = " + params.id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sqlUpdate, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})

// banner上传
router.post('/admin/app/updatebanner',function(req, res){
    var loginUser = req.session.loginUser;
    if (!loginUser || !loginUser.userName) {
        res.json({code: 3301, message: '请重新登录'})
        return;
    }
    var params = req.body;
    var sqList = "INSERT INTO banners(name, open_url, img_url, create_time) VALUES ?";
    var sqListInfo = [[params.name, params.open_url, params.img_url, new Date()]];
    pool.getConnection(function (err, conn) {
        conn.query(sqList, [sqListInfo], function (err, rows, fields) {
            if (err) console.log("updatebanner /==> " + err);
            common.moveFile('banner', params.img_url);
            common.result(res, conn, err, '')
        })
    })
})

// 删除
router.post('/admin/banner/delete',function(req, res){
    var loginUser = req.session.loginUser;
    if (!loginUser || !loginUser.userName) {
        res.json({code: 3301, message: '请重新登录'})
        return;
    }
    var sql = "DELETE from banners WHERE id = " + req.body.id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})


// 审核列表页
router.post('/admin/app/shenheList',function(req, res){
    var params = req.body;
    var limit = Number(params.page) || 1;
    var pageSize = params.pageSize || 10;
    var limitBefore = ((limit - 1) * pageSize);
    var sql = "select * FROM data_list where status = 0 order by create_time desc limit " + limitBefore + "," + pageSize;
    var sqlCount =  "select COUNT(1) FROM data_list where status = 0";
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

// 审核
router.post('/admin/app/shenheUpdate',function(req, res){
    var params = req.body;
    var sqlUpdate = "UPDATE data_list SET status = 1 WHERE id = " + params.id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sqlUpdate, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})


// 友情连接
router.post('/admin/app/frienlyList',function(req, res){
    var loginUser = req.session.loginUser;
    if (!loginUser || !loginUser.userName) {
        res.json({code: 3301, message: '请重新登录'})
        return;
    }
    var params = req.body;
    var limit = Number(params.page) || 1;
    var pageSize = params.pageSize || 10;
    var limitBefore = ((limit - 1) * pageSize);
    var sql = "select * FROM friendly order by create_time desc limit " + limitBefore + "," + pageSize;
    var sqlCount =  "select COUNT(1) FROM friendly";
    if (params.title && params.url) {
        sql = "select * FROM friendly where title = '"+ params.title +"' and url = '"+ params.url +"' order by create_time desc limit " + limitBefore + "," + pageSize;
        sqlCount = "select COUNT(1) FROM friendly where title = '"+ params.title +"' and url = '"+ params.name +"'";
    } else if (params.title) {
        sql = "select * FROM friendly where title = '"+ params.title +"' order by create_time desc limit " + limitBefore + "," + pageSize;
        sqlCount = "select COUNT(1) FROM friendly where title = '"+ params.title +"'";
    } else if (params.url) {
        sql = "select * FROM friendly where url = '"+ params.url +"' order by create_time desc limit " + limitBefore + "," + pageSize;
        sqlCount = "select COUNT(1) FROM friendly where url = '"+ params.url +"'";
    }
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            var arr = [];
            if (!err) {
                for (var i = 0; i < result.length; i++) {
                    arr.push({
                        id: result[i].id,
                        title: result[i].title,
                        date: common.getFormatDate(result[i].create_time),
                        url: result[i].url
                    })
                }
            }
            conn.query(sqlCount, function (err, count) {
                var total = 0;
                if (count && count[0]) {
                    total = count[0]['COUNT(1)'];
                }
                common.result(res, conn, err, {list: arr, total: total})
            })
            
        })
    })
})
router.post('/admin/frienlyListAll',function(req, res){
    var sql = "select * FROM friendly order by create_time desc";
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            common.result(res, conn, err, result)
        })
    })
})
// 友联修改
router.post('/admin/app/friendlyUpdate',function(req, res){
    var params = req.body;
    var sqlUpdate = "UPDATE friendly SET url = '"+ params.url +"', title = '"+ params.title +"' WHERE id = " + params.id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sqlUpdate, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})

// 友联添加
router.post('/admin/app/addFriendly',function(req, res){
    // var loginUser = req.session.loginUser;
    // if (!loginUser || !loginUser.userName) {
    //     res.json({code: 3301, message: '请重新登录'})
    //     return;
    // }
    var params = req.body;
    var sqList = "INSERT INTO friendly(title, url, create_time) VALUES ?";
    var sqListInfo = [[params.title, params.url, new Date()]];
    pool.getConnection(function (err, conn) {
        conn.query(sqList, [sqListInfo], function (err, rows, fields) {
            if (err) console.log("friendly /==> " + err);
            common.result(res, conn, err, '')
        })
    })
})

// 删除友连
router.post('/admin/app/deleteFriendly',function(req, res){
    var sql = "DELETE from friendly WHERE id = " + req.body.id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("friendly /==> " + err);
        conn.query(sql, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})


module.exports = router;