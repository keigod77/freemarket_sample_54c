class HomeController < ApplicationController

  def index
  end
  
  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    # 複数枚画像を取得する際はwhereに変更する
    @image = Image.find_by(item_id: @item.id)
    #child, parentは@grandchild.parentで取得可能
    @grandchild = Category.find(@item.category_id)
  end

  def logout
  end
  
end
