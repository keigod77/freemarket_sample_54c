class ProductsController < ApplicationController
  def sell
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

    item.images.create(image: params[:image],
                       item_id: item.id
                      )
        
    redirect_to root_path
  end
  private
  def item_params
    params[:category_id] = Category.find_by(name: params[:category_id]).id
    params.permit(:name,:description, :category_id, :brand, :size, :state, :shipping_charge, :delivery_method, :region, :days_to_delivery, :price).merge(user_id: current_user.id,exhibision_state: 0)
  end
end
