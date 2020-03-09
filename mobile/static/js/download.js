function download(that){
  var iframe = document.createElement('iframe');
  var id = that.getAttribute('data-id');
  var src = that.getAttribute('data-url');
  var items = JSON.parse(localStorage.getItem('ids') || "[]");
  iframe.setAttribute('src','./download.html?src=' + src);
  iframe.style.display = 'none';
  document.body.appendChild(iframe);
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
