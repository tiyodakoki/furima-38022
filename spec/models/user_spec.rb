require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザー新規登録" do
    it "nicknameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録出来ない" do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordが6文字以上でないと登録出来ない" do
      user = FactoryBot.build(:user)
      user.password = 'aa11'
      user.password_confirmation = 'aa11'
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordが半角英数字混合でないと登録出来ない" do
      user = FactoryBot.build(:user)
      user.password = 'eee祇園祭'
      user.password_confirmation = 'eee祇園祭'
      user.valid?
      expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it  "再確認のpasswordが一致していないと登録出来ない" do
      user = FactoryBot.build(:user)
      user.password_confirmation = 'guy999'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "first_nameが全角(ひらがな、漢字、カタカナ)でないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = '33'
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it "first_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name is invalid")
    end
    it "last_nameが全角(ひらがな、漢字、カタカナ)でないと登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = '999'
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid")
    end
    it "last_nameが空では登録できない" do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name is invalid")
    end
    it "birthが空では登録できない" do
      user = FactoryBot.build(:user)
      user.birth = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birth can't be blank")
    end
    it "first_name_kanaが全角カタカナでないと登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = '日向'
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end
    it "first_name_kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.first_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name kana is invalid")
    end
    it "last_name_kanaが全角カタカナでないと登録できない" do
      user = FactoryBot.build(:user)
      user.last_name_kana = '小'
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid")
    end
    it "last_name_kanaが空では登録できない" do
      user = FactoryBot.build(:user)
      user.last_name_kana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana is invalid")
    end


  end
end
