FactoryBot.define do
  factory :tweet do
    title         {"日本でフットサル"}
    place         {"日本スタジアム"}
    address       {"日本"}
    price         {"1"}
    item          {"清涼飲料水"}
    category_id   {"2"}
    field_id      {"2"}
    level_id      {"2"}
    month_id      {"2"}
    day_id        {"2"}
    hour_id       {"2"}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/output-image2.png'), filename: 'output-image2.png')
    end
  end
end
