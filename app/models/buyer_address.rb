class BuyerAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :region_id, :manicipalities, :address, :building, :phone_number, :buyer_id, :token
  with_options presence: true do

    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :manicipalities
    validates :address
    validates :phone_number, numericality: { only_integer: true}, length: {minimum: 10, maximum: 11}
    validates :user_id
    validates :item_id
end

def save
   @buyer = Buyer.create(item_id: item_id, user_id: user_id)
   Address.create(post_code: post_code, region_id: region_id, manicipalities: manicipalities, address: address, building: building, phone_number: phone_number, buyer_id: @buyer.id)
end
end