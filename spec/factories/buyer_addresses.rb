FactoryBot.define do
  factory :buyer_address do
    post_code    { '222-1111' }
    region_id    { 2 }
    manicipalities { '浜松市' }
    address        { '44-55' }
    phone_number   { 42_344_442_342 }
    building       { '研磨ビル' }
    token          { 'tok_abcdefghijk00000000000000000' }
  end
end
