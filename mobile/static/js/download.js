var app = false;
var nowSize = 0;
var seconde = 0;
var chendNum = 0;
var changeTime = false;
var stateNum = 0;
var downloadDiv = document.createElement('div');
var style = document.createElement('style');
var muiBarTab = document.querySelector('.mui-bar-tab');
var topP = muiBarTab ? 50 : 0;
downloadDiv.className = 'download-box';
downloadDiv.innerHTML = '<div class="state"></div><div class="down-prog"></div><div class="down-size"></div>';
downloadDiv.style.display = 'none';
style.innerHTML = ".download-box{height: 35px;background: rgba(0, 0, 0, 0.57);position: fixed;bottom: "+ topP +"px;z-index: 99999;width: 100%;display: flex;color: #fff;font-size: 12px;line-height: 35px;padding: 0 10px;}.download-box *{padding-right:20px}"
document.querySelector('body').appendChild(downloadDiv);
document.querySelector('body').appendChild(style);


var innerTxt = {
    text1: function (value) {
        downloadDiv.querySelector('.state').innerHTML =  value
    },
    text2: function (value) {
        // alert(value+'=====')
        downloadDiv.querySelector('.down-prog').innerHTML = '进度' + parseInt(value) + '%'
    },
    text3: function (value) {
        downloadDiv.querySelector('.down-size').innerHTML = '大小' + value
    }
}

if(window.plus){
    plusReady();
}else{
    document.addEventListener('plusready', plusReady, false);
}

function plusReady(){
    app = true;
    plus.downloader.clear(4);
    plus.downloader.enumerate(function(downloads) {
        //设置监听器
        downloads[0].addEventListener("statechanged", onStateChanged);
        //启动任务
        downloads[0].start();
    });
}


function onStateChanged(task, status) {
    // alert(JSON.stringify(task) + '===' + status)
    // 检测加载失败
    // jishipanduan(task.state);
    if (task.state && task.state > 0 && status !== 200) {
        alert('下载失败')
        plus.downloader.clear(task.state);
        downloadDiv.style.display = 'none';
        return
    }
    if (task.state > 0) {
        downloadDiv.style.display = 'flex';
    }
    switch(task.state) {
        case 1: // 开始
            innerTxt.text1("开始下载...");
            break;
        case 2: // 已连接到服务器
            innerTxt.text1("正在下载");
            break;
        case 3: // 已接收到数据
            var progressVal = (task.downloadedSize / task.totalSize) * 100;
            if((new Date().getSeconds() != seconde)) {
                var size = changeSize(task.downloadedSize) + ' / ' + changeSize(task.totalSize);
                size += ' / ' + changeSize(task.downloadedSize - nowSize) + "/s";
                nowSize = task.downloadedSize;
                innerTxt.text2(progressVal)
                innerTxt.text3(size)
            }
            seconde = new Date().getSeconds();
            break;
        case 4: // 下载完成
            downloadDiv.style.display = 'none';
            // alert(JSON.stringify(task.getFileName()) + '===')
            plus.runtime.openFile(task.getFileName());
            // plus.downloader.clear(4);
            // stop();
            break;
    }
}

function jishipanduan(state) {
    stateNum = state;
    if (changeTime) return;
    changeTime = setInterval(function () {
        chendNum++
        if (chendNum > 6)  {
            clearInterval(changeTime)
            changeTime = false;
            chendNum = 0;
            stateNum = 0;
            if (stateNum == 0) {
                plus.downloader.clear(0);
                alert('下载失败');
            }
        }
    }, 1000)
}

   /*文件大小转换*/
function changeSize(size) {
    var num;
    if((size / 1024) <= 1024) {
        num = size / 1024;
        return num.toFixed(2) + 'KB';
    }
    if((size / 1024) > 1024 && (size / 1024) <= (1024 * 1024)) {
        num = (size / 1024) / 1024;
        return num.toFixed(2) + 'M';
    }
    if((size / 1024) > (1024 * 1024)) {
        num = ((size / 1024) / 1024) / 1024
        return num.toFixed(2) + 'G';
    }
}

function goDownload(url) {
    // var url = 'http://192.168.254.107:9966/aa.apk';
    var dtask = plus.downloader.createDownload(url);
    dtask.addEventListener("statechanged", onStateChanged, false);
    dtask.start();
}



function download(that){
  var iframe = document.createElement('iframe');
  var id = that.getAttribute('data-id');
  var src = that.getAttribute('data-url');
  var items = JSON.parse(localStorage.getItem('ids') || "[]");
  if (app) {
    goDownload(src)
  } else {
    iframe.setAttribute('src','./download.html?src=' + src);
    iframe.style.display = 'none';
    document.body.appendChild(iframe);
  }
  if (items.indexOf(id) > -1) {
    return;
  };
  items.unshift(id)
  localStorage.setItem('ids', JSON.stringify(items));

  ajax({
    type: "post",
    url: "/api/download",
    data: {id},
    success(result) {
      console.log(result)
    },
    error(err) {
      console.log(err)
    }
  })
}


// 统计代码
document.write(unescape("%3Cspan id='cnzz_stat_icon_1278862723'%3E%3C/span%3E%3Cscript src='https://s4.cnzz.com/z_stat.php%3Fid%3D1278862723' type='text/javascript'%3E%3C/script%3E"));