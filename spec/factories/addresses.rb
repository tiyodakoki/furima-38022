FactoryBot.define do
  factory :address do
    post_code    { '222-1111' }
    region_id    { 2 }
    manicipalities { '浜松市' }
    address        { '44-55' }
    phone_number   { '42344442342' }
    building       { '研磨ビル' }
    association :buyer
  end
end
