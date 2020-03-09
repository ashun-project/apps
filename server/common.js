var fs = require('fs');
var common = {
  // 添加数据
  getFormatDate: function (time) {
    var date = time ? new Date(time) : new Date();
    var str = '';
    var dateArr = [date.getFullYear(), '-', date.getMonth() + 1, '-', date.getDate(), ' ', date.getHours(), ':', date.getMinutes()];
    dateArr.forEach(item => {
        if (typeof item === 'number' && item < 10) item = '0' + item;
        str += item;
    });
    return str;
  },
  result: function(res, conn, err, result) {
    var data = {code: 200, message: '操作成功', data: result}
    if (err) {
      console.log(err)
      data = {code: -1, message: '操作失败', data: ''}
    }
    res.json(data)
    conn.release();//关闭连接池
  },
  // 迁移临时文件
  moveFile: function (type, img) {
    fs.exists('./public/tmp/' + img, function(exists) {
        if (exists) {
            try{
                var source = fs.createReadStream('./public/tmp/' + img);
                var dest = fs.createWriteStream('./public/img/' + type + '/' + img);
                source.pipe(dest);
                source.on('end', function() { fs.unlinkSync('./public/tmp/' + img);});   //delete
            }catch (e){
                console.log('迁移文件出错')
            }
        } else {
            console.log('文件不存在')
        }
    })
  },
  getdevice: function(request) {
    var deviceAgent = request.headers["user-agent"].toLowerCase();
    // var agentID = deviceAgent.match(/(iphone|ipod|ipad|android)/); // 判断是不是手机访问
    var agentID = deviceAgent.match(/(iphone|ipod|ipad)/);
    if(agentID){
      device = 1
    } else{
      device = 3
    }
    return device;
  }
}

module.exports = common;