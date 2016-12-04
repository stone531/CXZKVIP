$(function(){
			$(".header-right a").on("click",function(){
				$(this).css({
					"color":"rgb(190,57,4)"
				}).siblings().css({
					"color":"rgb(123,130,135)"
				});
			})
			
			// 顶部轮播图的实例
			var swiper = new Swiper('.swiper-container', {
			pagination: '.swiper-pagination',
			paginationClickable: '.swiper-pagination',
			nextButton: '.swiper-button-next',
			prevButton: '.swiper-button-prev',
			spaceBetween: 30,
			autoplayDisableOnInteraction : false,
			autoplay : 3000,
			loop: true
		});

		//轮播图效果
		(function () {
			//克隆第一张图片
			$('.screen ul li').eq(0).clone().appendTo($('.screen ul'));

			var liWidth = $('.screen ul li').width() + parseInt($('.screen ul li').css('marginRight'));
			var index = 0;
			var timer = null;
			var isEnd = true;
			//自动切换效果
				timer = setInterval(autoPlay, 3000);
			// 鼠标经过大盒子时清除自动轮播
				$('.box').on('mouseenter',function(){
					clearInterval(timer);
				});
			// 鼠标离开大盒子时恢复自动轮播
				$('.box').on('mouseleave',function(){
					timer = setInterval(autoPlay, 1000);
				});
			// 封装自动播放函数
			function autoPlay() {
				if (index == ($('.screen ul li').length - 1) / 2) {
					index = 0;
					$('.screen ul').animate({'left': 0}, 0);
				}
				index++;
				$('.screen ul').stop().animate({'left': -liWidth * index}, 500);
			}

			//点击右按钮切换
			$('.arrow-btn .right').on('click', function () {
				if (isEnd) {
					isEnd = false;
					if (index == ($('.screen ul li').length - 1) / 2) {
						index = 0;
						$('.screen ul').animate({'left': 0}, 0);
					}
					index++;
					$('.screen ul').stop().animate({'left': -liWidth * index}, 500, function () {
						isEnd = true;
					});
				}
			});

			//点击左按钮切换
			$('.arrow-btn .left').on('click', function () {

				if (isEnd) {
					isEnd = false;
					if (index == 0) {
						index = ($('.screen ul li').length - 1) / 2;
						$('.screen ul').animate({'left': -4 * liWidth}, 0);
					}
					index--;

					$('.screen ul').stop().animate({'left': -liWidth * index}, 500, function () {
						isEnd = true;
					});
				}
			});
		})();



		});