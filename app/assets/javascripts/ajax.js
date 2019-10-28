$(function(){
  var select_search = $("#js-select-search")

  function appendSelect(selectNum){
    if(selectNum == 1){
      var select_id = 'm_category'

      var mCategoryHTML =
      `<select class="layout-select" name="mcategory" id="${select_id}">
      </select>`

      select_search.append(mCategoryHTML)

    } else if(selectNum == 2){
      var select_id = 's_category'

      var sCategoryHTML =
      `<select class="layout-select" name="category_id" id="${select_id}">
      </select>`

      select_search.append(sCategoryHTML)
    }
  }

  function appendOption(selectOption,selectNum){
    if (selectNum == 1) {
      var appendId = $("#m_category")
    } else if (selectNum == 2) {
      var appendId = $("#s_category")
    }
    appendId.append(
      $("<option>")
        .val($(selectOption).attr('id'))
        .text($(selectOption).attr('name'))
    )
  }

  $("#l_category").on('change', function() {
    l_select = $(this).val()
    $("#m_category, #s_category").remove()

    // ajaxでリクエストを送信
      $.ajax({
        type: "GET",
        url: '/products/search',
        data: {l_select: l_select},
        dataType: 'json'
      })
      // doneメソッドでappendする
      .done(function(m_select) {
        var selectNum = 1
        appendSelect(selectNum)
        m_select.forEach(function(m_select) {
          appendOption(m_select, selectNum)
        })
      })
    })

  $(document).on('change', "#m_category", function() {
    m_select = $(this).val()
    $("#s_category").remove()

    $.ajax({
      type: "GET",
      url: '/products/search',
      data: {m_select: m_select},
      dataType: 'json'
    })
    .done(function(s_select) {
      var selectNum = 2
      appendSelect(selectNum)
      s_select.forEach(function(s_select) {
        appendOption(s_select, selectNum)
      })
    })
  })
})