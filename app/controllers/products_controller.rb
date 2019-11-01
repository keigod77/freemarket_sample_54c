class ProductsController < ApplicationController
  def sell
    @parent_name = Category.getParentCategoriesArray
    @brand_name = Brand.getBrandNamesArray
  end

  def create
    item = Item.create(item_params)
    item.images.create(image: params[:image])
        
    redirect_to root_path
  
  end

  def search
    if params[:l_select]
      @m_select = Category.find_by(name: params[:l_select]).children
    else
      @s_select = Category.find(params[:m_select]).children
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    # 複数枚画像を取得する際はwhereに変更する
    @image = Image.find_by(item_id: @item.id)
    #child, parentは@grandchild.parentで取得可能
    @grandchild = Category.find(@item.category_id)
  end


  private
  
  def item_params
    #item.brandでレコード取得するためbrand_id値調整
    if params[:brand_id].present?
      params[:brand_id] = Brand.find_by(name: params[:brand_id]).id
    end
    params.permit(:name,:description, :category_id, :brand_id, :size, :state, :shipping_charge, :delivery_method, :region, :days_to_delivery, :price).merge(user_id: current_user.id,exhibision_state: 0)
  end
end
