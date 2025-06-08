require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordが短すぎでは登録できない' do
      @user.password = '12345'
    end
    it '数字を含めなければ登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birth can't be blank"
    end
     it '文字を含めなければ登録できない' do
      @user.password = 'password'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana is invalid"
    end
    it '姓のカナは空欄にできない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '姓の漢字は空欄にできない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it '名カナは空欄にできない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it '名漢字は空欄にできない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'password_confirmationと一致していないと登録できないこと'do
      @user.password_confirmation = 'invalid'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation does not match password"
    end
    it '半角文字が含まれている場合は登録できないこと' do
      @user.first_name = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it '半角文字が含まれている場合は登録できないこと' do
      @user.last_name = 'あいうえお'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it 'カタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できないこと' do
      @user.first_name = 'アイウエオ'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name is invalid"
    end
    it 'カタカナ以外の文字（ひらがなや漢字）が含まれている場合は登録できないこと' do
      @user.last_name = 'アイウエオ'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name is invalid"
    end
    it '生年月日が空だと登録できないこと' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birth can't be blank"
    end
    it '重複している場合登録できないこと' do
      @user.email = FactoryBot.build(:user).email
      @user.valid?
      expect(@user.errors.full_messages).to include "Email address is already taken"
    end
    it '@が含まれていないと登録できないこと' do
      @user.email = 'invalid'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end
  end
end
