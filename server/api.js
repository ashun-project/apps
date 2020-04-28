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

//form表单需要的中间件。
var mutipart= require('connect-multiparty');
var mutipartMiddeware = mutipart({
    uploadDir: './public/tmp'
});
// 允许跨域
router.all('*', function(req, res, next) {
  res.header("Access-Control-Allow-Origin", "*");
  res.header("Access-Control-Allow-Headers", "Content-Type,Content-Length, Authorization, Accept,X-Requested-With");
  res.header("Access-Control-Allow-Methods","PUT,POST,GET,DELETE,OPTIONS");
  res.header("X-Powered-By",' 3.2.1')
  if(req.method=="OPTIONS") res.sendStatus(200);/*让options请求快速返回*/
  else  next();
});


// 文件上传
router.post('/upload',mutipartMiddeware,function (req,res) {  
    var fileName = '';
    var code = -1;
    if (req.files && req.files.file && req.files.file.path) {
        code = 200;
        fileName = req.files.file.path.replace(/\\/g, '\/').replace('public/tmp/', '');
    };
    res.json({code: code, fileName: fileName});
});

// 添加数据
router.post('/insertIntoDataList',function(req,res){
    var params = req.body;
    pool.getConnection(function (err, conn) {
        /* 
            title: app名字
            brief： 简介
            logo： logo 文件名 （规格90* 90）
            ios_download： ios下载链接
            android_download： android 下载链接
            device: 设备类型（1: ios, 2: all 3: andriod ）
            remarks： 备注
            detail_imgs： 详情图文件名（字符串类型 逗号分隔）规格190* 315）
            type： 分类 (1:棋牌，2：游戏， 3小说，4：视频，5：直播， 6其他)

            // 预留字段
            create_time：创建时间
            download_total: 下载量
            score:  评分
        */
        var sqList = "INSERT INTO data_list(title, create_time, brief, logo, ios_download, android_download, remarks, detail_imgs, type, device, qq, score) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        var sqListInfo = [params.title, new Date(), params.brief, params.logo, params.iosDownload, params.androidDownload, params.remarks, params.detailImgs, params.type, params.device, params.qq, (Math.random()*5).toFixed(1)];
        conn.query(sqList, sqListInfo, function (err, rows, fields) {
            // 迁移文件
            if (!err) {
                common.moveFile('logo', params.logo);
                if (params.detailImgs) {
                    var detailImgs = params.detailImgs.split(',');
                    for (var i = 0; i < detailImgs.length; i++) {
                        if (detailImgs[i]) {
                            common.moveFile('detail', detailImgs[i]);
                        }
                    }
                }
            }
            common.result(res, conn, err)
        });
    })
})

// banner添加跟设置
router.post('/banners',function(req,res){
    var host = req.headers['host'];
    var sql = "select * FROM banners where expire_time <= '2020-08-28 16:06:30'"
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            result = result.map(function(item) {
                item.host = '/images/img/banner/';
                item.createTime = common.getFormatDate(item.create_time);
                return item;
            })
            common.result(res, conn, err, result)
        })
    })
})
router.post('/setBanners',function(req,res){
    var date = new Date();
    var time = date.getTime() + (30 * 24 * 60 * 60 * 1000);
    var params = req.body;
    var sql = "INSERT INTO banners(open_url, img_url, create_time, expire_time) VALUES (?,?,?,?)";
    var sqInfo = [params.open_url, params.img_url, date, new Date(time)];
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, sqInfo, function (err, result) {
            common.result(res, conn, err)
        })
    })
})

// 热门应用
router.post('/hots',function(req, res){
    var sql = '';
    var host = req.headers['host'];
    var device = common.getdevice(req);
    if (device > 2) {
        sql = "select * FROM data_list where hot = "+ '1' + " and device >= 2 order by create_time ASC limit 5";
    } else {
        sql = "select * FROM data_list where hot = "+ '1' + " and device <= 2 order by create_time ASC limit 5";
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
                        downloadUrl: device > 2 ? result[i].android_download : result[i].ios_download
                    })
                }
            }
            common.result(res, conn, err, arr)
        })
    })
})

// 首页列表
router.post('/indexList',function(req, res){
    var host = req.headers['host'];
    var device = common.getdevice(req);
    var sql = '';
    if (device > 2) {
        sql = "select * FROM data_list where device >= 2 order by download_total desc limit " + req.body.pageSize;
    } else {
        sql = "select * FROM data_list where device <= 2 order by download_total desc limit " + req.body.pageSize;
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
                        type: result[i].type,
                        downloadTotal: result[i].download_total || 0,
                        downloadUrl: device > 2 ? result[i].android_download : result[i].ios_download
                    })
                }
            }
            common.result(res, conn, err, arr)
        })
    })
})

// 列表页
router.post('/list',function(req, res){
    var params = req.body;
    var host = req.headers['host'];
    var device = common.getdevice(req);
    var limit = Number(params.page) || 1;
    var limitBefore = ((limit - 1) * 10);
    var sql = '';
    if (device > 2) {
        sql = "select * FROM data_list where type = '"+ params.type +"' and device >= 2 order by download_total desc limit " + limitBefore + "," + 10;
    } else {
        sql = "select * FROM data_list where type = '"+ params.type +"' and device <= 2 order by download_total desc limit " + limitBefore + "," + 10;
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
                        downloadUrl: device > 2 ? result[i].android_download : result[i].ios_download
                    })
                }
            }
            common.result(res, conn, err, arr)
        })
    })
})

// 应用详情
router.post('/detail',function(req,res){
    var params = req.body;
    var host = req.headers['host'];
    var sql = "select * FROM data_list where id = '"+ params.id + "'";
    var sqlDiscuss = "select COUNT(1) FROM discuss where app_id = '"+ params.id + "'";
    var device = common.getdevice(req);
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            conn.query(sqlDiscuss, function (errC, total) {
                var data = result[0] || {};
                var obj = {};
                if (!err) {
                    obj.id = data.id;
                    obj.logo = '/images/img/logo/' + data.logo;
                    obj.title = data.title;
                    obj.brief = data.brief;
                    obj.detailImgs = data.detail_imgs || '';
                    obj.imgHost = '/images/img/detail/';
                    obj.downloadTotal = data.download_total || 0;
                    obj.downloadUrl = device > 2 ? data.android_download : data.ios_download;
                    obj.discussTotal = Number(total[0]['COUNT(1)']) || 0;
                    obj.score = data.score;
                    obj.type = data.type;
                }
                common.result(res, conn, err, obj);
            })
        })
    })
})

// 类似应用
router.post('/likeness',function(req,res){
    var params = req.body;
    var pageSize = params.pageSize || 5;
    var host = req.headers['host'];
    var device = common.getdevice(req);
    var sql = "";
    if (device > 2) {
        sql = "select * FROM data_list where type = '"+ params.type + "' and device >= 2 order by download_total desc limit " + pageSize;
    } else {
        sql = "select * FROM data_list where type = '"+ params.type + "' and device <= 2 order by download_total desc limit " + pageSize;
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
                        downloadUrl: device > 2 ? result[i].android_download : result[i].ios_download
                    })
                }
            }
            common.result(res, conn, err, arr)
        })
    })
})

// 评论条数--评论
router.post('/discussList',function(req, res){
    var params = req.body;
    var limit = Number(params.page) || 1;
    var limitBefore = ((limit - 1) * 10);
    var sql = "select * FROM discuss where app_id = '"+ params.id + "' order by create_time desc limit " + limitBefore + "," + 10;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            var arr = [];
            if (!err) {
                for (var i = 0; i < result.length; i++) {
                    arr.push({
                        account: result[i].account,
                        content: result[i].content,
                        createTime: common.getFormatDate(result[i].create_time)
                    })
                }
            }
            common.result(res, conn, err, arr)
        })
    })
})
router.post('/discuss',function(req, res){
    var params = req.body;
    var sql = "INSERT INTO discuss(app_id, create_time, content, account) VALUES (?,?,?,?)";
    var sqInfo = [params.appId, new Date(), params.content, "匿名"];
    if (typeof params.content !== 'string' || (params.content.length === 0 || params.content.length > 88)) {
        res.json({code: -1, message: '你是bug'});
        return;
    }
    // 长度最少3位以上， 不能没有中文   写点汉字吧，博主外语很捉急
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, sqInfo, function (err, result) {
            common.result(res, conn, err, '')
        })
    })
})

// 本地缓存数据
router.post('/localDatas',function(req, res){
    var ids = req.body.ids;
    var host = req.headers['host'];
    if (!ids.length || !ids.join) {
        res.json({code: -1, messge: '数据错了'});
        return;
    }
    var sql = "select * from data_list where id in (" + ids.join(',') + ") ORDER BY FIND_IN_SET(id,'"+ ids.join(',') +"')";
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
                    type: result[i].type,
                    create_time: result[i].create_time,
                    downloadTotal: result[i].download_total || 0,
                    downloadUrl: device > 2 ? result[i].android_download : result[i].ios_download
                })
            }
         }
          common.result(res, conn, err, arr)
        })
    })
})
// 搜索列表
router.post('/searchList',function(req, res){
  var host = req.headers['host'];
  var device = common.getdevice(req);
  var title = req.body.title;
  var sql = '';
  if (device > 2) {
      sql = "select * FROM data_list where title like '%" + title + "%' and device >= 2 order by download_total desc";
  } else {
      sql = "select * FROM data_list where title like '%" + title + "%' and device <= 2 order by download_total desc";
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
                      type: result[i].type,
                      downloadTotal: result[i].download_total || 0,
                      downloadUrl: device > 2 ? result[i].android_download : result[i].ios_download
                  })
              }
          }
          common.result(res, conn, err, arr)
      })
  })
})

router.post('/download', (req, res) => {
    var id = req.body.id
    var sql = "select * FROM data_list where id=" + id;
    pool.getConnection(function (err, conn) {
        if (err) console.log("POOL /==> " + err);
        conn.query(sql, function (err, result) {
            if (err) {
                console.log("POOL /==> " + err);
                conn.release();//关闭连接池
            } else {
                var total = (result[0].download_total || 0) + 1;
                var sqlUpdate = "UPDATE data_list SET download_total = ? WHERE id = ?";
                conn.query(sqlUpdate, [total, id], function (err, result) {
                    common.result(res, conn, err, '')
                })
            }
        })
    })
})

module.exports = router;
