FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password}
    password_confirmation {password}
    first_name            {"てすと"}
    second_name           {"一郎"}
    first_kana            {"テスト"}
    second_kana           {"イチロウ"}
    birthday              {"2020-01-01"}

  end
end