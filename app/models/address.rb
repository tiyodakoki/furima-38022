class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :region
  belongs_to :buyer
  with_options presence: true do
    validates :post_code
    validates :region_id, numericality: { other_than: 1, message: "can't be blank" } 
    validates :manicipalities
    validates :address
    validates :phone_number
end


end
