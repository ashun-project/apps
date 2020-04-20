// 初始化数据
var page = 1;
mui.init({
  pullRefresh: {
    container: '#pullrefresh',
    down: {
      style:'circle',
      callback: pulldownRefresh
    }
  }
});

function getListData(type) {
  ajax({
    type: "post",
    url: "/api/indexList",
    data: {pageSize: 10},
    success: function (response) {
      var data = response.data || [];
      var len = response.data.length;
      var ul = document.querySelector('.index-list');
      var li = '';
      var str = '';
      if (page === 1) {
        if (len) {
          ul.innerHTML = '';
        } else {
          mui('#pullrefresh').pullRefresh().endPullupToRefresh();
          ul.innerHTML = '<li class="list-table no-data"><i class="iconfont">&#xe617;</i><span>暂无数据</span></li>';
        }
      }
      for (var i = 0; i < len; i++) {
        li = document.createElement('li');
        li.className = 'list-table';
        li.innerHTML = contTxt(data[i]);
        ul.appendChild(li);
      }
      function contTxt(obj) {
        return '<a href="./detail.html?id='+ obj.id +'" class="a-cont"><img class="mui-media-object mui-pull-left" src="'+ obj.logo +'">' +
                '<div class="mui-media-body"><h3>'+ obj.title +'</h3><p class="mui-ellipsis">'+ obj.brief.substr(0, 16) +'</p><i>'+ obj.downloadTotal +'次下载</i></div></a>' +
                '<span data-id="'+ obj.id +'" data-url="'+ obj.downloadUrl +'" ontouchend="download(this)" class="primary-button mui-btn download">下载</span>';
      }
      if (type == 1) {
        mui('#pullrefresh').pullRefresh().endPullupToRefresh(len === 10);
      } else {
        mui('#pullrefresh').pullRefresh().endPulldownToRefresh();
        // 重置
        mui('#pullrefresh').pullRefresh().refresh(true);
      }
      page += 1;
    },
    error: function () {    
      console.log("error");
    }
  })
}
// function pullupRefresh () {
//   getListData(1);
// }
getListData(1);
function pulldownRefresh() {
  page = 1;
  getListData(2);
}

mui('body').on('tap','a',function(e){
  // var target = e.target;  
  // if(target.classList.contains('mui-action-back')){   
  //   return false;  
  // }
  document.location.href = this.href;  
})