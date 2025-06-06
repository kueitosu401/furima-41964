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
    it '文字と数字を含めなければ登録できない' do
      @user.password = 'password12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it '姓のカナは空欄にできない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "first_name_kana can't be blank"
    end
    it '姓の漢字は空欄にできない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "first_name can't be blank"
    end
    it '名カナは空欄にできない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "last_name_kana can't be blank"
    end
    it '名漢字は空欄にできない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "last_name can't be blank"
    end
  end
end
