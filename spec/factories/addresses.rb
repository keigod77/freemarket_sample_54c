FactoryBot.define do
  factory :address do
    user_id      { "1" }
    postal_code  { "123456" }
    prefectures  { "北海道" }
    city         { "札幌市" }
    address      { "札幌町" }
    building     { "札幌ビル" }
  end
end
