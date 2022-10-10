require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '商品出品' do
    context '出品できるとき' do
      it '必要な情報が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it 'nameが空では登録出来ない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'imageが空では登録出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'informationが空では登録出来ない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it 'category_idが空では登録出来ない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'category_idが1では登録出来ない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'condition_idが空では登録出来ない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("状態を入力してください")
      end
      it 'condition_idが1では登録出来ない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("状態を入力してください")
      end
      it 'postage_idが空では登録出来ない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料負担を入力してください")
      end
      it 'postage_idが1では登録出来ない' do
        @item.postage_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料負担を入力してください")
      end
      it 'region_idが空では登録出来ない' do
        @item.region_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'region_idが1では登録出来ない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'shipping_day_idが空では登録出来ない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'shipping_day_idが1では登録出来ない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'priceが空では登録出来ない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが全角では登録出来ない' do
        @item.price = '９９９９'
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は数値で入力してください')
      end

      it 'priceが300以下だと登録出来ない' do
        @item.price = 100
        @item.valid?

        expect(@item.errors.full_messages).to include('価格は300以上の値にしてください')
      end
      it 'priceが99999999以上だと登録出来ない' do
        @item.price = 10_000_000_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('価格は9999999以下の値にしてください')
      end
      it 'userが紐づいていないと登録出来ない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
