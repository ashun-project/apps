// 上传文件初始化
var cuploadCreate = new Cupload ({
  ele: '#cupload-logo',
  num: 1
});
var detailEnt = document.getElementById('cupload-detail');
var wih = detailEnt.clientWidth;
var cuploadDetail = new Cupload ({
  ele: '#cupload-detail',
  width: wih / 2 - 8,
  height: (wih / 2 > 130) ? wih / 2 + 50 : 146,
  num: 2
});

// checkbok 改变事件
var checkboxClient = document.querySelectorAll('.checkbox-client input[type=checkbox]');
var urlInput = '';
for(var i = 0; i < checkboxClient.length; i++) {
  checkboxClient[i].addEventListener('change', function() {
    urlInput = document.querySelector('.checkbox-client input[name='+ this.value +']');
    urlInput.value = '';
    urlInput.disabled = !this.checked;
  })
}

// 获取表单数据
function getData() {
  var eventObj = {
    title: document.getElementById('app-name'),
    type: document.getElementById('app-type'),
    androidDownload: document.getElementById('app-android'),
    iosDownload: document.getElementById('app-ios'),
    brief: document.getElementById('app-brief'),
  }
  var data = {};
  var logoImg = document.getElementById('cupload-logo').querySelector('ul li img');
  var detailImg = document.getElementById('cupload-detail').querySelectorAll('ul li img');
  var detailArr = [];
  for (var key in eventObj) {
    data[key] = eventObj[key].value;
  }
  for (var i = 0; i < detailImg.length; i++) {
    detailArr.push(detailImg[i].getAttribute('file-name'))
  }
  data.logo = logoImg && logoImg.getAttribute('file-name');
  data.detailImgs = detailArr.join(',');

  return data;
}

// 表单数据验证
function getVerify(data) {
  var errTxt = '';
  if (!data.title) {
    errTxt = '请填写APP名称';
  } else if(!data.type) {
    errTxt = '请选择APP类型';
  } else if (!data.androidDownload && !data.iosDownload) {
    errTxt = '请至少选择一个客户端并填写APP的下载地址';
  } else if (!data.brief || data.brief.length < 20) {
    errTxt = '请填写APP的简介,且不能少于20个字符';
  } else if (!data.logo) {
    errTxt = '请上传APP应用的logo';
  } else if (!data.detailImgs) {
    errTxt = '请上传APP应用的详情图';
  }
  if (errTxt) {
    alert(errTxt);
  }
  
  return !errTxt;
}

document.getElementById('confirm').addEventListener('click', function() {
  var data = getData();
  var verify = getVerify(data);
  if (verify) {
    // 计算客户端类型数据
    if (data.androidDownload && data.iosDownload) {
      data.device = 2;
    } else if (data.androidDownload) {
      data.device = 3;
    } else {
      data.device = 1;
    }
    fetch('/api/insertIntoDataList', {
      body: JSON.stringify(data),
      headers: {
        'Content-Type': 'application/json'
      },
      method: 'POST'
    }).then(res => res.json()).then((result) => {
      alert(result.message);
      if (result.code === 200) {
        window.location.reload();
      }
    }).catch(err => {
      alert(err);
    })
  }
})