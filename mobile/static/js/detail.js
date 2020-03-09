var id = '';
var query = window.location.search.substring(1);
var spt = query.split('=');
var discussTotal = 0;
if (spt && spt.length > 1) {
  id = spt[1];
}
ajax({
  type: "post",
  url: "/api/detail",
  data: {id: id},
  success: function (response) {
    var data = response.data || {};
    var detailImgs = document.querySelector('.detail-imgs');
    var imgs = data.detailImgs.split(',');
    var str = '';
    discussTotal = Number(data.discussTotal) || 0;
    document.querySelector('.main-cont .logo img').src = data.logo;
    document.querySelector('.main-cont h1').innerHTML = data.title;
    document.querySelector('.main-cont .score-num').innerHTML = data.score + '分';
    document.querySelector('.main-cont .download-num').innerHTML = data.downloadTotal + '次下载';
    document.querySelector('.discuss-total').innerHTML = discussTotal;
    document.querySelector('.detail-txt').innerHTML = data.brief;
    document.querySelector('#scroll2 .score h3').innerHTML = data.score;
    document.querySelector('.score-people').innerHTML = discussTotal;
    document.querySelector('#down-app').setAttribute('data-id', data.id);
    document.querySelector('#down-app').setAttribute('data-url', data.downloadUrl);
    for (var i = 0; i < imgs.length; i++) {
      str += '<img src="'+ data.imgHost + imgs[i] +'" alt="">'
    }
    detailImgs.innerHTML = str;
    getLikeNess(data.type);
    getDiscussList();
    contStar(data.score);
  },
  error: function () {    
    console.log("error");
  }
})

// 类似应用
function getLikeNess(appType) {
  ajax({
    type: "post",
    url: "/api/likeness",
    data: {type: appType},
    success: function (response) {
      var data = response.data || [];
      var container = document.querySelector('.hot-apps');
      var str = '';
      for (var i = 0; i < data.length; i++) {
        str += '<div class="item">' +
                '<a href="./detail.html?id='+ data[i].id +'">' +
                  '<img src="'+ data[i].logo +'" alt="">' +
                  '<span>'+ data[i].title +'</span>' +
                '</a>' +
                '<span data-id="'+ data[i].id +'" data-url="'+ data[i].downloadUrl +'" ontouchend="download(this)" class="primary-button download">下载</span>' +
              '</div>'
      }
      container.innerHTML = str;
    },
    error: function () {    
      console.log("error");
    }
  })
}

// 获取评论列表
function getDiscussList(total) {
  var container = document.querySelector('.comments');
  if (discussTotal) {
    ajax({
      type: "post",
      url: "/api/discussList",
      data: {page: 1, id: id},
      beforeSend: function () {},
      success: function (response) {
        var data = response.data || [];
        
        var str = '';
        for (var i = 0; i < data.length; i++) {
          str += '<li>'+
                      '<div class="account"><span class="account-ico"><i class="mui-icon mui-icon-person-filled"></i></span><span class="a-name">'+ data[i].account +'</span></div>'+
                      '<div class="com-cont"><p>'+ data[i].content +'</p><div class="date-z"><span>'+ data[i].createTime +'</span><i id="love-heart" class="iconfont">&#xe663;</i></div></div>'+
                  '</li>'
        }
        container.innerHTML = str;
        //  加了数据高度有变化，从新计算高度
        getTabHeight('#item2mobile');
      },
      error: function () {    
        console.log("error");
      }
    })
  } else {
    container.innerHTML = '<li class="no-data"><i class="iconfont">&#xe617;</i><span>暂无评论</span></li>'
  }
}

// 立即下载
document.getElementById('down-app').addEventListener('tap', function() {
  download(this);
})

// tab的高度
mui('.mui-slider').slider().stopped = true;
var alist = document.querySelectorAll('#sliderSegmentedControl a');
alist[0].addEventListener('tap', function() {
  getTabHeight('#item1mobile');
})
alist[1].addEventListener('tap', function() {
  getTabHeight('#item2mobile');
})
// document.getElementById('slider').addEventListener('slide', function(e) {
//   if (e.detail.slideNumber === 0) {
//     getTabHeight('#item1mobile');
//   } else {
//     getTabHeight('#item2mobile');
//   }
// })
setTimeout(function() {
  getTabHeight('#item1mobile');
}, 300)
function getTabHeight(id) {
  var hgt = document.querySelector(id + ' .mui-scroll').offsetHeight;
  var allCont = document.querySelectorAll('.mui-control-content');
  for(var i = 0; i < allCont.length; i++) {
    allCont[i].style.minHeight = hgt + 'px';
  }
}

// 评论相关
var setMessage = document.getElementById('set-message');
var messageBox = document.getElementById('message-box');
var messageInput = document.getElementById('message-input');
setMessage.addEventListener('tap', function() {
  messageBox.style.zIndex = 2000;
  messageBox.style.opacity = 1;
  setTimeout(function() {
    messageInput.focus();
  }, 300)
  window.event? window.event.cancelBubble = true : e.stopPropagation();
})
messageBox.addEventListener('tap', function() {
  window.event? window.event.cancelBubble = true : e.stopPropagation();
});
document.querySelector('body').addEventListener('tap', function() {
  messageBox.style.zIndex = -1;
  messageBox.style.opacity = 0;
})
// 发表评论
document.getElementById('confirm').addEventListener('tap', function() {
  var value = messageInput.value;
  if (value) {
    var reg = new RegExp("[\\u4E00-\\u9FFF]+","g");
    var err = '';
    if (!reg.test(value)) {
      err = '不能没有中文，写点汉字吧';
    }
    if (value.length < 3) {
      err = '文字太少了，请多表达一点';
    }
    if (value.length > 88) {
      err = '文字太多了，请简洁描述看法';
    }
    if (err) {
      mui.toast(err);
      return;
    }
    ajax({
      type: "post",
      url: "/api/discuss",
      data: {appId: id, content: value},
      success: function (response) {
        mui.toast(response.message);
        if (response.code == 200) {
          discussTotal += 1;
          messageInput.value = '';
          messageBox.style.zIndex = -1;
          messageBox.style.opacity = 0;
          document.querySelector('.discuss-total').innerHTML = discussTotal;
          document.querySelector('.score-people').innerHTML = discussTotal;
          getDiscussList();
        }
      },
      error: function () {    
        console.log("error");
      }
    })
  } else {
    mui.toast('请输入评论内容');
  }
})

// 收藏
var historyCollect = localStorage.getItem('collect');
var idsData = [];
if (historyCollect) idsData = JSON.parse(historyCollect).slice(0, 6);
document.querySelector('.collect').addEventListener('tap', function() {
  if (idsData.indexOf(Number(id)) == -1) {
    idsData.unshift(Number(id));
    localStorage.setItem('collect', JSON.stringify(idsData));
  }
  mui.toast('收藏成功');
})

// 计算滚动条的位置
var tabBox = document.getElementById('tab-box');
window.onscroll = function(e) {
  var scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
  if (scrollTop > 105) {
    tabBox.className = 'tab-box tab-box-fixed';
  } else {
    tabBox.className = 'tab-box';
  }
}

// 计算星星的评分数量
function contStar (num) {
  var xingxing = document.querySelectorAll('.xingxing span');
  for (var i = 1; i <= 5; i++) {
    var goldStar = xingxing[i-1].querySelector('.gold');
    if (i > num) {
      if (i - num < 1) {
        goldStar.style.width = 100 - ((i - num) * 100) + '%';
      }
    } else {
      goldStar.style.width = '100%';
    }
  }
}