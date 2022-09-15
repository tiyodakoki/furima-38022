FactoryBot.define do
  factory :item do
    name  { 'テスト' }
    information { 'テスト２' }
    category_id      { 2 }
    condition_id     { 2 }
    postage_id       { 2 }
    region_id        { 2 }
    shipping_day_id  { 2 }
    price            { 600 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('spec/pictures/test_image.png'), filename: 'test_image.png')
    end
  end
end
