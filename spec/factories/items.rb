FactoryBot.define do
  factory :item do
    id {1}
    user_id {1}
    name{"ルイヴィトンの長財布"}
    description{"新品未使用です"}
    category_id {3}
    state {1}
    shipping_charge{"送料込み(出品者負担)"}
    delivery_method{"未定"}
    region{"北海道"}
    days_to_delivery {"1~2日で発送"}
    price {"333"}
    exhibision_state {0}
    
    association :user, factory: :user
    association :category
  end
end 
