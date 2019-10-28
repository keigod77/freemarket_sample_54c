class HomeController < ApplicationController

  def index
  end
  
  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    # 複数枚画像を取得する際はwhereに変更する
    @image = Image.find_by(item_id: @item.id)
    #一気に取得する書き方ありそう。時間あれば
    @grandchild = Category.find(@item.category_id)
    @child = Category.find(@grandchild.parent_id)
    @parent = Category.find(@child.parent_id)
  end

  def logout
  end
  
end
