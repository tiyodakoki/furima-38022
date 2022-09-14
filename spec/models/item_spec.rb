require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)

  end
  describe "商品出品" do

  it "nameが空では登録出来ない" do
  @item.name = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("Name can't be blank")
  end
  it "informationが空では登録出来ない" do
  @item.information = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("Information can't be blank")
  end
  it "category_idが空では登録出来ない" do
  @item.category_id = ""
  @item.valid?
  expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it "category_idが1では登録出来ない" do
  @item.category_id = 1
  @item.valid?
  expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it "condition_idが空では登録出来ない" do
    @item.condition_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
  it "condition_idが1では登録出来ない" do
    @item.condition_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
  it "postage_idが空では登録出来ない" do
    @item.postage_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
  it "postage_idが1では登録出来ない" do
    @item.postage_id =  1
    @item.valid?
    expect(@item.errors.full_messages).to include("Postage can't be blank")
          end      
  it "region_idが空では登録出来ない" do
    @item.region_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Region can't be blank")
        end
  it "region_idが1では登録出来ない" do
    @item.region_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Region can't be blank")
              end
  it "shipping_day_idが空では登録出来ない" do
    @item.shipping_day_id = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
          end
  it "shipping_day_idが1では登録出来ない" do
    @item.shipping_day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
            end
  it "priceが空では登録出来ない" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
              end   
  it "priceが300以下だと登録出来ない" do
    @item.price =  100
    @item.valid?
    
    expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
                          end   
  it "priceが99999999以上だと登録出来ない" do
    @item.price =  10000000000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
        end                             

  

end                               
  
  
end
