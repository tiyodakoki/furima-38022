class BuyerAddress
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :post_code, :region_id, :manicipalities, :address, :building, :phone_number, :buyer_id
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :post_code
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :manicipalities
    validates :address
    validates :buyer
    validates :phone_number

  end
def save
  @buyer = Buyer.create(item_id: item_id, user_id: user.id)
  Addess.create(post_code: post_code, region_id: region_id, manicipalities: manicipalities, address: address, building: building, phone_number: phone_number, buyer_id: buyer_id)
    
  
    
  end