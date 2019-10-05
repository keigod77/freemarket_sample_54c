function getContentsLink(clickElement){
  var contentsLink = $(clickElement).find("a").attr("href");
  return contentsLink;
}

function findActiveClass(toggleParent){
  var activeClass = $(toggleParent).find(".active");
  return activeClass;
}

function removeActiveClass(activeClass){
  $(activeClass).removeClass("active");
}

function addActiveClass(clickElement,contentsLink){
  $(clickElement).addClass("active")
  $(contentsLink).addClass("active")
}

$(function(){
    $('.js-toggle').on('click',function(e){
      e.preventDefault();
      var toggleParent = $(this).parents(".js-tabparent")[0];
      var contentsLink = getContentsLink(this);

      //Activeクラスを探して削除する
      removeActiveClass(findActiveClass(toggleParent))

      //Activeクラスを付与する
      addActiveClass(this,contentsLink)
    })
  })