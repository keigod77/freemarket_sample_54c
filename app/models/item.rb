class Item < ApplicationRecord
  has_many :images, dependent: :delete_all
  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true;
  belongs_to :size, optional: true;

  validates :name, presence: true
  validates :description, presence: true
  validates :shipping_charge, presence: true
  validates :state, presence: true
  validates :delivery_method, presence: true
  validates :region, presence: true
  validates :days_to_delivery, presence: true
  validates :price, presence: true

  enum state:{
    新品、未使用:1,未使用に近い:2,目立った傷や汚れなし:3,
    やや傷や汚れあり:4,傷や汚れあり:5,全体的に状態が悪い:6
  }

  enum shipping_charge:{
    送料込み（出品者負担）:1, 着払い（購入者負担）:2
  }

  enum delivery_method:{
    未定:1,らくらくメルカリ便:2,ゆうメール:3,
    レターパック:4,普通郵便（定形、定形外）:5,クロネコヤマト:6,
    ゆうパック:7,クリックポスト:8,ゆうパケット:9
  }

  enum days_to_delivery:{
    １〜２日で発送:1, ２〜３日で発送:2, ４〜７日で発送:3
  }

  def getShippingCharge
    if self.shipping_charge == '送料込み（出品者負担）'
      return shipping_charge[0..3]
    else
      return shipping_charge[0..2]
    end
  end
end
