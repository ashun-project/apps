// 获取搜索历史
// localStorage.setItem("search", JSON.stringify(['wrqwerqw', '人文提味儿', '二无条件维尔集团', '234523452345']))
var historyItem = localStorage.getItem("search");
var clearHistory = document.getElementById('clear-history');
var searchInput = document.querySelector('.search-input');
var historyWarp = document.querySelector('.history-cont');
var searchWarp = document.querySelector('.search-cont');
var localSearch = [];
if (historyItem) localSearch = JSON.parse(historyItem);

getHotData();
historyData();

mui('body').on('tap', '#clear-history', function() {
  localSearch = [];
  localStorage.setItem('search', '');
  historyData();
})

mui('body').on('tap', '#search-data', function() {
  getSearchList();
})

document.querySelector('.search-input').addEventListener('focus', function() {
  searchWarp.style.display = 'none';
  historyWarp.style.display = 'block';
})

// 回车事件
function getKeypress(e){
  var event = e || window.event;
  if(event.keyCode == 13) {
    getSearchList();
  }
}

// 搜索历史
function historyData() {
  var strLi = '';
  var newArr = [];
  if (localSearch.length) {
    for(var i = 0; i < localSearch.length; i++) {
      // 去重
      if (newArr.indexOf(localSearch[i]) == -1) {
        strLi += '<li>'+
        '<i class="iconfont time-icon">&#xe620;</i>' +
        '<span class="" ontouchend="goToSearch(\''+ localSearch[i] +'\')">'+ localSearch[i] +'</span>' +
        '<i class="iconfont delete-icon" ontouchend="deleteHistoryData(\''+ localSearch[i] +'\')">&#xe661;</i>' +
        '</li>';
        newArr.push(localSearch[i]);
      }
      if (newArr.length === 5) {
        break;
      }
    }
    localSearch = newArr;
    localStorage.setItem('search', JSON.stringify(newArr));
    clearHistory.style.display = 'block';
  } else {
    strLi = '<li class="no-data"><span class="">没有搜索过任何内容</span></li>'
    clearHistory.style.display = 'none';
  }
  historyWarp.querySelector('.history-list').innerHTML = strLi;
}

// 删除某个历史
function deleteHistoryData(value) {
  localSearch = localSearch.filter(function (item) {
    return value != item
  })
  historyData();
}

// 搜索
function getSearchList() {
  var val = searchInput.value.replace(/^\s+|\s+$/g, '');
  if (!val) {
    return
  }
  ajax({
    type: "post",
    url: "/api/searchList",
    data: { title: val },
    success: function(response) {
      var data = response.data || [];
      var typeList = ['', '棋牌', '游戏', '小说', '视频', '直播', '其他'];
      var str = '';
      for (var i = 0; i < data.length; i++) {
        str +=  '<li class="list-table">' +
            '<a href="./detail.html?id='+ data[i].id +'" class="a-cont"><img class="mui-media-object mui-pull-left" src="'+ data[i].logo +'">' +
            '<div class="mui-media-body"><h3>'+ data[i].title +'</h3><p class="mui-ellipsis">'+ data[i].brief.substr(0, 16) +'</p><i>'+ data[i].downloadTotal +'次下载&nbsp;&nbsp;&nbsp;['+ typeList[Number(data[i].type)] +']</i></div></a>' +
            '<span data-id="'+ data[i].id +'" data-url="'+ data[i].downloadUrl +'" ontouchend="download(this)" class="primary-button mui-btn">下载</span>' +
          '</li>'
      }
      if (!str) {
        str = '<li class="list-table no-data"><span>没有查询到数据</span></li>';
      }
      searchInput.blur();
      searchWarp.style.display = 'block';
      historyWarp.style.display = 'none';
      searchWarp.querySelector('.search-list').innerHTML = str;
      // 刷新缓存数据
      localSearch.unshift(val);
    },
    error: function () {    
      console.log("error");
    }
  })
}

// 点击历史记录事件
function goToSearch(value) {
  searchInput.value = value;
  getSearchList();
}

// 热门应用
function getHotData() {
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
}

mui('body').on('tap','a',function(e){
  // var target = e.target;  
  // if(target.classList.contains('mui-action-back')){   
  //   return false;  
  // }
  document.location.href = this.href;  
})
