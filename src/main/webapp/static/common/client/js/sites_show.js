/**
 * Created by Bing on 2016/12/27.
 */
$(function(){
	$(".ul_one>li>a>span").mouseenter(function () {
	    $(".ul_one>li>a>span").removeClass("active");
	    $(this).addClass("active");
	    var tag = $(".ul_one>li>a>span").index(this);
	    var el = $(".nav_two .ul_two").eq(tag);
	    $(".nav_two .ul_two").removeClass("current");
	    $(el).addClass("current");
	})
	$(".second-nav").mouseenter(function () {
	    $(this).addClass("active2");
	    var index = $(".second-nav").index(this);
	    $(".ul-three").removeClass("current2");
	    $(".ul-three").eq(index).addClass("current2");

	})
	$(".second-nav").mouseleave(function () {
		$(this).removeClass("active2");
	})
	$(".nav_two .ul_two>li").mouseleave(function () {
	    $(".second-nav").removeClass("active2");
	    $(".ul-three").removeClass("current2");
	})

	$(".nav_two .ul_two").mouseenter(function () {
	    var index =  $(".nav_two .ul_two").index(this);
	    $(".ul_one>li>a>span").eq(index).addClass("active");
	})
	$(".nav_two .ul_two").mouseleave(function () {
	    $(this).removeClass("current");
	    var index =  $(".nav_two .ul_two").index(this);
	    $(".ul_one>li>a>span").eq(index).removeClass("active");
	})
	$("header").mouseleave(function () {
	    $(".nav_two .ul_two").removeClass("current");
	    $(".ul_one>li>a>span").removeClass("active");
	})
	$(".dropdown-toggle").hover(function () {
    $(this).css({"color":"#f00"});
	},function () {
    $(this).css({"color":"#999"})});
});
