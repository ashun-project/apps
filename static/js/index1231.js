(function(e) {
  function t(e, t) {
    e.find(t.children);
    var n = o(e, t);
    i(e, t, n);
  }
  function n(t, i, o) {
    var r = t.find(i.children);
    return (
      e.fn.slide.vars.timerAnim && clearTimeout(e.fn.slide.vars.timerAnim),
      0 >= e.fn.slide.vars.tmpOpacity
        ? ((e.fn.slide.vars.tmpOpacity = e.fn.slide.vars.defOpacity),
          r
            .eq(e.fn.slide.vars.index)
            .css({ "z-index": "-1", opacity: e.fn.slide.vars.defOpacity }),
          (e.fn.slide.vars.index = o),
          void 0)
        : (e.fn.slide.vars.tmpOpacity > 0 &&
            ((e.fn.slide.vars.tmpOpacity =
              e.fn.slide.vars.tmpOpacity - e.fn.slide.vars.animStep),
            r
              .eq(e.fn.slide.vars.index)
              .css({ opacity: e.fn.slide.vars.tmpOpacity })),
          (e.fn.slide.vars.timerAnim = setTimeout(function() {
            n(t, i, o);
          }, 50)),
          void 0)
    );
  }
  function i(t, i, o) {
    if (e.fn.slide.vars.index != o) {
      var r = t.find(i.children),
        a = e(i.slideBarCon).find(i.barChildren);
      r.css({ "z-index": "0" }),
        r.eq(e.fn.slide.vars.index).css({ "z-index": "2" }),
        r.eq(o).css({ "z-index": "1" }),
        a.attr("class", " "),
        a.eq(o).attr("class", "current"),
        n(t, i, o);
    }
  }
  function o(t, n) {
    var i = t.find(n.children);
    return e.fn.slide.vars.index >= i.length - 1
      ? 0
      : e.fn.slide.vars.index + 1;
  }
  function r(e, n) {
    e.find(n.children).length,
      (n.auto = setInterval(function() {
        t(e, n);
      }, n.speed));
  }
  function a(t, n) {
    var i = t.find(n.children);
    i.eq(e.fn.slide.vars.index).css({ "z-index": "2" }), r(t, n);
  }
  (e.fn.slide = function(t) {
    var n = e.extend({}, e.fn.slide.defaults, t);
    return this.each(function() {
      var t = e(this);
      a(t, n);
    });
  }),
    (e.fn.slide.vars = {
      index: 0,
      timerAnim: null,
      auto: null,
      tmpOpacity: 1,
      defOpacity: 1,
      animStep: 0.1
    }),
    (e.fn.slide.defaults = {
      speed: 3e3,
      defOpacity: 1,
      children: "li",
      slideBarCon: "strong",
      barChildren: "span"
    });
})(jQuery),
  $(function() {
    // e = $("#J_index-install-bt-phone"),
    // t = $("#J_index-install-bt-hd"),
    // n = $("#J_index-install-bt-phone").find(".index-install-bt-phone"),
    // i = $("#J_index-install-bt-hd").find(".index-install-bt-hd"),
    // o = $("#J_index-install-bt"),
    // r = $("#J_index-down-phone-erweima"),
    // l = $("#J_index-down-hd-erweima");
    var a = $("#J_slide");
    a.slide()
  });
