$(function(){
  var largeimg = $('.product__image--large');
  var smallimg = $('.product__image--small');
  var imgLink

  smallimg.children('img').on('click',function(){
    smallimg.children('img').css('opacity', '0.6');
    $(this).css('opacity', '1');
    
    imgLink = $(this).attr('src');
    largeimg.children('img').attr('src', imgLink)
  })
})