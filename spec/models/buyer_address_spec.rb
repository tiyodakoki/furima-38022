require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.build(:item)
      @item.save

      @buyer_address = FactoryBot.build(:buyer_address, user_id: @user.id, item_id: @item.id)
    end
    context '商品購入できるとき' do
      it '必要な情報があるとき' do
        expect(@buyer_address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'post_codeが空では登録出来ない' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが指定の並び登録出来ない' do
        @buyer_address.post_code = '3333333'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('Post code is invalid')
      end
      it 'region_idが空では登録出来ない' do
        @buyer_address.region_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'region_idが1では登録出来ない' do
        @buyer_address.region_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Region can't be blank")
      end
      it 'manicipalitiesが空では購入できない' do
        @buyer_address.manicipalities = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Manicipalities can't be blank")
      end
      it 'addressが空では登録出来ない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録出来ない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁未満だと登録出来ない' do
        @buyer_address.phone_number = '33'
        @buyer_address.valid?

        expect(@buyer_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it '電話番号は12桁以上だと登録出来ない' do
        @buyer_address.phone_number = '333333333333333333'

        @buyer_address.valid?

        expect(@buyer_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it '電話番号は全角だと登録出来ない' do
        @buyer_address.phone_number = '３３３３３３３３３３３'
        @buyer_address.valid?

        expect(@buyer_address.errors.full_messages).to include('Phone number is not a number')
      end
      it 'tokenが空では登録できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_id（購入者）が空だと購入できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_id（購入商品）が空だと購入できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
