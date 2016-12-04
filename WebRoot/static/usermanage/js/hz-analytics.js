//Author:hz1405863
//Date:2015/11/18
//Descript:慧择产品线数据分析公共组件
(function(window) {
	var hzAnalytics = {
		init: function() {
			// if (typeof Zepto != "undefined" || typeof jQuery != "undefined") {
			//document.ready(function() {
			hzAnalytics.getSoureceInfo();
			//});
			// } else {
			// 	// var bp = document.createElement('script');
			// 	// bp.src = '//static.huizecdn.com/js/libs/zepto/1.1.6/zepto.min.js';
			// 	// var s = document.getElementsByTagName("script")[0];
			// 	// s.parentNode.insertBefore(bp, s);
			// 	setTimeout(hzAnalytics.init, 2000);
			// }
		},
		getSoureceInfo: function() { //保存ppc投放页面来源相关信息
			var _this = this;
			var utmModel = {
				utmSource: "",
				utmMedium: "",
				utmTerm: "",
				utmContent: "",
				utmCampaign: "",
				utmUrl: "",
				utmReferrerUrl: ""
			};
			var iDList = ["hz2", "hz3", "hz4", "hz5", "hz6"];
			var id = this.queryUrl("ID");
			var exist = false;
			for (var i = 0; i < iDList.length; i++) {
				if (iDList[i] === id) {
					exist = true;
				}
			}

			utmModel.utmSource = exist ? this.queryUrl("ID") : this.queryUrl("utm_source"); //兼用老数据，部分投放页面使用ID字段标识utm_source
			utmModel.utmMedium = this.queryUrl("utm_medium");
			utmModel.utmTerm = this.queryUrl("utm_term");
			utmModel.utmContent = this.queryUrl("utm_content");
			utmModel.utmCampaign = this.queryUrl("utm_campaign");
			utmModel.utmUrl = window.location.href;
			var referrer = document.referrer;
			if(referrer){
				referrer = referrer.substring(0,50);
			}else{
				referrer = "";
			}
			utmModel.utmReferrerUrl = referrer;
			var postUrl = "//www.huize.com/Home/SaveUtm";
			//if (utmModel.utmSource || utmModel.utmMedium || utmModel.utmTerm || utmModel.utmContent || utmModel.utmCampaign) {
			if (typeof Zepto != "undefined" || typeof jQuery != "undefined") { //兼容老PC和H5
				$.ajax({
					type: "get",
					async: false,
					url: postUrl,
					dataType: "jsonp",
					jsonp: "jsoncallback",
					data: utmModel,
					success: function(json) {
						
					}
				});
			} else if (typeof requirejs != "undefined") { //兼容新PC
				try {
					requirejs(['jquery'], function(_$) {
						_$.ajax({
							type: "get",
							async: false,
							url: postUrl,
							dataType: "jsonp",
							jsonp: "jsoncallback",
							data: utmModel,
							success: function(json) {
								
							}
						});
					});
				} catch (ex) {
					window.onload = function() {
						_this.jsonp({
							url: postUrl,
							data: utmModel,
							success: function(json) {}
						});
					};
				}
			} else { //兼容不包含框架
				window.onload = function() {
					_this.jsonp({
						url: postUrl,
						data: utmModel,
						success: function(json) {

						}
					});
				};
			}
			//}
		},
		queryUrl: function(name) { //获取URL参数
			var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
			var r = window.location.search.substr(1).match(reg);
			if (r != null) return decodeURIComponent(r[2]);
			return "";
		},
		jsonp: function(options) {
			options = options || {};
			if (!options.url) {
				throw new Error("参数不合法");
			}

			//创建 script 标签并加入到页面中        
			var callbackName = ('jsonp_' + Math.random()).replace(".", "");
			var oHead = document.getElementsByTagName('head')[0];
			options.data["callback"] = callbackName;
			var params = this.formatParams(options.data);
			var oS = document.createElement('script');
			oHead.appendChild(oS);

			//创建jsonp回调函数        
			window[callbackName] = function(json) {
				oHead.removeChild(oS);
				clearTimeout(oS.timer);
				window[callbackName] = null;
				options.success && options.success(json);
			};

			//发送请求        
			oS.src = options.url + '?' + params;

			//超时处理        
			if (options.time) {
				oS.timer = setTimeout(function() {
					window[callbackName] = null;
					oHead.removeChild(oS);
					options.fail && options.fail({
						message: "超时"
					});
				}, time);
			}
		},
		//格式化参数    
		formatParams: function(data) {
			var arr = [];
			for (var name in data) {
				arr.push(encodeURIComponent(name) + '=' + encodeURIComponent(data[name]));
			}
			return arr.join('&');
		}
	};
	hzAnalytics.init();
})(window);
//数据采集上报
var _hzq = _hzq || {};
// 上报站点，必填
if (window.location.host == "m.huize.com") {
	_hzq.gsId = "GSID_001_002";
} else {
	_hzq.gsId = "GSID_001_001";
}
_hzq.userId = glob_getCookie("userId");
_hzq.employeeId = glob_getCookie("eid");

function glob_getCookie(name) {
	var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
	if (arr = document.cookie.match(reg))
		return unescape(arr[2]);
	else
		return null;
}

// 上报登录用户账号 ID，可选
(function() {
	var bp = document.createElement('script');
	bp.src = '//stat.hzins.com/stat/pv.js';
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(bp, s);
})();
(function() {
	var bp = document.createElement('script');
	bp.src = '//stat.hzins.com/stat/click.js';
	var s = document.getElementsByTagName("script")[0];
	s.parentNode.insertBefore(bp, s);
})();