class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :region
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :information
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
    with_options numericality: { other_than: 1, message: "can't be blank" } do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :region_id
      validates :shipping_day_id
    end
  end
end
