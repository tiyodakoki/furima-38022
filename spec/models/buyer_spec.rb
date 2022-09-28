require 'rails_helper'

RSpec.describe Buyer, type: :model do
  describe '商品購入' do
    before do
      @buyer = FactoryBot.build(:buyer)
    end

    context '購入できるとき' do
      it '必要な情報があれば購入できる' do
        binding.pry

        expect(@buyer).to be_valid
      end
    end
    context '商品購入できないとき' do
      it '購入する商品がないと購入できない' do
        @buyer.item = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('Item must exist')
      end
      it 'userが紐付いていないと登録出来ない' do
        @buyer.user = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include('User must exist')
      end
    end
  end
end
