$(function(){
  function calculateCommission(price, COMMISSION_BASE){
    return Math.floor(price * COMMISSION_BASE)
  }

  var p = new RegExp('^[1-9]\\d{0,6}$'); //1~9,999,999までの値
  var priceForm = $("#js-price-form");
  const COMMISSION_BASE = 0.1;

  priceForm.on("keyup",function(){
    price = Number(priceForm.val().match(p)); //フォームで入力した値をmatchし結果をNumberオブジェクト化する
    if (price >= 300){
      var commission = calculateCommission(price, COMMISSION_BASE)
      $("#js-commission-price").html("¥" + commission.toLocaleString())
      $("#js-price").html("¥" + (price - commission).toLocaleString())
    }else{
      $("#js-commission-price").html("&#45;")
      $("#js-price").html("&#45;")
    }
  })
})