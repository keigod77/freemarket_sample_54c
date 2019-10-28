class HomeController < ApplicationController

  def index
    #レディース
    @ladies_items = Item.eager_load(category: :parent).where(parents_categories:{parent_id:1}).limit(10).order(created_at: "DESC")
    #メンズ
    @mens_items = Item.eager_load(category: :parent).where(parents_categories:{parent_id:2}).limit(10).order(created_at: "DESC")
    #おもちゃ・ホビー・グッズ
    @toy_items = Item.eager_load(category: :parent).where(parents_categories:{parent_id:6}).limit(10).order(created_at: "DESC")
    #家電・スマホ・カメラ
    @machine_items = Item.eager_load(category: :parent).where(parents_categories:{parent_id:8}).limit(10).order(created_at: "DESC")

    #ナイキ
    @nike_items = Item.where(brand_id:2).limit(10).order(created_at: "DESC")
    #シュプリーム
    @supreme_items = Item.where(brand_id:4).limit(10).order(created_at: "DESC")
    #ルイヴィトン
    @louisvuitton_items = Item.where(brand_id:3).limit(10).order(created_at: "DESC")
    #シャネル
    @chanel_items = Item.where(brand_id:1).limit(10).order(created_at: "DESC")
  end
  
  def show
  end

  def logout
  end
end
