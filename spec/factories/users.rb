FactoryBot.define do
  factory :user do
    id                    {"1"}
    nickname              {"yamada"}
    email                 {"yamada@gmail.com"}
    password              {"yamada000"}
    password_confirmation {"yamada000"}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_kana       {"タロウ"}
    last_name_kana        {"ヤマダ"}
    birthday_year         {"2000"}
    birthday_month        {"7"}
    birthday_day          {"10"}
    phone_number          {"1234567"}
  end
end
