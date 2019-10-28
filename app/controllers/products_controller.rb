class ProductsController < ApplicationController
  def sell
    parent_category = Category.where(parent_id: nil)
    @parent_name = []
    for i in parent_category do
      @parent_name << i.name
    end
  end

  def create
    item = Item.create!(item_params)
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

  private
  
  def item_params
    params.permit(:name,:description, :category_id, :brand, :size, :state, :shipping_charge, :delivery_method, :region, :days_to_delivery, :price).merge(user_id: current_user.id,exhibision_state: 0)
  end
end
