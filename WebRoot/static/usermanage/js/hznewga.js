(function(){
  //添加慧择数据统计代码
  document.write("<script src='//static.huizecdn.com/js/hz/hzcomm/hz-analytics.js'></script>");
})();
(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
    (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
    m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
})(window,document,'script','//static.huizecdn.com/js/hz/hzcomm/analytics.js','ga');
ga('create', 'UA-2280892-24', 'auto');
ga('_addOrganic', 'baidu', 'word');
ga('_addOrganic', 'baidu', 'wd');
ga('_addOrganic', 'baidu', 'q1');
ga('_addOrganic', 'opendata.baidu', 'wd');
ga('_addOrganic', 'm.baidu', 'word');
ga('_addOrganic', 'wap.baidu', 'word');
ga('_addOrganic', '360sou', 'q');
ga('_addOrganic', '360', 'q');
ga('_addOrganic', 'so', 'q');
ga('_addOrganic', 'soso', 'w');
ga('_addOrganic', 'youdao', 'q');
ga('_addOrganic', 'sogou', 'query');
ga('_addOrganic', '3721', 'name');
ga('_addOrganic', 'vent', 'kw');
ga('_addOrganic', 'ucweb', 'keyword');
ga('_addOrganic', 'ucweb', 'word');
ga('_addOrganic', '114so', 'kw');
ga('send', 'pageview');
//百度统计
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?8a32affef2f860a73caf9d05780da361";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
//百度自动推送
(function(){
    if(window.location.protocol.indexOf("https")<0){
      var bp = document.createElement('script');
      bp.src = '//push.zhanzhang.baidu.com/push.js';
      var s = document.getElementsByTagName("script")[0];
      s.parentNode.insertBefore(bp, s);
    }
})();

// 360推送
(function () {
    var mapIDs = [ { key: "www.huize.com", value: "6424c8e933e7f1b89c539de540bf1b39" }, 
    { key: "xuexi.huize.com", value: "6424c8e933e7f1b89c539de540bf1b39" }, 
    { key: "m.huize.com", value: "50e972f277ec51a5cddd280249e83ff9" } ];
    
    for (var i = 0; i < mapIDs.length; i++) {
        if (mapIDs[i].key === document.domain) {            
            var src = document.location.protocol +'//js.passport.qihucdn.com/11.0.1.js?' + mapIDs[i].value;
            document.write('<script src="' + src + '" id="sozz"><\/script>');
        }
    }
})();