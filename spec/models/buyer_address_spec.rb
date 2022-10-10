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
        expect(@buyer_address.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが指定の並び登録出来ない' do
        @buyer_address.post_code = '3333333'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include('郵便番号は不正な値です')
      end
      it 'region_idが空では登録出来ない' do
        @buyer_address.region_id = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'region_idが1では登録出来ない' do
        @buyer_address.region_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'manicipalitiesが空では購入できない' do
        @buyer_address.manicipalities = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("市区町村を入力してください")
      end
      it 'addressが空では登録出来ない' do
        @buyer_address.address = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空では登録出来ない' do
        @buyer_address.phone_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号は、10桁未満だと登録出来ない' do
        @buyer_address.phone_number = '33'
        @buyer_address.valid?

        expect(@buyer_address.errors.full_messages).to include('電話番号は10文字以上で入力してください')
      end
      it '電話番号は12桁以上だと登録出来ない' do
        @buyer_address.phone_number = '333333333333333333'

        @buyer_address.valid?

        expect(@buyer_address.errors.full_messages).to include('電話番号は11文字以内で入力してください')
      end
      it '電話番号は全角だと登録出来ない' do
        @buyer_address.phone_number = '３３３３３３３３３３３'
        @buyer_address.valid?

        expect(@buyer_address.errors.full_messages).to include('電話番号は数値で入力してください')
      end
      it 'tokenが空では登録できないこと' do
        @buyer_address.token = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("カード情報を入力してください")
      end
      it 'user_id（購入者）が空だと購入できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_id（購入商品）が空だと購入できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
