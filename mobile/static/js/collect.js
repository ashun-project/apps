// localStorage.setItem('collect', JSON.stringify([20,30,18,36,32]));
var listWrap = document.querySelector('.history-list');
var historyCollect = localStorage.getItem('collect');
var idsData = [];
if (historyCollect) idsData = JSON.parse(historyCollect).slice(0, 6);
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
              '<span data-id="'+ data[i].id +'" data-url="'+ data[i].downloadUrl +'" ontouchend="download(this)" class="primary-button mui-btn download">下载</span>' +
            '</li>';
    }
    if (!str) {
      str = '<li class="list-table no-data"><span>还没有收藏过应用</span></li>'
    }
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
      str += '<div class="item"><a href="./detail.html?id='+ data[i].id +'"><img src="'+ data[i].logo +'" alt=""><span>'+ data[i].title +'</span></a><span data-id="'+ data[i].id +'" data-url="'+ data[i].downloadUrl +'" ontouchend="download(this)" class="primary-button mui-btn download">下载</span></div>'
    }
    hotApps.innerHTML = str;
  },
  error: function () {
    console.log ('error');
  },
});