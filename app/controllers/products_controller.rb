class ProductsController < ApplicationController
  def sell
    parent_category = Category.where(parent_id: nil)
    @parent_name = []
    for i in parent_category do
      @parent_name << i.name
    end
  end

  def create
    #rake db:seedでカテゴリーを初期値を設定するのでコメントアウトする
    #カテゴリーがDB上に存在しない場合新規に作成する
    #if Category.where(name: params[:parent_category]).empty? then
    #  Category.create(name: params[:parent_category])
    #  Category.create(name: params[:children_category], parent_id: Category.find_by(name: params[:parent_category]).id)
    #  Category.create(name: params[:grandchildren_category], parent_id: Category.find_by(name: params[:children_category]).id)

    #elsif Category.where(name: params[:children_category]).empty? then
    #  Category.create(name: params[:children_category], parent_id: Category.find_by(name: params[:parent_category]).id)
    #  Category.create(name: params[:category], parent_id: Category.find_by(name: params[:children_category]).id)

    #elsif Category.where(name: params[:grandchildren_category]).empty? then
    #  Category.create(name: params[:category], parent_id: Category.find_by(name: params[:children_category]).id)
    #end
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

  private
  
  def item_params
    params.permit(:name,:description, :category_id, :brand, :size, :state, :shipping_charge, :delivery_method, :region, :days_to_delivery, :price).merge(user_id: current_user.id,exhibision_state: 0)
  end
end
