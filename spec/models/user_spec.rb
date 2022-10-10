require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '必要な情報が存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailに@が含まれていないと登録できない' do
        @user.email = 'bbbbbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが空では登録出来ない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordが6文字以上でないと登録出来ない' do
        @user.password = 'aa11'
        @user.password_confirmation = 'aa11'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが半角英数字混合でないと登録出来ない' do
        @user.password = '333333'
        @user.password_confirmation = '333333'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが半角英数字混合でないと登録出来ない' do
        @user.password = 'eeeaaa'
        @user.password_confirmation = 'eeeaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it 'passwordが全角だと登録出来ない' do
        @user.password = 'ｋｏｋｏ１１'
        @user.password_confirmation = 'ｋｏｋｏ１１'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
      end
      it '再確認のpasswordが一致していないと登録出来ない' do
        @user.password_confirmation = 'guy999'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_nameが全角(ひらがな、漢字、カタカナ)でないと登録できない' do
        @user.first_name = '33'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字は不正な値です')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字を入力してください')
      end
      it 'last_nameが全角(ひらがな、漢字、カタカナ)でないと登録できない' do
        @user.last_name = '999'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'birthが空では登録できない' do
        @user.birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
      it 'first_name_kanaが全角カタカナでないと登録できない' do
        @user.first_name_kana = '日向'
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)は不正な値です')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名字(カナ)を入力してください')
      end
      it 'last_name_kanaが全角カタカナでないと登録できない' do
        @user.last_name_kana = '小'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)は不正な値です')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前(カナ)を入力してください')
      end
    end
  end
end
