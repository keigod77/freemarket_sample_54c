FactoryBot.define do
  factory :sns_credential do
    provider { "Facebook" }
    uid      { 114514 }
    user_id  { 1 }
  end
end
