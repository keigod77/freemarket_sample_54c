FactoryBot.define do
  factory :item do
    id {1}
    user_id {1}
    name{"ルイヴィトンの長財布"}
    description{"新品未使用です"}
    category_id {3}
    state {1}
    shipping_charge{1}
    delivery_method{1}
    region{"北海道"}
    days_to_delivery {1}
    price {"333"}
    exhibision_state {0}
    
    association :user, factory: :user
    association :category
  end
end 
