$(document).ready(() => {

	$('#help-select').on('change', (ev) => {
		let help_url = $(ev.target).find("option:selected").data('help-url');
		window.location = `${window.location.protocol}//${window.location.host}${help_url}`;
	});

});

$(function () {
	$("img").lazyload({
		effect: "fadeIn"
	});
	$(".lazy").lazyload({
		effect: "fadeIn"
	});
});
$(".article-index").sticky({
	topSpacing: 88,
});

$(document).scroll(function(){

	/* class: article-index :page.toc
     * while window scroll to buttom then disappear; else display article's toc;
     */
	const nav = $(".article-index");
	if ( $(document).scrollTop() * 1.18 > $(document).height()) {
		/*addclass to remove sticky article index*/
		nav.addClass("navbar-hide");
		//console.log($(document).scrollTop(),"compare with:",$(document).height())
		//console.log("here is remove sticky article index!",$(document).scrollTop() * 1.18)
	}
	else{
		/*else to exchange.*/
		nav.removeClass("navbar-hide");
		//console.log($(document).scrollTop(),"compare with:",$(document).height())
		//console.log("show article index")
	}
});

/*
    * 目标： 默认显示一个 当前的样式
    * 点击导航，实现切换
    * key 表示的当前显示的是第几个
    */
// 过滤的类型选择
(function (key) {
	// 获取所有的导航
	var navs = document.querySelectorAll('div b');
	// 遍历 给导航 绑定事件，并且添加当前样式
	for (var i = 0; i < navs.length; i++) {
		// 如果是用户指定的当前样式
		if (key == i) {
			navs[i].classList.add('foucus');
			// 拿到要显示内容section的id
			var secId = navs[i].dataset['cont'];
			// 获取对应的section标签
			document.querySelector('#' + secId).style.display = 'block';
		}
		// 给每一个导航绑定点击事件
		navs[i].onclick = function () {
			var currentNav = document.querySelector('.foucus');
			// 获取对应的内容区域 ，让其隐藏
			var currentId = currentNav.dataset['cont'];
			// 去掉导航的 active 样式
			currentNav.classList.remove('foucus');
			// 对应的内容区域
			document.querySelector('#' + currentId).style.display = 'none';
			// 突出显示自己 导航添加样式  对应的 section 显示 ，给自己添加active样式
			this.classList.add('foucus');
			// 对应的section模块显示出来
			var myId = this.dataset['cont'];
			document.querySelector('#' + myId).style.display = 'block';
		}
	}
})(0);

/*
* ----------------------------------------------------------------------------------------------------------
* TODO: 按钮点击展开ul事件测试
* ----------------------------------------------------------------------------------------------------------
 */
// ----------------------------------------------------------------------------------------------------------
// 2.	按钮点击展开ul事件测试2



// ----------------------------------------------------------------------------------------------------------
// 1.	按钮点击展开ul事件测试1 多个按钮点击会同时展开关闭
// $(function(){
// 	$(".fold-button").click(function(){
// 		$(".fold-box").slideToggle("slow");
// 		$(".open").toggle();
// 		$(".close").toggle();
// 	});
// });
// ----------------------------------------------------------------------------------------------------------


// $(function () {
// 	$(".footer-row button").click(function(){
// 		var $this = $(this);
// 		if($this.hasClass("rotate-90")) {
// 			$this.removeClass("rotate-90").addClass("rotate-270").val("收起");
// 		} else {
// 			$this.removeClass("rotate-270").addClass("rotate-90").val("展开");
// 		}
// 	});
// });

// $(document).ready(function(){
//
// 	var preResult = $('.ul dn').height();
// 	var pre = $('.ul dn-ns').height();
// 	$(".dn-m").click(function() {
// 		if ($this.hasClass("dn dn-ns dn-m")) {
// 			$this.removeClass("dn dn-ns dn-m").addClass("db db-ns db-m").val("收起");
// 		} else {
// 			$this.removeClass("db db-ns db-m").addClass("dn dn-ns dn-m").val("展开");
// 		}
// 	});
// });

/*
* ----------------------------------------------------------------------------------------------------------
* ----------------------------------------------------------------------------------------------------------
 */

// $(function() {
// 	$(".footer-row button").click(function(){
// 		var $this = $(this);
// 		if($this.hasClass("rotate-90")) {
// 			$this.removeClass("rotate-90").addClass("rotate-270").val("收起");
// 		} else {
// 			$this.removeClass("rotate-270").addClass("rotate-90").val("展开");
// 		}
// 		$(".div ul").click(function(){
// 			// var $this = $(this);
// 			if($this.hasClass("dn dn-ns dn-m")) {
// 				$this.removeClass("dn dn-ns dn-m").addClass("db db-ns db-m").val("收起");
// 			} else {
// 				$this.removeClass("db db-ns db-m").addClass("dn dn-ns dn-m").val("展开");
// 			}
// 		});
// 	});
// });

// vim: ts=2 sts=2 sw=2 noexpandtab