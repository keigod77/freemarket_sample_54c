document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != nil) {
      Payjp.setPublickey("pk_test_728dc124874b9816288533f2");
      let btn = document.getElementById("token_submit");
      btn.addEventListener("click", e => {
        e.preventDefault();
        // card情報取得
        let card = {
          number: document.getElementById("card_number").Value,
          cvc: document.getElementById("cvc").Value,
          exp_month: document.getElementById("exp_month").value,
          exp_year: document.getElementById("exp_year").value
        
        }
        // トークン作成
        Payjp.createToken(card, (status, response) =>{
          if (status == 200) {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name"); 
            $("#card_token").append(
              $('<input type="hidden" name="payjp-token">').val(response.id)
            ); //トークンを送信できるように隠しタグを生成
            document.inputForm.submit();
            alert("登録が完了しました");
          } else {
            alert("カード情報が正しくありません")
          }
        });
      });
    }
  }, false);