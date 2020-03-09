ajax({  
  type: "post",
  url: "/api/banners",
  data: {},
  success: function (response) {
    var muiSliderLoop = document.querySelector('.mui-slider-loop');
    var muiSliderIndicator = document.querySelector('.mui-slider-indicator');
    var str = '';
    var str2 = '';
    var len = response.data.length;
    for (var i = 0; i < len; i++) {
      // 第一个跟最后一个，额外增加的一个节点
      if (i === 0) {
        str += '<div class="mui-slider-item mui-slider-item-duplicate"><a href="'+ response.data[len - 1].open_url +'"><img src="'+ response.data[len - 1].host + response.data[len - 1].img_url +'"></a></div>';
      }
      str += '<div class="mui-slider-item"><a href="'+ response.data[i].open_url +'"><img src="'+ response.data[i].host + response.data[i].img_url +'"></a></div>';
      if (i === len - 1) {
        str += '<div class="mui-slider-item mui-slider-item-duplicate"><a href="'+ response.data[0].open_url +'"><img src="'+ response.data[0].host + response.data[0].img_url +'"></a></div>';
      }
      str2 += '<div class="mui-indicator'+ (i ? "" : " mui-active") +'"></div>'
    }
    muiSliderLoop.innerHTML = str;
    muiSliderIndicator.innerHTML = str2;
    var slider = mui("#slider").slider({interval: 5000})
  },
  error: function () {    
    console.log("error");
  }
})
ajax({
  type: "post",
  url: "/api/hots",
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
    console.log("error");
  }
})
ajax({
  type: "post",
  url: "/api/indexList",
  data: {},
  success: function (response) {
    var indexList = document.querySelector('.index-list');
    var numberOne = document.querySelector('.number-one');
    var firstData = response.data.shift();
    var typeList = ['', '棋牌', '直播', '小说', '游戏', '视频', '其他'];
    var str = '';
    for (var i = 0; i < response.data.length; i++) {
      str += contTxt(response.data[i])
    }
    function contTxt(obj) {
      //mui-table-view-cell mui-media
      return '<li class="list-table">' +
                '<a href="./detail.html?id='+ obj.id +'" class="a-cont"><img class="mui-media-object mui-pull-left" src="'+ obj.logo +'">' +
                '<div class="mui-media-body"><h3>'+ obj.title +'</h3><p class="mui-ellipsis">'+ obj.brief.substr(0, 16) +'</p><i>'+ obj.downloadTotal +'次下载&nbsp;&nbsp;&nbsp;['+ typeList[Number(obj.type)] +']</i></div></a>' +
                '<span data-id="'+ obj.id +'" data-url="'+ obj.downloadUrl +'" ontouchend="download(this)" class="primary-button mui-btn download">下载</span>' +
              '</li>'
    }
    indexList.innerHTML = str;
    numberOne.innerHTML = contTxt(firstData);
  },
  error: function () {    
    console.log("error");
  }
})

mui('.footer').on('tap','a',function(e){
  // var target = e.target;  
  // if(target.classList.contains('mui-action-back')){   
  //   return false;  
  // }
  document.location.href = this.href;  
})

document.querySelector('.search-input').addEventListener('focus', function() {
  window.location.href = './search.html'
})

