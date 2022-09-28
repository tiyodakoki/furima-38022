require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '商品購入' do
    before do
      @address = FactoryBot.build(:address)
    end
    context '商品購入できるとき' do
      it '必要な情報があるとき' do
        expect(@address).to be_valid
      end
    end
    context '商品購入できないとき' do
      it 'post_codeが空では登録出来ない' do
        @address.post_code = '333'
        binding.pry
        @address.valid?
        expect(@address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'region_idが空では登録出来ない' do
        @address.region_id = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Region can't be blank")
      end
      it 'region_idが空では登録出来ない' do
        @address.region_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include("Region can't be blank")
      end
      it 'manicipalitiesが空では購入できない' do
        @address.manicipalities = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Manicipalities can't be blank")
      end
      it 'addressが空では登録出来ない' do
        @address.address = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では登録出来ない' do
        @address.phone_number = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと' do
        @address.phone_number = 'hhh'
        @address.valid?

        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
    end
  end
end
