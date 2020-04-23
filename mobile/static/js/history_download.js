// localStorage.setItem('ids', JSON.stringify([20,21,22,23,24]));
var listWrap = document.querySelector('.history-list');
var historyDownload = localStorage.getItem('ids');
var totalData = 0;
var idsData = [];
if (historyDownload) idsData = JSON.parse(historyDownload).slice(0, 6);
ajax({
  type: "post",
  url: "/api/localDatas",
  data: {ids: idsData},
  success: function (response) {
    var data = response.data || [];
    var typeList = ['', '棋牌', '游戏', '小说', '视频', '直播', '其他'];
    var str = '';
    for (var i = 0; i < data.length; i++) {
      str += '<li class="list-table" id="download-'+ data[i].id +'">' +
              '<a href="./detail.html?id='+ data[i].id +'" class="a-cont"><img class="mui-media-object mui-pull-left" src="'+ data[i].logo +'">' +
              '<div class="mui-media-body"><h3>'+ data[i].title +'</h3><p class="mui-ellipsis">'+ data[i].brief.substr(0, 16) +'</p><i>'+ data[i].downloadTotal +'次下载&nbsp;&nbsp;&nbsp;['+ typeList[Number(data[i].type)] +']</i></div></a>' +
              '<span class="primary-button mui-btn" ontouchend="deleteDownloadData('+ data[i].id +')">删除</span>' +
            '</li>';
    }
    if (!str) {
      str = '<li class="list-table no-data"><span>还没有下载过应用</span></li>'
    }
    totalData = response.data.length;
    listWrap.innerHTML = str;
  },
  error: function () {    
    console.log("error");
  }
})


ajax ({
  type: 'post',
  url: '/api/hots',
  data: {},
  success: function (response) {
    var hotApps = document.querySelector('.hot-apps');
    var data = response.data;
    var str = '';
    for (var i = 0; i < data.length; i++) {
      str += '<div class="item"><a href="./detail.html?id='+ data[i].id +'"><img src="'+ data[i].logo +'" alt=""><span>'+ data[i].title +'</span></a><span data-id="'+ data[i].id +'" data-url="'+ data[i].downloadUrl +'" ontouchend="download(this)" class="primary-button download">下载</span></div>'
    }
    hotApps.innerHTML = str;
  },
  error: function () {
    console.log ('error');
  },
});


function deleteDownloadData (id) {
  var li = document.getElementById('download-' + id);
  li.parentNode.removeChild(li)
  idsData = idsData.filter(function (item) {return item !== id});
  totalData -= 1;
  localStorage.setItem('ids', JSON.stringify(idsData));
  if (!totalData) {
    listWrap.innerHTML = '<li class="list-table no-data"><span>已经没有下载过的应用了</span></li>';
  }
}