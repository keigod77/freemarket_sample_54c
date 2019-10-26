class ProductsController < ApplicationController
  def sell
  end

  def create
    #カテゴリーがDB上に存在しない場合新規に作成する
    if Category.where(name: params[:parent_category]).empty? then
      Category.create(name: params[:parent_category])
      Category.create(name: params[:children_category], parent_id: Category.find_by(name: params[:parent_category]).id)
      Category.create(name: params[:grandchildren_category], parent_id: Category.find_by(name: params[:children_category]).id)

    elsif Category.where(name: params[:children_category]).empty? then
      Category.create(name: params[:children_category], parent_id: Category.find_by(name: params[:parent_category]).id)
      Category.create(name: params[:grandchildren_category], parent_id: Category.find_by(name: params[:children_category]).id)

    elsif Category.where(name: params[:grandchildren_category]).empty? then
      Category.create(name: params[:grandchildren_category], parent_id: Category.find_by(name: params[:children_category]).id)
    end


    item = Item.create(user:             current_user,
                      name:             params[:product_name],
                      description:      params[:description],
                      category_id:         Category.find_by(name: params[:grandchildren_category]).id,
                      brand_id:            params[:brand],
                      size_id:             params[:size],
                      state:            params[:state],
                      shipping_charge:  params[:shipping_charge],
                      delivery_method:  params[:delivery_method],
                      region:           params[:region],
                      days_to_delivery: params[:days_to_delivery],
                      price:            params[:price],
                      exhibision_state: 0
                    )

    item.images.create(image: params[:image],
                       item_id: item.id
                      )
        
    redirect_to root_path
  end
end
