'use strict';

(function() {
  var uaResult = (window && window.navigator && window.navigator.userAgent ? window.navigator.userAgent : "");
  if (uaResult && !!uaResult.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)) {
    if ("standalone" in window.navigator && window.navigator.standalone) {
      var element;
      /** @type {boolean} */
      var l = false;
      document.addEventListener("click", function(event) {
        /** @type {(EventTarget|null)} */
        element = event.target;
        for (; element.nodeName !== "A" && element.nodeName !== "HTML";) {
          element = element.parentNode;
        }
        if ("href" in element && element.href.indexOf("http") !== -1 && (element.href.indexOf(document.location.host) !== -1 || l)) {
          event.preventDefault();
          document.location.href = element.href;
        }
      }, false);
    }
  }
})();