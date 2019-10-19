$(function(){
  function calculateCommission(price, COMMISSION_BASE){
    return Math.floor(price * COMMISSION_BASE)
  }
  //販売手数料と利益を表示する部分
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

  //画像をアップロードする部分
  var preview = `<div class="preview"></div>`
  $upload = $(".upload-field")
  var itemCount = 0;
  //アイテムの所持数に応じて変化する変数。(itemが2個の時:item-2)
  var itemStatusClass ="item-0";
  $preview = $(".preview");

  var uploadimg = `<li>
                    <img src="">
                    <div class=edit-delete-box>
                      <a>編集</a>
                      <a class="js-delete-btn">削除</a>
                    </div>
                  </li>`

  function readURL(input, $target){
    if(input.files && input.files[0]){
      var reader = new FileReader();

      reader.onload = function(e){
        $target.find("img").last().attr('src',e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#js-upload-img").on("change",function(e){
    $target = $preview.last().find("ul");

    for(var i = 0; i < e.target.files.length; i++){
      var img = e.target.files[i];
      reader = new FileReader();
      //itemクラスを削除する
      $target.removeClass(itemStatusClass)
      $upload.removeClass(itemStatusClass)
      //アイテム数をカウントする
      itemCount++
      //コンテナのアイテム数に応じてクラス名を動的に変化させる
      itemStatusClass = "item-" + itemCount
      //itemクラスを追加する
      $target.addClass(itemStatusClass);
      $upload.addClass(itemStatusClass);
      //li要素を追加
      $target.append(uploadimg)
      readURL(this, $target);
      //itemが5個の時アイテムコンテナを追加,10個の時ファイルフィールド削除
      if(itemCount == 5){
        if($(".preview").length == 1){
          $preview.after(preview);
          //プレビュー要素が追加されたので$previewを再定義する
          $preview = $(".preview")
          $preview.last().append('<ul class="img-container item-0"></ul>')
          $upload.removeClass(itemStatusClass)
          //新たなプレビュー要素の初期アイテム数をセット
          itemCount = 0;
          itemStatusClass = "item-0";
          $upload.addClass(itemStatusClass)
        }else{
          $(".upload-field").remove()
       }
      }
    }
  })
})