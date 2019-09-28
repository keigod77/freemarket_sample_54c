$(function(){
  $('.notification-todo-tabs').on('mouseenter', function(){
    $('li').on('click',function(e){
      var findActiveID = $(this).parent().find(".active")[0];
      e.preventDefault();
      $(findActiveID).removeAttr("class")
      $(this).attr("class","active")
      var contentLink = $(this).find("a").attr("href");
      $(contentLink).attr("class","active")
    })
  })
})