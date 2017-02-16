$(".news-tag>li>a").on("click",function () {
    $(".news-tag>li>a").removeClass("news-active");
    $(this).addClass("news-active");
})