(function($) {
	/*
		Name: jq Placeholder For IE;
		Author:Kingwell Leng;
		Date:2015-09-25;
		Version:1.0;
	*/
	function log(msg, type) {
		var t = type || 'log';
		try {
			console[t](msg);
		} catch (ev) {}
	}
	window.log = log;
	//存放绑定元素，用于重置显示状态；
	$.placeholder = {
		input: [],
		resetStatus: function() {
			var len = this.input.length;
			$.each(this.input, function(i, ele) {
				$(ele).blur();
			});
			return len ? '\u91cd\u7f6e\u6210\u529f' + len + '\u4e2a' : '\u60a8\u6ca1\u6709\u7ed1\u5b9a\u4efb\u4f55\u5143\u7d20';
		}
	};
	$.fn.placeholder = function(options) {
		var style = '';
		var ops = $.fn.extend({
			left: 0,
			top: 0,
			extendStyle: '',
			blankCharacter: true,
			color: '',
			lineHeight: '',
			wrapTagName: 'span'
		}, options);
		if (!$('#placeholder__').length) {
			//$.fn.placeholder.lock = true;
			//http://img.huizecdn.com/com/opacity_0.gif;;
			style = '.placeholder-wrap{position: relative;display: inline-block;}.placeholder-text{position: absolute; }.placeholder-input{position: relative;background-color: transparent; z-index: 1;}';
				$('head').append('<style id="placeholder__">' + ops.extendStyle + style + '</style>');
		}


		function returnValue(_this, property) {
			return parseInt($(_this).attr(property), 10) || 0;
		}

		return this.each(function() {
			var _this = this;
			//避免多次绑定
			if ($(_this).data('status')) {
				return;
			}
			$(_this).data('status', true);
			if ($(_this).is(':hidden')) {
				log('\u8fd9\u662f\u4e00\u4e2a\u9690\u85cf\u5143\u7d20\uff0c\u65e0\u6cd5\u51c6\u786e\u5b9a\u4f4d', 'info');
			}
			if ($(_this).css('backgroundImage') === 'none') {
				$(_this).css('backgroundImage', '//img.huizecdn.com/com/opacity_0.gif');
			}
			$.placeholder.input.push(_this);
			var text = ops.text || $(_this).attr('placeholder-text') || '',
				$text,
				$input,
				timeout,
				color = ops.color || $(_this).attr('placeholder-color') || '#999',
				left = ops.left !== 0 ? ops.left : returnValue(_this, 'placeholder-left'),
				top = ops.top || returnValue(_this, 'placeholder-top'),
				width = ops.width || (returnValue(_this, 'placeholder-width') || 'auto'),
				height = ops.height || returnValue(_this, 'placeholder-height'),
				fontSize = ops.fontSize || parseInt($(_this).attr('placeholder-size'), 10),
				pos,
				zIndex = parseInt($('body').css('z-index')) || 1,
				isBody = $(_this).parent()[0].tagName.toLowerCase() === 'body',
				box = {
					width: $(_this).outerWidth(),
					height: $(_this).outerHeight(),
					size: fontSize || parseInt($(_this).css('fontSize'), 10)
				},
				tagName = document.createElement($(_this).attr('placeholder-tag') || (ops.wrapTagName || 'span'));

			$(tagName).addClass('placeholder-wrap');
			$(_this).addClass('placeholder-input');
			if (ops.wrapTagName === false) {
				if (isBody) {

				}
				$(_this).parent().css({
					position: 'relative'
				});
			} else {
				$(_this).wrap(tagName);
			}

			$(_this).before('<span class="placeholder-text">' + text + '</span>');
			$text = $(_this).prev('.placeholder-text');
			pos = $(_this).position();
			left += pos.left + parseInt($(_this).css('padding-left'), 10) || 0;
			top += pos.top;
			if (isBody) {
				left = left - parseInt($('body').css('margin-left'), 10) || 0;
				top = top - parseInt($('body').css('margin-top'), 10) || 0;
			}
			//console.log(pos);
			$text.css({
				width: width || box.width,
				height: box.height,
				left: left,
				top: top,
				zIndex: zIndex,
				fontSize: box.size,
				lineHeight: (ops.lineHeight ? ops.lineHeight : box.height) + 'px',
				color: ops.color || color
			});
			$(_this).css({
				zIndex: zIndex + 1
			});
			//Set Status show Or hide;
			function _set() {
				var val = $(_this).val(),
					_val = $.trim(val);
				if (ops.blankCharacter) {
					if (val.length) {
						$text.hide();
					} else {
						$text.show();
					}
				} else {
					if (_val.length) {
						$text.hide();
					} else {
						$text.show();
					}
				}

			}
			//Bind Events;
			//Bind Events;
			var isIE = !!window.ActiveXObject;
			if (isIE) {

				$(_this).parent()
					.on('click', 'span.placeholder-text', function() {
						$(_this).parent().find('input').focus();
					});

			}
			$(_this)
				.on('keydown', _set)
				.on('blur', _set)
				.on('paste', function() {
					clearTimeout(timeout);
					_set();
				})
				.on('keyup', _set)
				.on('change', _set)
				.on('click', _set)
				.on('change', _set);
			$(function() {
				_set();
			});
		});
	};
})(jQuery);