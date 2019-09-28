$(function(){
  $('.notification-todo-tabs').on('mouseenter', function(){
    $('li').on('click',function(e){
      var findActiveID = $(this).parent().find(".active")[0];
      e.preventDefault();
      var ancestorElement= $(this).parents(".js-tabparent")[0];
      var contentLink = $(this).find("a").attr("href");
      //Activeクラスを削除する  
      var findActiveClass = $(ancestorElement).find(".active");
      $(findActiveClass).removeClass('active');

      //Activeクラスを付与する
      $(this).addClass("active")
      $(contentLink).addClass("active")
    })
  })