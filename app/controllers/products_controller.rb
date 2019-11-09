class ProductsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show]
  before_action :authenticate_user!, only: [:sell]
  before_action :no_image_is_back, only: :create

  def sell
    @parent_name = Category.getParentCategoriesArray
    @brand_name = Brand.getBrandNamesArray
  end

  def edit
    @parent_name = Category.getParentCategoriesArray
    @children_name = Category.getChildrenCategoriesArray(@item.category.parent.parent_id)
    @grandchildren_name = Category.getGrandchildrenCategoriesArray(@item.category.parent_id)
    @brand_name = Brand.getBrandNamesArray
  end

  def create
    binding.pry
    item = Item.create(item_params)
    item.images.create(image: params[:image])
        
    redirect_to root_path
  end
  
  def update
    if current_user.id == @item.user_id
      @item.update(update_item_params)
      if params[:item][:image].present?
        @item.images.delete_all
        @item.images.create(image: params[:item][:image])
      end
    end
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
    # 複数枚画像を取得する際はwhereに変更する
    @image = @item.images.first
    #child, parentは@grandchild.parentで取得可能
    @grandchild = Category.find(@item.category_id)
  end

  def destroy
    image = @item.images
    if current_user.id == item.user_id
      image.delete_all
      item.delete
    end
    redirect_to root_path
  end


  private
  
  def item_params
    #item.brandでレコード取得するためbrand_id値調整
    if params[:brand_id].present?
      params[:brand_id] = Brand.find_by(name: params[:brand_id]).id
    end
    params.permit(:name,:description, :category_id, :brand_id, :size, :state, :shipping_charge, :delivery_method, :region, :days_to_delivery, :price).merge(user_id: current_user.id,exhibision_state: 0)
  end

  def update_item_params
    if params[:item][:brand_id].present?
      params[:item][:brand_id] = Brand.find_by(name: params[:item][:brand_id]).id
    end
    params.require(:item).permit(:name,:description, :category_id, :brand_id, :size, :state, :shipping_charge, :delivery_method, :region, :days_to_delivery, :price).merge(user_id: current_user.id,exhibision_state: 0)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(@item.user_id)
  end

  def no_image_is_back
    redirect_to sell_products_path, flash: {no_image: "画像は必須です"} unless params[:image]
  end
end
